local Player_Meta = FindMetaTable("Player")
local original_GetAimVector = Player_Meta.GetAimVector
function Player_Meta:GetAimVector()
    local v0 = original_GetAimVector(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetCurrentViewOffset = Player_Meta.GetCurrentViewOffset
function Player_Meta:GetCurrentViewOffset()
    local v0 = original_GetCurrentViewOffset(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetEyeTraceNoCursor = Player_Meta.GetEyeTraceNoCursor
function Player_Meta:GetEyeTraceNoCursor()
    local v0 = original_GetEyeTraceNoCursor(self)
    v0.HitNormal = VectorToFVector(v0.HitNormal)
    v0.HitPos = VectorToFVector(v0.HitPos)
    v0.Normal = VectorToFVector(v0.Normal)
    v0.StartPos = VectorToFVector(v0.StartPos)
    return v0
end
local original_GetHull = Player_Meta.GetHull
function Player_Meta:GetHull()
    local v0, v1 = original_GetHull(self)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetHullDuck = Player_Meta.GetHullDuck
function Player_Meta:GetHullDuck()
    local v0, v1 = original_GetHullDuck(self)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetPlayerColor = Player_Meta.GetPlayerColor
function Player_Meta:GetPlayerColor()
    local v0 = original_GetPlayerColor(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetShootPos = Player_Meta.GetShootPos
function Player_Meta:GetShootPos()
    local v0 = original_GetShootPos(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetViewOffset = Player_Meta.GetViewOffset
function Player_Meta:GetViewOffset()
    local v0 = original_GetViewOffset(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetViewOffsetDucked = Player_Meta.GetViewOffsetDucked
function Player_Meta:GetViewOffsetDucked()
    local v0 = original_GetViewOffsetDucked(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetWeaponColor = Player_Meta.GetWeaponColor
function Player_Meta:GetWeaponColor()
    local v0 = original_GetWeaponColor(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_MotionSensorPos = Player_Meta.MotionSensorPos
function Player_Meta:MotionSensorPos(bone)
    local v0 = original_MotionSensorPos(self, bone)
    v0 = VectorToFVector(v0)
    return v0
end
local original_SetCurrentViewOffset = Player_Meta.SetCurrentViewOffset
function Player_Meta:SetCurrentViewOffset(viewOffset)
    viewOffset = FVectorToVector(viewOffset)
    original_SetCurrentViewOffset(self, viewOffset)
end
local original_SetHull = Player_Meta.SetHull
function Player_Meta:SetHull(hullMins, hullMaxs)
    hullMins = FVectorToVector(hullMins)
    hullMaxs = FVectorToVector(hullMaxs)
    original_SetHull(self, hullMins, hullMaxs)
end
local original_SetHullDuck = Player_Meta.SetHullDuck
function Player_Meta:SetHullDuck(hullMins, hullMaxs)
    hullMins = FVectorToVector(hullMins)
    hullMaxs = FVectorToVector(hullMaxs)
    original_SetHullDuck(self, hullMins, hullMaxs)
end
local original_SetPlayerColor = Player_Meta.SetPlayerColor
function Player_Meta:SetPlayerColor(Color)
    Color = FVectorToVector(Color)
    original_SetPlayerColor(self, Color)
end
local original_SetViewOffset = Player_Meta.SetViewOffset
function Player_Meta:SetViewOffset(viewOffset)
    viewOffset = FVectorToVector(viewOffset)
    original_SetViewOffset(self, viewOffset)
end
local original_SetViewOffsetDucked = Player_Meta.SetViewOffsetDucked
function Player_Meta:SetViewOffsetDucked(viewOffset)
    viewOffset = FVectorToVector(viewOffset)
    original_SetViewOffsetDucked(self, viewOffset)
end
local original_SetWeaponColor = Player_Meta.SetWeaponColor
function Player_Meta:SetWeaponColor(Color)
    Color = FVectorToVector(Color)
    original_SetWeaponColor(self, Color)
end
if SERVER then
    local original_DropNamedWeapon = Player_Meta.DropNamedWeapon
    function Player_Meta:DropNamedWeapon(class, target, velocity)
        if target ~= nil then
            target = FVectorToVector(target)
        end
        if velocity ~= nil then
            velocity = FVectorToVector(velocity)
        end
        original_DropNamedWeapon(self, class, target, velocity)
    end
    local original_DropWeapon = Player_Meta.DropWeapon
    function Player_Meta:DropWeapon(weapon, target, velocity)
        if target ~= nil then
            target = FVectorToVector(target)
        end
        if velocity ~= nil then
            velocity = FVectorToVector(velocity)
        end
        original_DropWeapon(self, weapon, target, velocity)
    end
    local original_SprayDecal = Player_Meta.SprayDecal
    function Player_Meta:SprayDecal(sprayOrigin, sprayEndPos)
        sprayOrigin = FVectorToVector(sprayOrigin)
        sprayEndPos = FVectorToVector(sprayEndPos)
        original_SprayDecal(self, sprayOrigin, sprayEndPos)
    end
    local original_TraceHullAttack = Player_Meta.TraceHullAttack
    function Player_Meta:TraceHullAttack(startPos, endPos, mins, maxs, damage, damageFlags, damageForce, damageAllNPCs)
        startPos = FVectorToVector(startPos)
        endPos = FVectorToVector(endPos)
        mins = FVectorToVector(mins)
        maxs = FVectorToVector(maxs)
        local v0 = original_TraceHullAttack(self, startPos, endPos, mins, maxs, damage, damageFlags, damageForce, damageAllNPCs)
        return v0
    end
    
end
