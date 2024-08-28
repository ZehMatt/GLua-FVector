local VMatrix_Meta = FindMetaTable("VMatrix")
local original_GetForward = VMatrix_Meta.GetForward
function VMatrix_Meta:GetForward()
    local v0 = original_GetForward(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetRight = VMatrix_Meta.GetRight
function VMatrix_Meta:GetRight()
    local v0 = original_GetRight(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetScale = VMatrix_Meta.GetScale
function VMatrix_Meta:GetScale()
    local v0 = original_GetScale(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetTranslation = VMatrix_Meta.GetTranslation
function VMatrix_Meta:GetTranslation()
    local v0 = original_GetTranslation(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_GetUp = VMatrix_Meta.GetUp
function VMatrix_Meta:GetUp()
    local v0 = original_GetUp(self)
    v0 = VectorToFVector(v0)
    return v0
end
local original_Scale = VMatrix_Meta.Scale
function VMatrix_Meta:Scale(scale)
    scale = FVectorToVector(scale)
    original_Scale(self, scale)
end
local original_SetForward = VMatrix_Meta.SetForward
function VMatrix_Meta:SetForward(forward)
    forward = FVectorToVector(forward)
    original_SetForward(self, forward)
end
local original_SetRight = VMatrix_Meta.SetRight
function VMatrix_Meta:SetRight(forward)
    forward = FVectorToVector(forward)
    original_SetRight(self, forward)
end
local original_SetScale = VMatrix_Meta.SetScale
function VMatrix_Meta:SetScale(scale)
    scale = FVectorToVector(scale)
    original_SetScale(self, scale)
end
local original_SetTranslation = VMatrix_Meta.SetTranslation
function VMatrix_Meta:SetTranslation(translation)
    translation = FVectorToVector(translation)
    original_SetTranslation(self, translation)
end
local original_SetUp = VMatrix_Meta.SetUp
function VMatrix_Meta:SetUp(forward)
    forward = FVectorToVector(forward)
    original_SetUp(self, forward)
end
local original_Translate = VMatrix_Meta.Translate
function VMatrix_Meta:Translate(translation)
    translation = FVectorToVector(translation)
    original_Translate(self, translation)
end
