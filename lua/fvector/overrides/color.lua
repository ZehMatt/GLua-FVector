local Color_Meta = FindMetaTable("Color")
local original_ToVector = Color_Meta.ToVector
function Color_Meta:ToVector()
    local v0 = original_ToVector(self)
    v0 = VectorToFVector(v0)
    return v0
end
