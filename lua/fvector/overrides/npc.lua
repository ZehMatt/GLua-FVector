local NPC_Meta = FindMetaTable("NPC")
if SERVER then
    local original_DropWeapon = NPC_Meta.DropWeapon
    function NPC_Meta:DropWeapon(weapon, target, velocity)
        if target ~= nil then
            target = FVectorToVector(target)
        end
        if velocity ~= nil then
            velocity = FVectorToVector(velocity)
        end
        original_DropWeapon(self, weapon, target, velocity)
    end
    local original_GetAimVector = NPC_Meta.GetAimVector
    function NPC_Meta:GetAimVector()
        local v0 = original_GetAimVector(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetArrivalDirection = NPC_Meta.GetArrivalDirection
    function NPC_Meta:GetArrivalDirection()
        local v0 = original_GetArrivalDirection(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetCurWaypointPos = NPC_Meta.GetCurWaypointPos
    function NPC_Meta:GetCurWaypointPos()
        local v0 = original_GetCurWaypointPos(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetEnemyLastKnownPos = NPC_Meta.GetEnemyLastKnownPos
    function NPC_Meta:GetEnemyLastKnownPos(enemy)
        local pos = original_GetEnemyLastKnownPos(self, enemy)
        pos = VectorToFVector(pos)
        return pos
    end
    local original_GetEnemyLastSeenPos = NPC_Meta.GetEnemyLastSeenPos
    function NPC_Meta:GetEnemyLastSeenPos(enemy)
        local pos = original_GetEnemyLastSeenPos(self, enemy)
        pos = VectorToFVector(pos)
        return pos
    end
    local original_GetGoalPos = NPC_Meta.GetGoalPos
    function NPC_Meta:GetGoalPos()
        local v0 = original_GetGoalPos(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetMoveVelocity = NPC_Meta.GetMoveVelocity
    function NPC_Meta:GetMoveVelocity()
        local v0 = original_GetMoveVelocity(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetNextWaypointPos = NPC_Meta.GetNextWaypointPos
    function NPC_Meta:GetNextWaypointPos()
        local v0 = original_GetNextWaypointPos(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetShootPos = NPC_Meta.GetShootPos
    function NPC_Meta:GetShootPos()
        local v0 = original_GetShootPos(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetViewOffset = NPC_Meta.GetViewOffset
    function NPC_Meta:GetViewOffset()
        local v0 = original_GetViewOffset(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_MoveClimbExec = NPC_Meta.MoveClimbExec
    function NPC_Meta:MoveClimbExec(destination, dir, distance, yaw, left)
        destination = FVectorToVector(destination)
        dir = FVectorToVector(dir)
        local v0 = original_MoveClimbExec(self, destination, dir, distance, yaw, left)
        return v0
    end
    local original_MoveClimbStart = NPC_Meta.MoveClimbStart
    function NPC_Meta:MoveClimbStart(destination, dir, distance, yaw)
        destination = FVectorToVector(destination)
        dir = FVectorToVector(dir)
        original_MoveClimbStart(self, destination, dir, distance, yaw)
    end
    local original_MoveJumpStart = NPC_Meta.MoveJumpStart
    function NPC_Meta:MoveJumpStart(vel)
        vel = FVectorToVector(vel)
        original_MoveJumpStart(self, vel)
    end
    local original_MoveOrder = NPC_Meta.MoveOrder
    function NPC_Meta:MoveOrder(position)
        position = FVectorToVector(position)
        original_MoveOrder(self, position)
    end
    local original_NavSetGoal = NPC_Meta.NavSetGoal
    function NPC_Meta:NavSetGoal(pos, length, dir)
        pos = FVectorToVector(pos)
        dir = FVectorToVector(dir)
        local v0 = original_NavSetGoal(self, pos, length, dir)
        return v0
    end
    local original_NavSetGoalPos = NPC_Meta.NavSetGoalPos
    function NPC_Meta:NavSetGoalPos(pos)
        pos = FVectorToVector(pos)
        local v0 = original_NavSetGoalPos(self, pos)
        return v0
    end
    local original_NavSetGoalTarget = NPC_Meta.NavSetGoalTarget
    function NPC_Meta:NavSetGoalTarget(target, offset)
        if offset ~= nil then
            offset = FVectorToVector(offset)
        end
        local v0 = original_NavSetGoalTarget(self, target, offset)
        return v0
    end
    local original_NavSetRandomGoal = NPC_Meta.NavSetRandomGoal
    function NPC_Meta:NavSetRandomGoal(minPathLength, dir)
        dir = FVectorToVector(dir)
        local v0 = original_NavSetRandomGoal(self, minPathLength, dir)
        return v0
    end
    local original_SetArrivalDirection = NPC_Meta.SetArrivalDirection
    function NPC_Meta:SetArrivalDirection(dir)
        dir = FVectorToVector(dir)
        original_SetArrivalDirection(self, dir)
    end
    local original_SetLastPosition = NPC_Meta.SetLastPosition
    function NPC_Meta:SetLastPosition(Position)
        Position = FVectorToVector(Position)
        original_SetLastPosition(self, Position)
    end
    local original_SetMoveVelocity = NPC_Meta.SetMoveVelocity
    function NPC_Meta:SetMoveVelocity(vel)
        vel = FVectorToVector(vel)
        original_SetMoveVelocity(self, vel)
    end
    local original_SetViewOffset = NPC_Meta.SetViewOffset
    function NPC_Meta:SetViewOffset(v0)
        v0 = FVectorToVector(v0)
        original_SetViewOffset(self, v0)
    end
    local original_UpdateEnemyMemory = NPC_Meta.UpdateEnemyMemory
    function NPC_Meta:UpdateEnemyMemory(enemy, pos)
        pos = FVectorToVector(pos)
        original_UpdateEnemyMemory(self, enemy, pos)
    end
    
end
