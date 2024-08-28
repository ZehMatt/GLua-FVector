local PathFollower_Meta = FindMetaTable("PathFollower")
if SERVER then
    local original_Compute = PathFollower_Meta.Compute
    function PathFollower_Meta:Compute(bot, goal, generator)
        goal = FVectorToVector(goal)
        local v0 = original_Compute(self, bot, goal, generator)
        return v0
    end
    local original_GetClosestPosition = PathFollower_Meta.GetClosestPosition
    function PathFollower_Meta:GetClosestPosition(position)
        position = FVectorToVector(position)
        local v0 = original_GetClosestPosition(self, position)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetEnd = PathFollower_Meta.GetEnd
    function PathFollower_Meta:GetEnd()
        local v0 = original_GetEnd(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetPositionOnPath = PathFollower_Meta.GetPositionOnPath
    function PathFollower_Meta:GetPositionOnPath(distance)
        local v0 = original_GetPositionOnPath(self, distance)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetStart = PathFollower_Meta.GetStart
    function PathFollower_Meta:GetStart()
        local v0 = original_GetStart(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_MoveCursorToClosestPosition = PathFollower_Meta.MoveCursorToClosestPosition
    function PathFollower_Meta:MoveCursorToClosestPosition(pos, type, alongLimit)
        pos = FVectorToVector(pos)
        original_MoveCursorToClosestPosition(self, pos, type, alongLimit)
    end
    
end
