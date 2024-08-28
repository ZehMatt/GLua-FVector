local PhysCollide_Meta = FindMetaTable("PhysCollide")
local original_TraceBox = PhysCollide_Meta.TraceBox
function PhysCollide_Meta:TraceBox(origin, angles, rayStart, rayEnd, rayMins, rayMaxs)
    origin = FVectorToVector(origin)
    rayStart = FVectorToVector(rayStart)
    rayEnd = FVectorToVector(rayEnd)
    rayMins = FVectorToVector(rayMins)
    rayMaxs = FVectorToVector(rayMaxs)
    local v0, v1, v2 = original_TraceBox(self, origin, angles, rayStart, rayEnd, rayMins, rayMaxs)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1, v2
end
