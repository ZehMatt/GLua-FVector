local PhysObj_Meta = FindMetaTable("PhysObj")
local original_AddAngleVelocity = PhysObj_Meta.AddAngleVelocity
function PhysObj_Meta:AddAngleVelocity(angularVelocity)
    angularVelocity = FVectorToVector(angularVelocity)
    original_AddAngleVelocity(self, angularVelocity)
end
local original_AddVelocity = PhysObj_Meta.AddVelocity
function PhysObj_Meta:AddVelocity(velocity)
    velocity = FVectorToVector(velocity)
    original_AddVelocity(self, velocity)
end
local original_ApplyForceCenter = PhysObj_Meta.ApplyForceCenter
function PhysObj_Meta:ApplyForceCenter(impulse)
    impulse = FVectorToVector(impulse)
    original_ApplyForceCenter(self, impulse)
end
local original_ApplyForceOffset = PhysObj_Meta.ApplyForceOffset
function PhysObj_Meta:ApplyForceOffset(impulse, position)
    impulse = FVectorToVector(impulse)
    position = FVectorToVector(position)
    original_ApplyForceOffset(self, impulse, position)
end
local original_ApplyTorqueCenter = PhysObj_Meta.ApplyTorqueCenter
function PhysObj_Meta:ApplyTorqueCenter(angularImpulse)
    angularImpulse = FVectorToVector(angularImpulse)
    original_ApplyTorqueCenter(self, angularImpulse)
end
local original_CalculateForceOffset = PhysObj_Meta.CalculateForceOffset
function PhysObj_Meta:CalculateForceOffset(impulse, position)
    impulse = FVectorToVector(impulse)
    position = FVectorToVector(position)
    local linearImpulse, angularImpulse = original_CalculateForceOffset(self, impulse, position)
    linearImpulse = VectorToFVector(linearImpulse)
    angularImpulse = VectorToFVector(angularImpulse)
    return linearImpulse, angularImpulse
end
local original_CalculateVelocityOffset = PhysObj_Meta.CalculateVelocityOffset
function PhysObj_Meta:CalculateVelocityOffset(impulse, position)
    impulse = FVectorToVector(impulse)
    position = FVectorToVector(position)
    local v0, v1 = original_CalculateVelocityOffset(self, impulse, position)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_ComputeShadowControl = PhysObj_Meta.ComputeShadowControl
function PhysObj_Meta:ComputeShadowControl(shadowparams)
    shadowparams = table.Copy(shadowparams)
    shadowparams.pos = FVectorToVector(shadowparams.pos)
    original_ComputeShadowControl(self, shadowparams)
end
local original_GetAABB = PhysObj_Meta.GetAABB
function PhysObj_Meta:GetAABB()
    local v0, v1 = original_GetAABB(self)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1
end
local original_GetAngleVelocity = PhysObj_Meta.GetAngleVelocity
function PhysObj_Meta:GetAngleVelocity()
    local v0 = original_GetAngleVelocity(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetInertia = PhysObj_Meta.GetInertia
function PhysObj_Meta:GetInertia()
    local angularInertia = original_GetInertia(self)
    angularInertia = VectorToFVector(angularInertia)
    return angularInertia
end
local original_GetInvInertia = PhysObj_Meta.GetInvInertia
function PhysObj_Meta:GetInvInertia()
    local invAngularInertia = original_GetInvInertia(self)
    invAngularInertia = VectorToFVector(invAngularInertia)
    return invAngularInertia
end
local original_GetMassCenter = PhysObj_Meta.GetMassCenter
function PhysObj_Meta:GetMassCenter()
    local v0 = original_GetMassCenter(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetPos = PhysObj_Meta.GetPos
function PhysObj_Meta:GetPos()
    local v0 = original_GetPos(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetShadowPos = PhysObj_Meta.GetShadowPos
function PhysObj_Meta:GetShadowPos()
    local v0 = original_GetShadowPos(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetVelocity = PhysObj_Meta.GetVelocity
function PhysObj_Meta:GetVelocity()
    local v0 = original_GetVelocity(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetVelocityAtPoint = PhysObj_Meta.GetVelocityAtPoint
function PhysObj_Meta:GetVelocityAtPoint(point)
    point = FVectorToVector(point)
    local velocity = original_GetVelocityAtPoint(self, point)
    velocity = VectorToFVector(velocity)
    return velocity
end
local original_LocalToWorld = PhysObj_Meta.LocalToWorld
function PhysObj_Meta:LocalToWorld(LocalVec)
    LocalVec = FVectorToVector(LocalVec)
    local v0 = original_LocalToWorld(self, LocalVec)
    v0 = VectorToFVector(v0)
    return v0
end
local original_LocalToWorldVector = PhysObj_Meta.LocalToWorldVector
function PhysObj_Meta:LocalToWorldVector(LocalVec)
    LocalVec = FVectorToVector(LocalVec)
    local v0 = original_LocalToWorldVector(self, LocalVec)
    v0 = VectorToFVector(v0)
    return v0
end
local original_RotateAroundAxis = PhysObj_Meta.RotateAroundAxis
function PhysObj_Meta:RotateAroundAxis(dir, ang)
    dir = FVectorToVector(dir)
    local v0 = original_RotateAroundAxis(self, dir, ang)
    return v0
end
local original_SetAngleVelocity = PhysObj_Meta.SetAngleVelocity
function PhysObj_Meta:SetAngleVelocity(angularVelocity)
    angularVelocity = FVectorToVector(angularVelocity)
    original_SetAngleVelocity(self, angularVelocity)
end
local original_SetAngleVelocityInstantaneous = PhysObj_Meta.SetAngleVelocityInstantaneous
function PhysObj_Meta:SetAngleVelocityInstantaneous(angularVelocity)
    angularVelocity = FVectorToVector(angularVelocity)
    original_SetAngleVelocityInstantaneous(self, angularVelocity)
end
local original_SetInertia = PhysObj_Meta.SetInertia
function PhysObj_Meta:SetInertia(angularInertia)
    angularInertia = FVectorToVector(angularInertia)
    original_SetInertia(self, angularInertia)
end
local original_SetPos = PhysObj_Meta.SetPos
function PhysObj_Meta:SetPos(position, teleport)
    position = FVectorToVector(position)
    original_SetPos(self, position, teleport)
end
local original_SetVelocity = PhysObj_Meta.SetVelocity
function PhysObj_Meta:SetVelocity(velocity)
    velocity = FVectorToVector(velocity)
    original_SetVelocity(self, velocity)
end
local original_SetVelocityInstantaneous = PhysObj_Meta.SetVelocityInstantaneous
function PhysObj_Meta:SetVelocityInstantaneous(velocity)
    velocity = FVectorToVector(velocity)
    original_SetVelocityInstantaneous(self, velocity)
end
local original_UpdateShadow = PhysObj_Meta.UpdateShadow
function PhysObj_Meta:UpdateShadow(targetPosition, targetAngles, frameTime)
    targetPosition = FVectorToVector(targetPosition)
    original_UpdateShadow(self, targetPosition, targetAngles, frameTime)
end
local original_WorldToLocal = PhysObj_Meta.WorldToLocal
function PhysObj_Meta:WorldToLocal(vec)
    vec = FVectorToVector(vec)
    local v0 = original_WorldToLocal(self, vec)
    v0 = VectorToFVector(v0)
    return v0
end
local original_WorldToLocalVector = PhysObj_Meta.WorldToLocalVector
function PhysObj_Meta:WorldToLocalVector(WorldVec)
    WorldVec = FVectorToVector(WorldVec)
    local v0 = original_WorldToLocalVector(self, WorldVec)
    v0 = VectorToFVector(v0)
    return v0
end
