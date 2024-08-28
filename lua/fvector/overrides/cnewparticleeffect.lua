local CNewParticleEffect_Meta = FindMetaTable("CNewParticleEffect")
if CLIENT then
    local original_AddControlPoint = CNewParticleEffect_Meta.AddControlPoint
    function CNewParticleEffect_Meta:AddControlPoint(cpID, ent, partAttachment, entAttachment, offset)
        if offset ~= nil then
            offset = FVectorToVector(offset)
        end
        original_AddControlPoint(self, cpID, ent, partAttachment, entAttachment, offset)
    end
    local original_SetControlPoint = CNewParticleEffect_Meta.SetControlPoint
    function CNewParticleEffect_Meta:SetControlPoint(cpID, value)
        value = FVectorToVector(value)
        original_SetControlPoint(self, cpID, value)
    end
    local original_SetControlPointForwardVector = CNewParticleEffect_Meta.SetControlPointForwardVector
    function CNewParticleEffect_Meta:SetControlPointForwardVector(cpID, forward)
        forward = FVectorToVector(forward)
        original_SetControlPointForwardVector(self, cpID, forward)
    end
    local original_SetControlPointOrientation = CNewParticleEffect_Meta.SetControlPointOrientation
    function CNewParticleEffect_Meta:SetControlPointOrientation(cpID, forward, right, up)
        forward = FVectorToVector(forward)
        right = FVectorToVector(right)
        up = FVectorToVector(up)
        original_SetControlPointOrientation(self, cpID, forward, right, up)
    end
    local original_SetControlPointRightVector = CNewParticleEffect_Meta.SetControlPointRightVector
    function CNewParticleEffect_Meta:SetControlPointRightVector(cpID, right)
        right = FVectorToVector(right)
        original_SetControlPointRightVector(self, cpID, right)
    end
    local original_SetControlPointUpVector = CNewParticleEffect_Meta.SetControlPointUpVector
    function CNewParticleEffect_Meta:SetControlPointUpVector(cpID, upward)
        upward = FVectorToVector(upward)
        original_SetControlPointUpVector(self, cpID, upward)
    end
    local original_SetSortOrigin = CNewParticleEffect_Meta.SetSortOrigin
    function CNewParticleEffect_Meta:SetSortOrigin(origin)
        origin = FVectorToVector(origin)
        original_SetSortOrigin(self, origin)
    end
    
end
