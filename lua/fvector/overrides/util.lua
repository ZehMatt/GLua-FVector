local original_AimVector = util.AimVector
function util.AimVector(ViewAngles, ViewFOV, x, y, scrWidth, scrHeight)
    local v0 = original_AimVector(ViewAngles, ViewFOV, x, y, scrWidth, scrHeight)
    v0 = VectorToFVector(v0)
    return v0
end
local original_Decal = util.Decal
function util.Decal(name, start, end_, filter)
    start = FVectorToVector(start)
    end_ = FVectorToVector(end_)
    original_Decal(name, start, end_, filter)
end
local original_DistanceToLine = util.DistanceToLine
function util.DistanceToLine(lineStart, lineEnd, pointPos)
    lineStart = FVectorToVector(lineStart)
    lineEnd = FVectorToVector(lineEnd)
    pointPos = FVectorToVector(pointPos)
    local v0, v1, v2 = original_DistanceToLine(lineStart, lineEnd, pointPos)
    v1 = VectorToFVector(v1)
    return v0, v1, v2
end
local original_GetPlayerTrace = util.GetPlayerTrace
function util.GetPlayerTrace(ply, dir)
    if dir ~= nil then
        dir = FVectorToVector(dir)
    end
    local v0 = original_GetPlayerTrace(ply, dir)
    v0.start = VectorToFVector(v0.start)
    v0.endpos = VectorToFVector(v0.endpos)
    return v0
end
local original_IntersectRayWithOBB = util.IntersectRayWithOBB
function util.IntersectRayWithOBB(rayStart, rayDelta, boxOrigin, boxAngles, boxMins, boxMaxs)
    rayStart = FVectorToVector(rayStart)
    rayDelta = FVectorToVector(rayDelta)
    boxOrigin = FVectorToVector(boxOrigin)
    boxMins = FVectorToVector(boxMins)
    boxMaxs = FVectorToVector(boxMaxs)
    local v0, v1, v2 = original_IntersectRayWithOBB(rayStart, rayDelta, boxOrigin, boxAngles, boxMins, boxMaxs)
    v0 = VectorToFVector(v0)
    v1 = VectorToFVector(v1)
    return v0, v1, v2
end
local original_IntersectRayWithPlane = util.IntersectRayWithPlane
function util.IntersectRayWithPlane(rayOrigin, rayDirection, planePosition, planeNormal)
    rayOrigin = FVectorToVector(rayOrigin)
    rayDirection = FVectorToVector(rayDirection)
    planePosition = FVectorToVector(planePosition)
    planeNormal = FVectorToVector(planeNormal)
    local v0 = original_IntersectRayWithPlane(rayOrigin, rayDirection, planePosition, planeNormal)
    v0 = VectorToFVector(v0)
    return v0
end
local original_IntersectRayWithSphere = util.IntersectRayWithSphere
function util.IntersectRayWithSphere(rayOrigin, rayDelta, shperePosition, sphereRadius)
    rayOrigin = FVectorToVector(rayOrigin)
    rayDelta = FVectorToVector(rayDelta)
    shperePosition = FVectorToVector(shperePosition)
    local v0, v1 = original_IntersectRayWithSphere(rayOrigin, rayDelta, shperePosition, sphereRadius)
    return v0, v1
end
local original_IsBoxIntersectingSphere = util.IsBoxIntersectingSphere
function util.IsBoxIntersectingSphere(boxMin, boxMax, shpere2Position, sphere2Radius)
    boxMin = FVectorToVector(boxMin)
    boxMax = FVectorToVector(boxMax)
    shpere2Position = FVectorToVector(shpere2Position)
    local v0 = original_IsBoxIntersectingSphere(boxMin, boxMax, shpere2Position, sphere2Radius)
    return v0
end
local original_IsOBBIntersectingOBB = util.IsOBBIntersectingOBB
function util.IsOBBIntersectingOBB(box1Origin, box1Angles, box1Mins, box1Maxs, box2Origin, box2Angles, box2Mins, box2Maxs, tolerance)
    box1Origin = FVectorToVector(box1Origin)
    box1Mins = FVectorToVector(box1Mins)
    box1Maxs = FVectorToVector(box1Maxs)
    box2Origin = FVectorToVector(box2Origin)
    box2Mins = FVectorToVector(box2Mins)
    box2Maxs = FVectorToVector(box2Maxs)
    local v0 = original_IsOBBIntersectingOBB(box1Origin, box1Angles, box1Mins, box1Maxs, box2Origin, box2Angles, box2Mins, box2Maxs, tolerance)
    return v0
end
local original_IsPointInCone = util.IsPointInCone
function util.IsPointInCone(point, coneOrigin, coneAxis, coneSine, coneLength)
    point = FVectorToVector(point)
    coneOrigin = FVectorToVector(coneOrigin)
    coneAxis = FVectorToVector(coneAxis)
    local v0 = original_IsPointInCone(point, coneOrigin, coneAxis, coneSine, coneLength)
    return v0
end
local original_IsRayIntersectingRay = util.IsRayIntersectingRay
function util.IsRayIntersectingRay(ray1Start, ray1End, ray2Start, ray2End)
    ray1Start = FVectorToVector(ray1Start)
    ray1End = FVectorToVector(ray1End)
    ray2Start = FVectorToVector(ray2Start)
    ray2End = FVectorToVector(ray2End)
    local v0, v1, v2 = original_IsRayIntersectingRay(ray1Start, ray1End, ray2Start, ray2End)
    return v0, v1, v2
end
local original_IsSphereIntersectingCone = util.IsSphereIntersectingCone
function util.IsSphereIntersectingCone(sphereCenter, sphereRadius, coneOrigin, coneAxis, coneSine, coneCosine)
    sphereCenter = FVectorToVector(sphereCenter)
    coneOrigin = FVectorToVector(coneOrigin)
    coneAxis = FVectorToVector(coneAxis)
    local v0 = original_IsSphereIntersectingCone(sphereCenter, sphereRadius, coneOrigin, coneAxis, coneSine, coneCosine)
    return v0
end
local original_IsSphereIntersectingSphere = util.IsSphereIntersectingSphere
function util.IsSphereIntersectingSphere(sphere1Position, sphere1Radius, sphere2Position, sphere2Radius)
    sphere1Position = FVectorToVector(sphere1Position)
    sphere2Position = FVectorToVector(sphere2Position)
    local v0 = original_IsSphereIntersectingSphere(sphere1Position, sphere1Radius, sphere2Position, sphere2Radius)
    return v0
end
local original_LocalToWorld = util.LocalToWorld
function util.LocalToWorld(ent, lpos, bonenum)
    lpos = FVectorToVector(lpos)
    local v0 = original_LocalToWorld(ent, lpos, bonenum)
    v0 = VectorToFVector(v0)
    return v0
end
local original_ParticleTracer = util.ParticleTracer
function util.ParticleTracer(name, startPos, endPos, doWhiz)
    startPos = FVectorToVector(startPos)
    endPos = FVectorToVector(endPos)
    original_ParticleTracer(name, startPos, endPos, doWhiz)
end
local original_ParticleTracerEx = util.ParticleTracerEx
function util.ParticleTracerEx(name, startPos, endPos, doWhiz, entityIndex, attachmentIndex)
    startPos = FVectorToVector(startPos)
    endPos = FVectorToVector(endPos)
    original_ParticleTracerEx(name, startPos, endPos, doWhiz, entityIndex, attachmentIndex)
end
local original_PointContents = util.PointContents
function util.PointContents(position)
    position = FVectorToVector(position)
    local v0 = original_PointContents(position)
    return v0
end
local original_QuickTrace = util.QuickTrace
function util.QuickTrace(origin, dir, filter)
    origin = FVectorToVector(origin)
    dir = FVectorToVector(dir)
    local v0 = original_QuickTrace(origin, dir, filter)
    v0.HitNormal = VectorToFVector(v0.HitNormal)
    v0.HitPos = VectorToFVector(v0.HitPos)
    v0.Normal = VectorToFVector(v0.Normal)
    v0.StartPos = VectorToFVector(v0.StartPos)
    return v0
end
local original_ScreenShake = util.ScreenShake
function util.ScreenShake(pos, amplitude, frequency, duration, radius, airshake, filter)
    pos = FVectorToVector(pos)
    original_ScreenShake(pos, amplitude, frequency, duration, radius, airshake, filter)
end
local original_TraceEntity = util.TraceEntity
function util.TraceEntity(tracedata, ent)
    tracedata = table.Copy(tracedata)
    tracedata.start = FVectorToVector(tracedata.start)
    tracedata.endpos = FVectorToVector(tracedata.endpos)
    local v0 = original_TraceEntity(tracedata, ent)
    v0.HitNormal = VectorToFVector(v0.HitNormal)
    v0.HitPos = VectorToFVector(v0.HitPos)
    v0.Normal = VectorToFVector(v0.Normal)
    v0.StartPos = VectorToFVector(v0.StartPos)
    return v0
end
local original_TraceEntityHull = util.TraceEntityHull
function util.TraceEntityHull(tracedata, ent)
    tracedata = table.Copy(tracedata)
    tracedata.start = FVectorToVector(tracedata.start)
    tracedata.endpos = FVectorToVector(tracedata.endpos)
    local v0 = original_TraceEntityHull(tracedata, ent)
    v0.HitNormal = VectorToFVector(v0.HitNormal)
    v0.HitPos = VectorToFVector(v0.HitPos)
    v0.Normal = VectorToFVector(v0.Normal)
    v0.StartPos = VectorToFVector(v0.StartPos)
    return v0
end
local original_TraceHull = util.TraceHull
function util.TraceHull(TraceData)
    TraceData = table.Copy(TraceData)
    TraceData.start = FVectorToVector(TraceData.start)
    TraceData.endpos = FVectorToVector(TraceData.endpos)
    TraceData.maxs = FVectorToVector(TraceData.maxs)
    TraceData.mins = FVectorToVector(TraceData.mins)
    local v0 = original_TraceHull(TraceData)
    v0.HitNormal = VectorToFVector(v0.HitNormal)
    v0.HitPos = VectorToFVector(v0.HitPos)
    v0.Normal = VectorToFVector(v0.Normal)
    v0.StartPos = VectorToFVector(v0.StartPos)
    return v0
end
if SERVER then
    local original_BlastDamage = util.BlastDamage
    function util.BlastDamage(inflictor, attacker, damageOrigin, damageRadius, damage)
        damageOrigin = FVectorToVector(damageOrigin)
        original_BlastDamage(inflictor, attacker, damageOrigin, damageRadius, damage)
    end
    local original_BlastDamageInfo = util.BlastDamageInfo
    function util.BlastDamageInfo(dmg, damageOrigin, damageRadius)
        damageOrigin = FVectorToVector(damageOrigin)
        original_BlastDamageInfo(dmg, damageOrigin, damageRadius)
    end
    local original_IsInWorld = util.IsInWorld
    function util.IsInWorld(position)
        position = FVectorToVector(position)
        local v0 = original_IsInWorld(position)
        return v0
    end
    
end
if CLIENT then
    local original_DecalEx = util.DecalEx
    function util.DecalEx(material, ent, position, normal, color, w, h)
        position = FVectorToVector(position)
        normal = FVectorToVector(normal)
        original_DecalEx(material, ent, position, normal, color, w, h)
    end
    local original_GetSunInfo = util.GetSunInfo
    function util.GetSunInfo()
        local v0 = original_GetSunInfo()
        v0.direction = VectorToFVector(v0.direction)
        return v0
    end
    local original_IsSkyboxVisibleFromPoint = util.IsSkyboxVisibleFromPoint
    function util.IsSkyboxVisibleFromPoint(position)
        position = FVectorToVector(position)
        local v0 = original_IsSkyboxVisibleFromPoint(position)
        return v0
    end
    local original_PixelVisible = util.PixelVisible
    function util.PixelVisible(position, radius, PixVis)
        position = FVectorToVector(position)
        local v0 = original_PixelVisible(position, radius, PixVis)
        return v0
    end
    
end
