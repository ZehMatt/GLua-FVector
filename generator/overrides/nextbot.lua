local NextBot_Meta = FindMetaTable("NextBot")
if SERVER then
    local original_FindSpot = NextBot_Meta.FindSpot
    function NextBot_Meta:FindSpot(type, options)
        local v0 = original_FindSpot(self, type, options)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetRangeSquaredTo = NextBot_Meta.GetRangeSquaredTo
    function NextBot_Meta:GetRangeSquaredTo(to)
        to = FVectorToVector(to)
        local v0 = original_GetRangeSquaredTo(self, to)
        return v0
    end
    local original_GetRangeTo = NextBot_Meta.GetRangeTo
    function NextBot_Meta:GetRangeTo(to)
        to = FVectorToVector(to)
        local v0 = original_GetRangeTo(self, to)
        return v0
    end
    local original_MoveToPos = NextBot_Meta.MoveToPos
    function NextBot_Meta:MoveToPos(pos, options)
        pos = FVectorToVector(pos)
        local v0 = original_MoveToPos(self, pos, options)
        return v0
    end
    
end
