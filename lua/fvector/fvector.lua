AddCSLuaFile()

local BadVector = Vector

local FVECTOR_MT = {}
FVECTOR_MT.__index = FVECTOR_MT

-- This is a lot faster than isnumber/type/TypeID with the added
-- benefit of supporting strings for the some of the scalar overloads.
local function IsNumber(x)
    return tonumber(x)
end

local function FVector_(x, y, z)
    if isstring(x) then
        x, y, z = string.match(x, "([%d%.]+) ([%d%.]+) ([%d%.]+)")
        x, y, z = tonumber(x), tonumber(y), tonumber(z)
        if x == nil or y == nil or z == nil then
            return nil
        end
    end
    local vec = {x = x or 0, y = y or 0, z = z or 0}
    setmetatable(vec, FVECTOR_MT)
    return vec
end

function FVECTOR_MT:__tostring()
    return string.format("%f %f %f", self.x, self.y, self.z)
end

function FVECTOR_MT:__add(other)
    return FVector_(self.x + other.x, self.y + other.y, self.z + other.z)
end

function FVECTOR_MT:__sub(other)
    return FVector_(self.x - other.x, self.y - other.y, self.z - other.z)
end

function FVECTOR_MT:__mul(other)
    local v = IsNumber(other)
    if v ~= nil then
        return FVector_(self.x * v, self.y * v, self.z * v)
    end
    return FVector_(self.x * other.x, self.y * other.y, self.z * other.z)
end

function FVECTOR_MT:__div(other)
    local v = IsNumber(other)
    if v ~= nil then
        return FVector_(self.x / v, self.y / v, self.z / v)
    end
    return FVector_(self.x / other.x, self.y / other.y, self.z / other.z)
end

function FVECTOR_MT:__eq(other)
    return self.x == other.x and self.y == other.y and self.z == other.z
end

function FVECTOR_MT:__unm()
    return FVector_(-self.x, -self.y, -self.z)
end

function FVECTOR_MT:Dot(other)
    return self.x * other.x + self.y * other.y + self.z * other.z
end

function FVECTOR_MT:Cross(other)
    return FVector_(
        self.y * other.z - self.z * other.y,
        self.z * other.x - self.x * other.z,
        self.x * other.y - self.y * other.x
    )
end

function FVECTOR_MT:Mul(other)
    self.x = self.x * other
    self.y = self.y * other
    self.z = self.z * other
end

function FVECTOR_MT:Div(other)
    self.x = self.x / other
    self.y = self.y / other
    self.z = self.z / other
end

function FVECTOR_MT:Add(other)
    self.x = self.x + other.x
    self.y = self.y + other.y
    self.z = self.z + other.z
end

function FVECTOR_MT:Normalize()
    local len = math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
    self.x = self.x / len
    self.y = self.y / len
    self.z = self.z / len
end

function FVECTOR_MT:GetNormalized()
    local len = math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
    return FVector_(self.x / len, self.y / len, self.z / len)
end

-- Deprecated
FVECTOR_MT.GetNormal = FVECTOR_MT.GetNormalized

function FVECTOR_MT:Distance(other)
    return math.sqrt((self.x - other.x) ^ 2 + (self.y - other.y) ^ 2 + (self.z - other.z) ^ 2)
end

function FVECTOR_MT:Distance2D(other)
    return math.sqrt((self.x - other.x) ^ 2 + (self.y - other.y) ^ 2)
end

function FVECTOR_MT:DistToSqr(other)
    return (self.x - other.x) ^ 2 + (self.y - other.y) ^ 2 + (self.z - other.z) ^ 2
end

function FVECTOR_MT:Negate()
    self.x = -self.x
    self.y = -self.y
    self.z = -self.z
end

function FVECTOR_MT:GetNegated()
    return FVector_(-self.x, -self.y, -self.z)
end

function FVECTOR_MT:Length()
    return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end

function FVECTOR_MT:LengthSqr()
    return self.x * self.x + self.y * self.y + self.z * self.z
end

function FVECTOR_MT:Length2D()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function FVECTOR_MT:Length2DSqr()
    return self.x * self.x + self.y * self.y
end

function FVECTOR_MT:Angle()
    local len = math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
    local x = self.x / len
    local y = self.y / len
    local z = self.z / len
    local yaw = 0
    local pitch = 0

    if y == 0 and x == 0 then
        yaw = 0
        if z > 0 then
            pitch = 270
        else
            pitch = 90
        end
    else
        yaw = math.atan2(y, x) * 180 / math.pi
        if yaw < 0 then
            yaw = yaw + 360
        end

        local tmp = math.sqrt(x * x + y * y)
        pitch = math.atan2(-z, tmp) * 180 / math.pi
        if pitch < 0 then
            pitch = pitch + 360
        end
    end

    return Angle(pitch, yaw, 0)
end

function FVECTOR_MT:ToScreen()
    -- TODO: Implement me.
    local vec = BadVector(self.x, self.y, self.z)
    return vec:ToScreen()
end

FVector = FVector_