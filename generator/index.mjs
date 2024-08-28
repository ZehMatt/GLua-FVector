import { WikiApiClient, WikiScraper } from 'gmod-wiki-scraper';
import fs from 'fs';

var _cachedClasses = null;
var _cachedLibraries = null;
var _cachedStructures = null;

async function getClasses() {
    if (_cachedClasses !== null) {
        return _cachedClasses;
    }
    // Load the data/classes.json file, if missing fetch it and save it to the file.
    if (fs.existsSync('data/classes.json')) {
        const data = fs.readFileSync('data/classes.json');
        _cachedClasses = JSON.parse(data);
        return _cachedClasses;
    }

    const client = new WikiApiClient();
    const scraper = new WikiScraper(client);

    // Fetch the classes.
    _cachedClasses = await scraper.getClasses();

    // Save the classes to the data/classes.json file.
    fs.writeFileSync('data/classes.json', JSON.stringify(_cachedClasses, null, 2));

    return _cachedClasses;
}

async function getLibraries() {
    if (_cachedLibraries !== null) {
        return _cachedLibraries;
    }

    // Load the data/libraries.json file, if missing fetch it and save it to the file.
    if (fs.existsSync('data/libraries.json')) {
        const data = fs.readFileSync('data/libraries.json');
        _cachedLibraries = JSON.parse(data);
        return _cachedLibraries;
    }

    const client = new WikiApiClient();
    const scraper = new WikiScraper(client);

    // Fetch the libraries.
    _cachedLibraries = await scraper.getLibraries();

    // Save the libraries to the data/libraries.json file.
    fs.writeFileSync('data/libraries.json', JSON.stringify(_cachedLibraries, null, 2));

    return _cachedLibraries;
}

async function getStructures() {
    if (_cachedStructures !== null) {
        return _cachedStructures;
    }
    // Load the data/structures.json file, if missing fetch it and save it to the file.
    if (fs.existsSync('data/structures.json')) {
        const data = fs.readFileSync('data/structures.json');
        _cachedStructures = JSON.parse(data);
        return _cachedStructures;
    }

    const client = new WikiApiClient();
    const scraper = new WikiScraper(client);

    // Fetch the structures.
    _cachedStructures = await scraper.getStructs();

    // Save the structures to the data/structures.json file.
    fs.writeFileSync('data/structures.json', JSON.stringify(_cachedStructures, null, 2));

    return _cachedStructures;
}

function getStructByName(name) {
    if (_cachedStructures === null) {
        throw new Error('Structures not loaded');
    }
    return _cachedStructures.find(entry => entry.name === name);
}

function getStructType(arg) {
    // Attempt to extract the struct type out of the description, its typically:
    // See (?the) <page>Structures/*name*</page>
    const matches = arg.description.match(/See.*<page>Structures\/(.*?)<\/page>/);
    if (matches) {
        const structName = matches[1];
        return getStructByName(structName);
    }
    return null;
}

function argUsesType(arg, typeName) {
    if(arg.type == typeName) {
        return true;
    }
    if(arg.type == 'table') {
        const structInfo = getStructType(arg);
        if (structInfo) {
            return structInfo.fields.some(field => field.type === typeName);
        }
    }
    return false;
}

function isFunctionUsingType(func, typeName) {
    if (func.arguments !== undefined && func.arguments.some(arg => argUsesType(arg, typeName))) {
        return true;
    }
    if (func.returnValues !== undefined && func.returnValues.some(ret => argUsesType(ret, typeName))) {
        return true;
    }
    return false;
}

function createConverters(code, entries, converter, makeCopy) {
    // Apply FVector to Vector conversations to arguments.
    entries.forEach(arg => {
        if (arg.type === 'Vector') {
            if (arg.default !== undefined) {
                code += `    if ${arg.name} ~= nil then\n`;
                code += `        ${arg.name} = ${converter}(${arg.name})\n`;
                code += `    end\n`;
            } else {
                code += `    ${arg.name} = ${converter}(${arg.name})\n`;
            }
        } else if (arg.type == 'table') {
            const structInfo = getStructType(arg);
            if (structInfo) {
                const structFields = structInfo.fields;
                var madeCopy = false;
                structFields.forEach(field => {
                    if (field.type === 'Vector') {
                        if (makeCopy && !madeCopy) {
                            // Don't mutate the original table.
                            code += `    ${arg.name} = table.Copy(${arg.name})\n`;
                            madeCopy = true;
                        }
                        if (arg.default !== undefined) {
                            code += `    if ${arg.name}.${field.name} ~= nil then\n`;
                            code += `        ${arg.name}.${field.name} = ${converter}(${arg.name}.${field.name})\n`;
                            code += `    end\n`;
                        } else {
                            code += `    ${arg.name}.${field.name} = ${converter}(${arg.name}.${field.name})\n`;
                        }
                    }
                });
            }
        }
    });
    return code
}

function sanitizeName(name, index) {
    if (name === undefined || name === '') {
        return `v${index}`;
    }
    if (name === 'end') {
        return 'end_';
    }
    return name;
}

function writeFunctionWrapper(code, func, metaTableName, isClass) {

    code += `local original_${func.name} = ${metaTableName}.${func.name}\n`;

    const funcArgs = func.arguments !== undefined ? func.arguments : [];
    // Make sure all arguments have a name.
    funcArgs.forEach((arg, index) => {
        arg.name = sanitizeName(arg.name, index);
    });

    const callArgs = isClass ? [{ name: 'self' }].concat(funcArgs) : [...funcArgs];
    const funcReturns = func.returnValues !== undefined ? [...func.returnValues] : [];

    // Make sure all returns have a name.
    funcReturns.forEach((ret, index) => {
        ret.name = sanitizeName(ret.name, index);
    });

    const funcArgsStr = funcArgs.map(arg => arg.name).join(', ');
    const callArgsStr = callArgs.map(arg => arg.name).join(', ');

    if (isClass) {
        code += `function ${metaTableName}:${func.name}(${funcArgsStr})\n`;
    } else {
        code += `function ${metaTableName}.${func.name}(${funcArgsStr})\n`;
    }

    // Apply FVector to Vector conversations to arguments.
    code = createConverters(code, funcArgs, "FVectorToVector", true);

    if (funcReturns.length > 0) {
        const returns = funcReturns.map(ret => ret.name).join(', ');
        code += `    local ${returns} = original_${func.name}(${callArgsStr})\n`;

        // Apply Vector to FVector conversations.
        code = createConverters(code, funcReturns, "VectorToFVector", false);

        code += `    return ${returns}\n`;
    } else {
        code += `    original_${func.name}(${callArgsStr})\n`;
    }
    code += `end\n`;

    return code
}

function isRealmClient(func) {
    if (func.realms !== undefined) {
        return func.realms.includes('client');
    }
    return false;
}

function isRealmServer(func) {
    if (func.realms !== undefined) {
        return func.realms.includes('server');
    }
    return false;
}

function isRealmShared(func) {
    return isRealmClient(func) && isRealmServer(func);
}

async function generateClassFunctions(classes, metaName) {
    // Get the entry where name matches the metaName.
    const classInfo = classes.find(entry => entry.name === metaName);
    if (!classInfo) {
        throw new Error(`Meta class ${metaName} not found`);
    }

    const metaTableName = `${metaName}_Meta`;

    var generated = '';
    generated += `local ${metaTableName} = FindMetaTable("${metaName}")\n`;

    var generatedClient = '';
    var generatedServer = '';
    var generatedShared = '';

    classInfo.functions.forEach(func => {
        // Check if the function uses any of the types we want to override.
        if (!isFunctionUsingType(func, 'Vector')) {
            return;
        }

        if (isRealmShared(func)) {
            generatedShared = writeFunctionWrapper(generatedShared, func, metaTableName, true);
        } else if (isRealmClient(func)) {
            generatedClient = writeFunctionWrapper(generatedClient, func, metaTableName, true);
        } else if (isRealmServer(func)) {
            generatedServer = writeFunctionWrapper(generatedServer, func, metaTableName, true);
        }
    });

    // Shared
    generated += generatedShared;

    // Server
    if (generatedServer !== '') {
        generated += 'if SERVER then\n';
        generated += generatedServer.replace(/^/gm, '    ');
        generated += '\nend\n';
    }

    // Client
    if (generatedClient !== '') {
        generated += 'if CLIENT then\n';
        generated += generatedClient.replace(/^/gm, '    ');
        generated += '\nend\n';
    }

    return generated;
}

async function generateClassOverrides(overrideFiles) {

    const classes = await getClasses();

    const overrides = [
        'Entity',
        'Player',
        'NPC',
        'Vehicle',
        'IMaterial',
        'PhysObj',
        'PhysCollide',
        'NextBot',
        'Panel',
        'PathFollower',
        'VMatrix',
        'Weapon',
        'CEffectData',
        'CLuaParticle',
        'CLuaEmitter',
        'CNavArea',
        'CNavLadder',
        'CNewParticleEffect',
        'CRecipientFilter',
        'ConVar',
        'CSEnt',
        'CSoundPatch',
        'CTakeDamageInfo',
        'CUserCmd',
        'IMesh',
        'Color',
    ]

    for (const metaName of overrides) {
        const generated = await generateClassFunctions(classes, metaName);

        const fileName = metaName.toLowerCase();
        fs.writeFileSync(`overrides/${fileName}.lua`, generated);

        overrideFiles.push(fileName);
    }
}

async function generateLibraryFunctions(libraries, metaName) {
    // Get the entry where name matches the metaName.
    const classInfo = libraries.find(entry => entry.name === metaName);
    if (!classInfo) {
        throw new Error(`Library ${metaName} not found`);
    }

    const metaTableName = metaName;

    var generated = '';

    var generatedClient = '';
    var generatedServer = '';
    var generatedShared = '';

    classInfo.functions.forEach(func => {
        // Check if the function uses any of the types we want to override.
        if (!isFunctionUsingType(func, 'Vector')) {
            return;
        }

        if (isRealmShared(func)) {
            generatedShared = writeFunctionWrapper(generatedShared, func, metaTableName, false);
        } else if (isRealmClient(func)) {
            generatedClient = writeFunctionWrapper(generatedClient, func, metaTableName, false);
        } else if (isRealmServer(func)) {
            generatedServer = writeFunctionWrapper(generatedServer, func, metaTableName, false);
        }
    });

    // Shared
    generated += generatedShared;

    // Server
    if (generatedServer !== '') {
        generated += 'if SERVER then\n';
        generated += generatedServer.replace(/^/gm, '    ');
        generated += '\nend\n';
    }

    // Client
    if (generatedClient !== '') {
        generated += 'if CLIENT then\n';
        generated += generatedClient.replace(/^/gm, '    ');
        generated += '\nend\n';
    }

    return generated;
}

async function generateLibraryOverrides(overrideFiles) {

    const libraries = await getLibraries();

    const overrides = [
        'util',
        'render',
    ]

    for (const metaName of overrides) {
        const generated = await generateLibraryFunctions(libraries, metaName);

        const fileName = metaName.toLowerCase();
        fs.writeFileSync(`overrides/${fileName}.lua`, generated);

        overrideFiles.push(fileName);
    }
}

async function generateOverrideIndex(overrideFiles) {
    var generated = '';
    overrideFiles.forEach(fileName => {
        generated += `AddCSLuaFile('fvector/overrides/${fileName}.lua')\n`;
    });

    overrideFiles.forEach(fileName => {
        generated += `include('fvector/overrides/${fileName}.lua')\n`;
    });

    fs.writeFileSync('overrides/overrides.lua', generated);
}

function setupDirectories() {
    const dirs = ['overrides', 'data'];
    dirs.forEach(dir => {
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir);
        }
    });
}

async function preloadData() {
    await getClasses();
    await getLibraries();
    await getStructures();
}

async function main() {
    setupDirectories();

    await preloadData();

    var overrideFiles = [];

    // Generate class overrides.
    await generateClassOverrides(overrideFiles);

    // Generate class overrides.
    await generateLibraryOverrides(overrideFiles);

    // Write an entry overrides.lua file.
    await generateOverrideIndex(overrideFiles);
}

main();