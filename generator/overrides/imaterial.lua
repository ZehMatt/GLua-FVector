local IMaterial_Meta = FindMetaTable("IMaterial")
local original_GetVector = IMaterial_Meta.GetVector
function IMaterial_Meta:GetVector(materialVector)
    local v0 = original_GetVector(self, materialVector)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetVectorLinear = IMaterial_Meta.GetVectorLinear
function IMaterial_Meta:GetVectorLinear(materialVector)
    local v0 = original_GetVectorLinear(self, materialVector)
    v0 = VectorToFVector(v0)
    return v0
end
local original_SetVector = IMaterial_Meta.SetVector
function IMaterial_Meta:SetVector(MaterialVector, vec)
    vec = FVectorToVector(vec)
    original_SetVector(self, MaterialVector, vec)
end
