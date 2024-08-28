AddCSLuaFile()

local function CompareFloat(a, b)
    -- Lua uses double precision floating point numbers, so we need to compare them with a small epsilon.
    local v = math.abs(a - b)
    return v < 0.01
end

local function PerformTest(name, lhs, rhs, func)
    if func == nil then
        -- Single parameter means we're testing a unary operation.
        func = rhs
    end
    local a = FVector(lhs.x, lhs.y, lhs.z)
    local b
    if type(rhs) == "table" then
        b = FVector(rhs.x, rhs.y, rhs.z)
    else
        b = rhs
    end
    local r1 = func(a, b)

    local c = Vector(lhs.x, lhs.y, lhs.z)
    local d
    if type(rhs) == "table" then
        d = Vector(rhs.x, rhs.y, rhs.z)
    else
        d = rhs
    end
    local r2 = func(c, d)

    local succ, err = pcall(function()
        if (istable(r1) or isvector(r2)) and (istable(r2) or isvector(r2)) then
            assert(CompareFloat(r1.x, r2.x), "r1.x (" .. tostring(r1.x) .. ") != r2.x (" .. tostring(r2.x) .. ")")
            assert(CompareFloat(r1.y, r2.y), "r1.y (" .. tostring(r1.y) .. ") != r2.y (" .. tostring(r2.y) .. ")")
            assert(CompareFloat(r1.z, r2.z), "r1.z (" .. tostring(r1.z) .. ") != r2.z (" .. tostring(r2.z) .. ")")
        else
            assert(CompareFloat(r1, r2), "r1 (" .. tostring(r1) .. ") != r2 (" .. tostring(r2) .. ")")
        end
    end)

    if not succ then
        print(name .. ": Test failed: " .. err)
    else
        print(name .. ": Test passed.")
    end
end

local Tests = {
    TestAdd = {
        { x = 1366, y = 222, z = 3333 },
        { x = 4, y = 5, z = 6 },
        function(a, b) return a + b end,
    },
    TestAddSelf = {
        { x = 1366, y = 222, z = 3333 },
        { x = 4, y = 5, z = 6 },
        function(a, b) a:Add(b) return a end,
    },
    TestMul = {
        { x = 1366, y = 222, z = 3333 },
        { x = 4, y = 5, z = 6 },
        function(a, b) return a * b end,
    },
    TestMulSelf = {
        { x = 1366, y = 222, z = 3333 },
        22.5,
        function(a, b) a:Mul(b) return a end,
    },
    TestMulScalar = {
        { x = 1366, y = 222, z = 3333 },
        22.5,
        function(a, b) return a * b end,
    },
    TestDiv = {
        { x = 1366, y = 222, z = 3333 },
        { x = 4, y = 5, z = 6 },
        function(a, b) return a / b end,
    },
    TestDivScalar = {
        { x = 1366, y = 222, z = 3333 },
        6.3,
        function(a, b) return a / b end,
    },
    TestDivSelf = {
        { x = 1366, y = 222, z = 3333 },
        22.5,
        function(a, b) a:Div(b) return a end,
    },
    TestDistance = {
        { x = 1366, y = 222, z = 3333 },
        { x = 4, y = 5, z = 6 },
        function(a, b) return a:Distance(b) end,
    },
    TestDistance2D = {
        { x = 1366, y = 222, z = 3333 },
        { x = 4, y = 5, z = 6 },
        function(a, b) return a:Distance2D(b) end,
    },
    TestDot = {
        { x = 1366, y = 222, z = 3333 },
        { x = 4, y = 5, z = 6 },
        function(a, b) return a:Dot(b) end,
    },
    TestCross = {
        { x = 1366, y = 222, z = 3333 },
        { x = 4, y = 5, z = 6 },
        function(a, b) return a:Dot(b) end,
    },
    TestNormalize = {
        { x = 1366, y = 222, z = 3333 },
        function(a) a:Normalize() return a end,
    },
    TestGetNormalized = {
        { x = 1366, y = 222, z = 3333 },
        function(a) return a:GetNormalized() end,
    },
    TestNegate = {
        { x = 1366, y = 222, z = 3333 },
        function(a) a:Negate() return a end,
    },
    TestGetNegated = {
        { x = 1366, y = 222, z = 3333 },
        function(a) return a:GetNegated() end,
    },
    TestLength = {
        { x = 1366, y = 222, z = 3333 },
        function(a) return a:Length() end,
    },
    TestLengthSqr = {
        { x = 1366, y = 222, z = 3333 },
        function(a) return a:LengthSqr() end,
    },
    TestLength2D = {
        { x = 1366, y = 222, z = 3333 },
        function(a) return a:Length2D() end,
    },
    TestLength2DSqr = {
        { x = 1366, y = 222, z = 3333 },
        function(a) return a:Length2DSqr() end,
    },
}

function RunFVectorTests()
    for name, test in pairs(Tests) do
        pcall(function()
            PerformTest(name, unpack(test))
        end)
    end
end