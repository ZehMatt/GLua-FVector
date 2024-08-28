AddCSLuaFile("fvector/overrides/overrides.lua")

local BadVector = Vector
Vector = FVector

function FVectorToVector(vec)
    return BadVector(vec.x, vec.y, vec.z)
end

function VectorToFVector(vec)
    return FVector(vec.x, vec.y, vec.z)
end

include("fvector/overrides/overrides.lua")

-- Globals
do
    local Old_EyePos = EyePos
    function EyePos()
        return VectorToFVector(Old_EyePos())
    end

    local Old_LerpVector = LerpVector
    function LerpVector(frac, from, to)
        -- TODO: We can avoid converting it by just implementing it.
        from = FVectorToVector(from)
        to = FVectorToVector(to)
        return VectorToFVector(Old_LerpVector(frac, from, to))
    end

    local Old_VectorRand = VectorRand
    function VectorRand()
        -- TODO: We can avoid converting it by just implementing it.
        return VectorToFVector(Old_VectorRand())
    end
end

-- ents
do
    local Old_ents_FindInBox = ents.FindInBox
    function ents.FindInBox(min, max)
        min = FVectorToVector(min)
        max = FVectorToVector(max)
        return Old_ents_FindInBox(min, max)
    end

    local Old_ents_FindInSphere = ents.FindInSphere
    function ents.FindInSphere(pos, radius)
        pos = FVectorToVector(pos)
        return Old_ents_FindInSphere(pos, radius)
    end

    local Old_ents_FindInCone = ents.FindInCone
    function ents.FindInCone(pos, dir, distance, angle)
        pos = FVectorToVector(pos)
        return Old_ents_FindInCone(pos, dir, distance, angle)
    end
end

-- util
do
    local Old_util_PointContents = util.PointContents
    function util.PointContents(pos)
        pos = FVectorToVector(pos)
        return Old_util_PointContents(pos)
    end

    local Old_util_IsInWorld = util.IsInWorld
    function util.IsInWorld(pos)
        pos = FVectorToVector(pos)
        return Old_util_IsInWorld(pos)
    end

    local Old_util_TraceLine = util.TraceLine
    function util.TraceLine(tr)
        -- Don't leak Vector in table, copy it.
        local tr2 = table.Copy(tr)
        tr2.start = FVectorToVector(tr.start)
        tr2.endpos = FVectorToVector(tr.endpos)
        local res = Old_util_TraceLine(tr2)
        res.HitPos = VectorToFVector(res.HitPos)
        res.HitNormal = VectorToFVector(res.HitNormal)
        return res
    end

end