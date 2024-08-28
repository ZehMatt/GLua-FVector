local CNavLadder_Meta = FindMetaTable("CNavLadder")
if SERVER then
    local original_GetBottom = CNavLadder_Meta.GetBottom
    function CNavLadder_Meta:GetBottom()
        local v0 = original_GetBottom(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetNormal = CNavLadder_Meta.GetNormal
    function CNavLadder_Meta:GetNormal()
        local v0 = original_GetNormal(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetPosAtHeight = CNavLadder_Meta.GetPosAtHeight
    function CNavLadder_Meta:GetPosAtHeight(height)
        local v0 = original_GetPosAtHeight(self, height)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetTop = CNavLadder_Meta.GetTop
    function CNavLadder_Meta:GetTop()
        local v0 = original_GetTop(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    
end
