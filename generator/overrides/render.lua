if CLIENT then
    local original_AddBeam = render.AddBeam
    function render.AddBeam(startPos, width, textureEnd, color)
        startPos = FVectorToVector(startPos)
        original_AddBeam(startPos, width, textureEnd, color)
    end
    local original_ComputeDynamicLighting = render.ComputeDynamicLighting
    function render.ComputeDynamicLighting(position, normal)
        position = FVectorToVector(position)
        normal = FVectorToVector(normal)
        local v0 = original_ComputeDynamicLighting(position, normal)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_ComputeLighting = render.ComputeLighting
    function render.ComputeLighting(position, normal)
        position = FVectorToVector(position)
        normal = FVectorToVector(normal)
        local v0 = original_ComputeLighting(position, normal)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_ComputePixelDiameterOfSphere = render.ComputePixelDiameterOfSphere
    function render.ComputePixelDiameterOfSphere(point, radius)
        point = FVectorToVector(point)
        local v0 = original_ComputePixelDiameterOfSphere(point, radius)
        return v0
    end
    local original_DrawBeam = render.DrawBeam
    function render.DrawBeam(startPos, endPos, width, textureStart, textureEnd, color)
        startPos = FVectorToVector(startPos)
        endPos = FVectorToVector(endPos)
        original_DrawBeam(startPos, endPos, width, textureStart, textureEnd, color)
    end
    local original_DrawBox = render.DrawBox
    function render.DrawBox(position, angles, mins, maxs, color)
        position = FVectorToVector(position)
        mins = FVectorToVector(mins)
        maxs = FVectorToVector(maxs)
        original_DrawBox(position, angles, mins, maxs, color)
    end
    local original_DrawLine = render.DrawLine
    function render.DrawLine(startPos, endPos, color, writeZ)
        startPos = FVectorToVector(startPos)
        endPos = FVectorToVector(endPos)
        original_DrawLine(startPos, endPos, color, writeZ)
    end
    local original_DrawQuad = render.DrawQuad
    function render.DrawQuad(vert1, vert2, vert3, vert4, color)
        vert1 = FVectorToVector(vert1)
        vert2 = FVectorToVector(vert2)
        vert3 = FVectorToVector(vert3)
        vert4 = FVectorToVector(vert4)
        original_DrawQuad(vert1, vert2, vert3, vert4, color)
    end
    local original_DrawQuadEasy = render.DrawQuadEasy
    function render.DrawQuadEasy(position, normal, width, height, color, rotation)
        position = FVectorToVector(position)
        normal = FVectorToVector(normal)
        original_DrawQuadEasy(position, normal, width, height, color, rotation)
    end
    local original_DrawSphere = render.DrawSphere
    function render.DrawSphere(position, radius, longitudeSteps, latitudeSteps, color)
        position = FVectorToVector(position)
        original_DrawSphere(position, radius, longitudeSteps, latitudeSteps, color)
    end
    local original_DrawSprite = render.DrawSprite
    function render.DrawSprite(position, width, height, color)
        position = FVectorToVector(position)
        original_DrawSprite(position, width, height, color)
    end
    local original_DrawWireframeBox = render.DrawWireframeBox
    function render.DrawWireframeBox(position, angle, mins, maxs, color, writeZ)
        position = FVectorToVector(position)
        mins = FVectorToVector(mins)
        maxs = FVectorToVector(maxs)
        original_DrawWireframeBox(position, angle, mins, maxs, color, writeZ)
    end
    local original_DrawWireframeSphere = render.DrawWireframeSphere
    function render.DrawWireframeSphere(position, radius, longitudeSteps, latitudeSteps, color, writeZ)
        position = FVectorToVector(position)
        original_DrawWireframeSphere(position, radius, longitudeSteps, latitudeSteps, color, writeZ)
    end
    local original_GetAmbientLightColor = render.GetAmbientLightColor
    function render.GetAmbientLightColor()
        local v0 = original_GetAmbientLightColor()
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetLightColor = render.GetLightColor
    function render.GetLightColor(position)
        position = FVectorToVector(position)
        local v0 = original_GetLightColor(position)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetSurfaceColor = render.GetSurfaceColor
    function render.GetSurfaceColor(startPos, endPos)
        startPos = FVectorToVector(startPos)
        endPos = FVectorToVector(endPos)
        local v0 = original_GetSurfaceColor(startPos, endPos)
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetToneMappingScaleLinear = render.GetToneMappingScaleLinear
    function render.GetToneMappingScaleLinear()
        local v0 = original_GetToneMappingScaleLinear()
        v0 = VectorToFVector(v0)
        return v0
    end
    local original_GetViewSetup = render.GetViewSetup
    function render.GetViewSetup(noPlayer)
        local v0 = original_GetViewSetup(noPlayer)
        v0.origin = VectorToFVector(v0.origin)
        return v0
    end
    local original_PushCustomClipPlane = render.PushCustomClipPlane
    function render.PushCustomClipPlane(normal, distance)
        normal = FVectorToVector(normal)
        original_PushCustomClipPlane(normal, distance)
    end
    local original_RenderView = render.RenderView
    function render.RenderView(view)
        view = table.Copy(view)
        if view.origin ~= nil then
            view.origin = FVectorToVector(view.origin)
        end
        original_RenderView(view)
    end
    local original_SetLightingOrigin = render.SetLightingOrigin
    function render.SetLightingOrigin(lightingOrigin)
        lightingOrigin = FVectorToVector(lightingOrigin)
        original_SetLightingOrigin(lightingOrigin)
    end
    local original_SetShadowDirection = render.SetShadowDirection
    function render.SetShadowDirection(shadowDirections)
        shadowDirections = FVectorToVector(shadowDirections)
        original_SetShadowDirection(shadowDirections)
    end
    local original_SetToneMappingScaleLinear = render.SetToneMappingScaleLinear
    function render.SetToneMappingScaleLinear(vec)
        vec = FVectorToVector(vec)
        original_SetToneMappingScaleLinear(vec)
    end
    
end
