local CTakeDamageInfo_Meta = FindMetaTable("CTakeDamageInfo")
local original_GetDamageForce = CTakeDamageInfo_Meta.GetDamageForce
function CTakeDamageInfo_Meta:GetDamageForce()
    local v0 = original_GetDamageForce(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetDamagePosition = CTakeDamageInfo_Meta.GetDamagePosition
function CTakeDamageInfo_Meta:GetDamagePosition()
    local v0 = original_GetDamagePosition(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetReportedPosition = CTakeDamageInfo_Meta.GetReportedPosition
function CTakeDamageInfo_Meta:GetReportedPosition()
    local v0 = original_GetReportedPosition(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_SetDamageForce = CTakeDamageInfo_Meta.SetDamageForce
function CTakeDamageInfo_Meta:SetDamageForce(force)
    force = FVectorToVector(force)
    original_SetDamageForce(self, force)
end
local original_SetDamagePosition = CTakeDamageInfo_Meta.SetDamagePosition
function CTakeDamageInfo_Meta:SetDamagePosition(pos)
    pos = FVectorToVector(pos)
    original_SetDamagePosition(self, pos)
end
local original_SetReportedPosition = CTakeDamageInfo_Meta.SetReportedPosition
function CTakeDamageInfo_Meta:SetReportedPosition(pos)
    pos = FVectorToVector(pos)
    original_SetReportedPosition(self, pos)
end
