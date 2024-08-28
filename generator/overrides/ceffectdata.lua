local CEffectData_Meta = FindMetaTable("CEffectData")
local original_GetNormal = CEffectData_Meta.GetNormal
function CEffectData_Meta:GetNormal()
    local v0 = original_GetNormal(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetOrigin = CEffectData_Meta.GetOrigin
function CEffectData_Meta:GetOrigin()
    local v0 = original_GetOrigin(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetStart = CEffectData_Meta.GetStart
function CEffectData_Meta:GetStart()
    local v0 = original_GetStart(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_SetNormal = CEffectData_Meta.SetNormal
function CEffectData_Meta:SetNormal(normal)
    normal = FVectorToVector(normal)
    original_SetNormal(self, normal)
end
local original_SetOrigin = CEffectData_Meta.SetOrigin
function CEffectData_Meta:SetOrigin(origin)
    origin = FVectorToVector(origin)
    original_SetOrigin(self, origin)
end
local original_SetStart = CEffectData_Meta.SetStart
function CEffectData_Meta:SetStart(start)
    start = FVectorToVector(start)
    original_SetStart(self, start)
end
