local Vehicle_Meta = FindMetaTable("Vehicle")
local original_GetVehicleViewPosition = Vehicle_Meta.GetVehicleViewPosition
function Vehicle_Meta:GetVehicleViewPosition(role)
    local v0, v1, v2 = original_GetVehicleViewPosition(self, role)
    v0 = VectorToFVector(v0)
    return v0, v1, v2
end
if SERVER then
    local original_CheckExitPoint = Vehicle_Meta.CheckExitPoint
    function Vehicle_Meta:CheckExitPoint(yaw, distance)
        local v0 = original_CheckExitPoint(self, yaw, distance)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetPassengerSeatPoint = Vehicle_Meta.GetPassengerSeatPoint
    function Vehicle_Meta:GetPassengerSeatPoint(role)
        local v0, v1 = original_GetPassengerSeatPoint(self, role)
        v0 = VectorToFVector(v0)
        return v0, v1
    end
    local original_GetWheelContactPoint = Vehicle_Meta.GetWheelContactPoint
    function Vehicle_Meta:GetWheelContactPoint(wheel)
        local v0, v1, v2 = original_GetWheelContactPoint(self, wheel)
        v0 = VectorToFVector(v0)
        return v0, v1, v2
    end
    
end
