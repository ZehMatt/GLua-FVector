AddCSLuaFile()

AddCSLuaFile("fvector/fvector.lua")
AddCSLuaFile("fvector/tests.lua")
AddCSLuaFile("fvector/benchmarks.lua")
AddCSLuaFile("fvector/override.lua")

print("FVector")

include("fvector/fvector.lua")
include("fvector/tests.lua")
include("fvector/benchmarks.lua")
include("fvector/override.lua")