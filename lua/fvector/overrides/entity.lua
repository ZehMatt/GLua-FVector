local Entity_Meta = FindMetaTable("Entity")
local original_DispatchTraceAttack = Entity_Meta.DispatchTraceAttack
function Entity_Meta:DispatchTraceAttack(damageInfo, traceRes, dir)
    traceRes = table.Copy(traceRes)
    traceRes.HitNormal = FVectorToVector(traceRes.HitNormal)
    traceRes.HitPos = FVectorToVector(traceRes.HitPos)
    traceRes.Normal = FVectorToVector(traceRes.Normal)
    traceRes.StartPos = FVectorToVector(traceRes.StartPos)
    if dir ~= nil then
        dir = FVectorToVector(dir)
    end
    original_DispatchTraceAttack(self, damageInfo, traceRes, dir)
end
local original_EyePos = Entity_Meta.EyePos
function Entity_Meta:EyePos()
    local v0 = original_EyePos(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_FireBullets = Entity_Meta.FireBullets
function Entity_Meta:FireBullets(bulletInfo, suppressHostEvents)
    bulletInfo = table.Copy(bulletInfo)
    bulletInfo.Dir = FVectorToVector(bulletInfo.Dir)
    bulletInfo.Spread = FVectorToVector(bulletInfo.Spread)
    bulletInfo.Src = FVectorToVector(bulletInfo.Src)
    original_FireBullets(self, bulletInfo, suppressHostEvents)
end
local original_GetAbsVelocity = Entity_Meta.GetAbsVelocity
function Entity_Meta:GetAbsVelocity()
    local v0 = original_GetAbsVelocity(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetAttachment = Entity_Meta.GetAttachment
function Entity_Meta:GetAttachment(attachmentId)
    local v0 = original_GetAttachment(self, attachmentId)
    v0.Pos = VectorToFVector(v0.Pos)
    return v0
end
local original_GetBaseVelocity = Entity_Meta.GetBaseVelocity
function Entity_Meta:GetBaseVelocity()
    local v0 = original_GetBaseVelocity(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetBonePosition = Entity_Meta.GetBonePosition
function Entity_Meta:GetBonePosition(boneIndex)
    local v0, v1 = original_GetBonePosition(self, boneIndex)
    v0 = VectorToFVector(v0)
    return v0, v1
end
local original_GetBrushPlane = Entity_Meta.GetBrushPlane
function Entity_Meta:GetBrushPlane(id)
    local v0, v1, v2 = original_GetBrushPlane(self, id)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1, v2
end
local original_GetCollisionBounds = Entity_Meta.GetCollisionBounds
function Entity_Meta:GetCollisionBounds()
    local v0, v1 = original_GetCollisionBounds(self)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetDTVector = Entity_Meta.GetDTVector
function Entity_Meta:GetDTVector(key)
    local v0 = original_GetDTVector(self, key)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetForward = Entity_Meta.GetForward
function Entity_Meta:GetForward()
    local v0 = original_GetForward(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetHitBoxBounds = Entity_Meta.GetHitBoxBounds
function Entity_Meta:GetHitBoxBounds(hitbox, set)
    local v0, v1 = original_GetHitBoxBounds(self, hitbox, set)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetLocalPos = Entity_Meta.GetLocalPos
function Entity_Meta:GetLocalPos()
    local v0 = original_GetLocalPos(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetManipulateBonePosition = Entity_Meta.GetManipulateBonePosition
function Entity_Meta:GetManipulateBonePosition(boneId)
    local v0 = original_GetManipulateBonePosition(self, boneId)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetManipulateBoneScale = Entity_Meta.GetManipulateBoneScale
function Entity_Meta:GetManipulateBoneScale(boneID)
    local v0 = original_GetManipulateBoneScale(self, boneID)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetModelBounds = Entity_Meta.GetModelBounds
function Entity_Meta:GetModelBounds()
    local v0, v1 = original_GetModelBounds(self)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetModelRenderBounds = Entity_Meta.GetModelRenderBounds
function Entity_Meta:GetModelRenderBounds()
    local v0, v1 = original_GetModelRenderBounds(self)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetNetworkedVector = Entity_Meta.GetNetworkedVector
function Entity_Meta:GetNetworkedVector(key, fallback)
    if fallback ~= nil then
        fallback = FVectorToVector(fallback)
    end
    local v0 = original_GetNetworkedVector(self, key, fallback)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetNetworkOrigin = Entity_Meta.GetNetworkOrigin
function Entity_Meta:GetNetworkOrigin()
    local v0 = original_GetNetworkOrigin(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetPos = Entity_Meta.GetPos
function Entity_Meta:GetPos()
    local v0 = original_GetPos(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetRight = Entity_Meta.GetRight
function Entity_Meta:GetRight()
    local v0 = original_GetRight(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetRotatedAABB = Entity_Meta.GetRotatedAABB
function Entity_Meta:GetRotatedAABB(min, max)
    min = FVectorToVector(min)
    max = FVectorToVector(max)
    local v0, v1 = original_GetRotatedAABB(self, min, max)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetSequenceMovement = Entity_Meta.GetSequenceMovement
function Entity_Meta:GetSequenceMovement(sequenceId, startCycle, endCyclnde)
    local v0, v1, v2 = original_GetSequenceMovement(self, sequenceId, startCycle, endCyclnde)
    v1 = VectorToFVector(v1)
    return v0, v1, v2
end
local original_GetSequenceVelocity = Entity_Meta.GetSequenceVelocity
function Entity_Meta:GetSequenceVelocity(sequenceId, cycle)
    local v0 = original_GetSequenceVelocity(self, sequenceId, cycle)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetSurroundingBounds = Entity_Meta.GetSurroundingBounds
function Entity_Meta:GetSurroundingBounds()
    local v0, v1 = original_GetSurroundingBounds(self)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetUp = Entity_Meta.GetUp
function Entity_Meta:GetUp()
    local v0 = original_GetUp(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetVelocity = Entity_Meta.GetVelocity
function Entity_Meta:GetVelocity()
    local v0 = original_GetVelocity(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GibBreakClient = Entity_Meta.GibBreakClient
function Entity_Meta:GibBreakClient(force, clr)
    force = FVectorToVector(force)
    original_GibBreakClient(self, force, clr)
end
local original_GibBreakServer = Entity_Meta.GibBreakServer
function Entity_Meta:GibBreakServer(force)
    force = FVectorToVector(force)
    original_GibBreakServer(self, force)
end
local original_IsLineOfSightClear = Entity_Meta.IsLineOfSightClear
function Entity_Meta:IsLineOfSightClear(target)
    target = FVectorToVector(target)
    local v0 = original_IsLineOfSightClear(self, target)
    return v0
end
local original_IsPointInBounds = Entity_Meta.IsPointInBounds
function Entity_Meta:IsPointInBounds(point)
    point = FVectorToVector(point)
    local v0 = original_IsPointInBounds(self, point)
    return v0
end
local original_LocalToWorld = Entity_Meta.LocalToWorld
function Entity_Meta:LocalToWorld(lpos)
    lpos = FVectorToVector(lpos)
    local v0 = original_LocalToWorld(self, lpos)
    v0 = VectorToFVector(v0)
    return v0
end
local original_ManipulateBonePosition = Entity_Meta.ManipulateBonePosition
function Entity_Meta:ManipulateBonePosition(boneID, pos, networking)
    pos = FVectorToVector(pos)
    original_ManipulateBonePosition(self, boneID, pos, networking)
end
local original_ManipulateBoneScale = Entity_Meta.ManipulateBoneScale
function Entity_Meta:ManipulateBoneScale(boneID, scale)
    scale = FVectorToVector(scale)
    original_ManipulateBoneScale(self, boneID, scale)
end
local original_NearestPoint = Entity_Meta.NearestPoint
function Entity_Meta:NearestPoint(position)
    position = FVectorToVector(position)
    local v0 = original_NearestPoint(self, position)
    v0 = VectorToFVector(v0)
    return v0
end
local original_OBBCenter = Entity_Meta.OBBCenter
function Entity_Meta:OBBCenter()
    local v0 = original_OBBCenter(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_OBBMaxs = Entity_Meta.OBBMaxs
function Entity_Meta:OBBMaxs()
    local v0 = original_OBBMaxs(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_OBBMins = Entity_Meta.OBBMins
function Entity_Meta:OBBMins()
    local v0 = original_OBBMins(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_PhysicsInitBox = Entity_Meta.PhysicsInitBox
function Entity_Meta:PhysicsInitBox(mins, maxs, surfaceprop)
    mins = FVectorToVector(mins)
    maxs = FVectorToVector(maxs)
    local v0 = original_PhysicsInitBox(self, mins, maxs, surfaceprop)
    return v0
end
local original_SetAbsVelocity = Entity_Meta.SetAbsVelocity
function Entity_Meta:SetAbsVelocity(velocity)
    velocity = FVectorToVector(velocity)
    original_SetAbsVelocity(self, velocity)
end
local original_SetCollisionBounds = Entity_Meta.SetCollisionBounds
function Entity_Meta:SetCollisionBounds(mins, maxs)
    mins = FVectorToVector(mins)
    maxs = FVectorToVector(maxs)
    original_SetCollisionBounds(self, mins, maxs)
end
local original_SetCollisionBoundsWS = Entity_Meta.SetCollisionBoundsWS
function Entity_Meta:SetCollisionBoundsWS(vec1, vec2)
    vec1 = FVectorToVector(vec1)
    vec2 = FVectorToVector(vec2)
    original_SetCollisionBoundsWS(self, vec1, vec2)
end
local original_SetDTVector = Entity_Meta.SetDTVector
function Entity_Meta:SetDTVector(key, vec)
    vec = FVectorToVector(vec)
    original_SetDTVector(self, key, vec)
end
local original_SetEyeTarget = Entity_Meta.SetEyeTarget
function Entity_Meta:SetEyeTarget(pos)
    pos = FVectorToVector(pos)
    original_SetEyeTarget(self, pos)
end
local original_SetLocalPos = Entity_Meta.SetLocalPos
function Entity_Meta:SetLocalPos(pos)
    pos = FVectorToVector(pos)
    original_SetLocalPos(self, pos)
end
local original_SetLocalVelocity = Entity_Meta.SetLocalVelocity
function Entity_Meta:SetLocalVelocity(velocity)
    velocity = FVectorToVector(velocity)
    original_SetLocalVelocity(self, velocity)
end
local original_SetNetworked2Vector = Entity_Meta.SetNetworked2Vector
function Entity_Meta:SetNetworked2Vector(key, value)
    value = FVectorToVector(value)
    original_SetNetworked2Vector(self, key, value)
end
local original_SetNetworkedVector = Entity_Meta.SetNetworkedVector
function Entity_Meta:SetNetworkedVector(key, value)
    if value ~= nil then
        value = FVectorToVector(value)
    end
    original_SetNetworkedVector(self, key, value)
end
local original_SetNetworkOrigin = Entity_Meta.SetNetworkOrigin
function Entity_Meta:SetNetworkOrigin(origin)
    origin = FVectorToVector(origin)
    original_SetNetworkOrigin(self, origin)
end
local original_SetNW2Vector = Entity_Meta.SetNW2Vector
function Entity_Meta:SetNW2Vector(key, value)
    value = FVectorToVector(value)
    original_SetNW2Vector(self, key, value)
end
local original_SetNWVector = Entity_Meta.SetNWVector
function Entity_Meta:SetNWVector(key, value)
    value = FVectorToVector(value)
    original_SetNWVector(self, key, value)
end
local original_SetPos = Entity_Meta.SetPos
function Entity_Meta:SetPos(position)
    position = FVectorToVector(position)
    original_SetPos(self, position)
end
local original_SetSurroundingBounds = Entity_Meta.SetSurroundingBounds
function Entity_Meta:SetSurroundingBounds(min, max)
    min = FVectorToVector(min)
    max = FVectorToVector(max)
    original_SetSurroundingBounds(self, min, max)
end
local original_SetVelocity = Entity_Meta.SetVelocity
function Entity_Meta:SetVelocity(velocity)
    velocity = FVectorToVector(velocity)
    original_SetVelocity(self, velocity)
end
local original_WorldSpaceAABB = Entity_Meta.WorldSpaceAABB
function Entity_Meta:WorldSpaceAABB()
    local v0, v1 = original_WorldSpaceAABB(self)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_WorldSpaceCenter = Entity_Meta.WorldSpaceCenter
function Entity_Meta:WorldSpaceCenter()
    local v0 = original_WorldSpaceCenter(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_WorldToLocal = Entity_Meta.WorldToLocal
function Entity_Meta:WorldToLocal(wpos)
    wpos = FVectorToVector(wpos)
    local v0 = original_WorldToLocal(self, wpos)
    v0 = VectorToFVector(v0)
    return v0
end
if SERVER then
    local original_BodyTarget = Entity_Meta.BodyTarget
    function Entity_Meta:BodyTarget(origin, noisy)
        origin = FVectorToVector(origin)
        local v0 = original_BodyTarget(self, origin, noisy)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_Dissolve = Entity_Meta.Dissolve
    function Entity_Meta:Dissolve(type, magnitude, origin)
        if origin ~= nil then
            origin = FVectorToVector(origin)
        end
        original_Dissolve(self, type, magnitude, origin)
    end
    local original_GetGroundSpeedVelocity = Entity_Meta.GetGroundSpeedVelocity
    function Entity_Meta:GetGroundSpeedVelocity()
        local v0 = original_GetGroundSpeedVelocity(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_HeadTarget = Entity_Meta.HeadTarget
    function Entity_Meta:HeadTarget(origin)
        origin = FVectorToVector(origin)
        local v0 = original_HeadTarget(self, origin)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_SetRagdollPos = Entity_Meta.SetRagdollPos
    function Entity_Meta:SetRagdollPos(boneid, pos)
        pos = FVectorToVector(pos)
        original_SetRagdollPos(self, boneid, pos)
    end
    local original_VisibleVec = Entity_Meta.VisibleVec
    function Entity_Meta:VisibleVec(pos)
        pos = FVectorToVector(pos)
        local v0 = original_VisibleVec(self, pos)
        return v0
    end
    
end
if CLIENT then
    local original_GetRenderBounds = Entity_Meta.GetRenderBounds
    function Entity_Meta:GetRenderBounds()
        local v0, v1 = original_GetRenderBounds(self)
        v0 = VectorToFVector(v0)
        v1 = VectorToFVector(v1)
        return v0, v1
    end
    local original_GetRenderOrigin = Entity_Meta.GetRenderOrigin
    function Entity_Meta:GetRenderOrigin()
        local v0 = original_GetRenderOrigin(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_SetBonePosition = Entity_Meta.SetBonePosition
    function Entity_Meta:SetBonePosition(bone, pos, ang)
        pos = FVectorToVector(pos)
        original_SetBonePosition(self, bone, pos, ang)
    end
    local original_SetRenderBounds = Entity_Meta.SetRenderBounds
    function Entity_Meta:SetRenderBounds(mins, maxs, add)
        mins = FVectorToVector(mins)
        maxs = FVectorToVector(maxs)
        if add ~= nil then
            add = FVectorToVector(add)
        end
        original_SetRenderBounds(self, mins, maxs, add)
    end
    local original_SetRenderBoundsWS = Entity_Meta.SetRenderBoundsWS
    function Entity_Meta:SetRenderBoundsWS(mins, maxs, add)
        mins = FVectorToVector(mins)
        maxs = FVectorToVector(maxs)
        if add ~= nil then
            add = FVectorToVector(add)
        end
        original_SetRenderBoundsWS(self, mins, maxs, add)
    end
    local original_SetRenderClipPlane = Entity_Meta.SetRenderClipPlane
    function Entity_Meta:SetRenderClipPlane(planeNormal, planePosition)
        planeNormal = FVectorToVector(planeNormal)
        original_SetRenderClipPlane(self, planeNormal, planePosition)
    end
    local original_SetRenderOrigin = Entity_Meta.SetRenderOrigin
    function Entity_Meta:SetRenderOrigin(newOrigin)
        if newOrigin ~= nil then
            newOrigin = FVectorToVector(newOrigin)
        end
        original_SetRenderOrigin(self, newOrigin)
    end
    
end
