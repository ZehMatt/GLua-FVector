local CNavArea_Meta = FindMetaTable("CNavArea")
if SERVER then
    local original_AddHidingSpot = CNavArea_Meta.AddHidingSpot
    function CNavArea_Meta:AddHidingSpot(pos, flags)
        pos = FVectorToVector(pos)
        original_AddHidingSpot(self, pos, flags)
    end
    local original_ComputeDirection = CNavArea_Meta.ComputeDirection
    function CNavArea_Meta:ComputeDirection(pos)
        pos = FVectorToVector(pos)
        local v0 = original_ComputeDirection(self, pos)
        return v0
    end
    local original_Contains = CNavArea_Meta.Contains
    function CNavArea_Meta:Contains(pos)
        pos = FVectorToVector(pos)
        local v0 = original_Contains(self, pos)
        return v0
    end
    local original_GetCenter = CNavArea_Meta.GetCenter
    function CNavArea_Meta:GetCenter()
        local v0 = original_GetCenter(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetClosestPointOnArea = CNavArea_Meta.GetClosestPointOnArea
    function CNavArea_Meta:GetClosestPointOnArea(pos)
        pos = FVectorToVector(pos)
        local v0 = original_GetClosestPointOnArea(self, pos)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetCorner = CNavArea_Meta.GetCorner
    function CNavArea_Meta:GetCorner(cornerid)
        local v0 = original_GetCorner(self, cornerid)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetRandomPoint = CNavArea_Meta.GetRandomPoint
    function CNavArea_Meta:GetRandomPoint()
        local v0 = original_GetRandomPoint(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetZ = CNavArea_Meta.GetZ
    function CNavArea_Meta:GetZ(pos)
        pos = FVectorToVector(pos)
        local v0 = original_GetZ(self, pos)
        return v0
    end
    local original_IsOverlapping = CNavArea_Meta.IsOverlapping
    function CNavArea_Meta:IsOverlapping(pos, tolerance)
        pos = FVectorToVector(pos)
        local v0 = original_IsOverlapping(self, pos, tolerance)
        return v0
    end
    local original_IsPartiallyVisible = CNavArea_Meta.IsPartiallyVisible
    function CNavArea_Meta:IsPartiallyVisible(pos, ignoreEnt)
        pos = FVectorToVector(pos)
        local v0 = original_IsPartiallyVisible(self, pos, ignoreEnt)
        return v0
    end
    local original_IsVisible = CNavArea_Meta.IsVisible
    function CNavArea_Meta:IsVisible(pos)
        pos = FVectorToVector(pos)
        local v0, v1 = original_IsVisible(self, pos)
        v1 = VectorToFVector(v1)
        return v0, v1
    end
    local original_SetCorner = CNavArea_Meta.SetCorner
    function CNavArea_Meta:SetCorner(corner, position)
        position = FVectorToVector(position)
        original_SetCorner(self, corner, position)
    end
    
end
