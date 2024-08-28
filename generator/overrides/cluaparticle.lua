local CLuaParticle_Meta = FindMetaTable("CLuaParticle")
if CLIENT then
    local original_GetGravity = CLuaParticle_Meta.GetGravity
    function CLuaParticle_Meta:GetGravity()
        local v0 = original_GetGravity(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetPos = CLuaParticle_Meta.GetPos
    function CLuaParticle_Meta:GetPos()
        local v0 = original_GetPos(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetVelocity = CLuaParticle_Meta.GetVelocity
    function CLuaParticle_Meta:GetVelocity()
        local v0 = original_GetVelocity(self)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_SetGravity = CLuaParticle_Meta.SetGravity
    function CLuaParticle_Meta:SetGravity(gravity)
        gravity = FVectorToVector(gravity)
        original_SetGravity(self, gravity)
    end
    local original_SetPos = CLuaParticle_Meta.SetPos
    function CLuaParticle_Meta:SetPos(pos)
        pos = FVectorToVector(pos)
        original_SetPos(self, pos)
    end
    local original_SetVelocity = CLuaParticle_Meta.SetVelocity
    function CLuaParticle_Meta:SetVelocity(vel)
        vel = FVectorToVector(vel)
        original_SetVelocity(self, vel)
    end
    
end
