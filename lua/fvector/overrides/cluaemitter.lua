local CLuaEmitter_Meta = FindMetaTable("CLuaEmitter")
if CLIENT then
    local original_Add = CLuaEmitter_Meta.Add
    function CLuaEmitter_Meta:Add(material, position)
        position = FVectorToVector(position)
        local v0 = original_Add(self, material, position)
        return v0
    end
    local original_GetPos = CLuaEmitter_Meta.GetPos
    function CLuaEmitter_Meta:GetPos()
        local v0 = original_GetPos(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_SetBBox = CLuaEmitter_Meta.SetBBox
    function CLuaEmitter_Meta:SetBBox(mins, maxs)
        mins = FVectorToVector(mins)
        maxs = FVectorToVector(maxs)
        original_SetBBox(self, mins, maxs)
    end
    local original_SetPos = CLuaEmitter_Meta.SetPos
    function CLuaEmitter_Meta:SetPos(position)
        position = FVectorToVector(position)
        original_SetPos(self, position)
    end
    
end
