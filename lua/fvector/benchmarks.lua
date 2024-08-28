local Vector = Vector

local Benchmarks = {
    BenchmarkCreateVector = function(iterations)
        for i = 1, iterations do
            local v = Vector(1000, 2000, 3000)
            if v ~= nil then v = v end
        end
    end,
    BenchmarkCreateFVector = function(iterations)
        for i = 1, iterations do
            local v = FVector(1000, 2000, 3000)
            if v ~= nil then v = v end
        end
    end,
    BenchmarkAddVector = function(iterations)
        local a = Vector(1000, 2000, 3000)
        local b = Vector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a + b
            if v ~= nil then v = v end
        end
    end,
    BenchmarkAddFVector = function(iterations)
        local a = FVector(1000, 2000, 3000)
        local b = FVector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a + b
            if v ~= nil then v = v end
        end
    end,
    BenchmarkMulVector = function(iterations)
        local a = Vector(1000, 2000, 3000)
        local b = Vector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a * b
            if v ~= nil then v = v end
        end
    end,
    BenchmarkMulFVector = function(iterations)
        local a = FVector(1000, 2000, 3000)
        local b = FVector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a * b
            if v ~= nil then v = v end
        end
    end,
    BenchmarkDivVector = function(iterations)
        local a = Vector(1000, 2000, 3000)
        local b = Vector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a / b
            if v ~= nil then v = v end
        end
    end,
    BenchmarkDivFVector = function(iterations)
        local a = FVector(1000, 2000, 3000)
        local b = FVector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a / b
            if v ~= nil then v = v end
        end
    end,
    BenchmarkDotVector = function(iterations)
        local a = Vector(1000, 2000, 3000)
        local b = Vector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a:Dot(b)
            if v ~= nil then v = v end
        end
    end,
    BenchmarkDotFVector = function(iterations)
        local a = FVector(1000, 2000, 3000)
        local b = FVector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a:Dot(b)
            if v ~= nil then v = v end
        end
    end,
    BenchmarkCrossVector = function(iterations)
        local a = Vector(1000, 2000, 3000)
        local b = Vector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a:Cross(b)
            if v ~= nil then v = v end
        end
    end,
    BenchmarkCrossFVector = function(iterations)
        local a = FVector(1000, 2000, 3000)
        local b = FVector(4000, 5000, 6000)
        for i = 1, iterations do
            local v = a:Cross(b)
            if v ~= nil then v = v end
        end
    end,
    BenchmarkLengthVector = function(iterations)
        local a = Vector(1000, 2000, 3000)
        for i = 1, iterations do
            local v = a:Length()
            if v ~= nil then v = v end
        end
    end,
    BenchmarkLengthFVector = function(iterations)
        local a = FVector(1000, 2000, 3000)
        for i = 1, iterations do
            local v = a:Length()
            if v ~= nil then v = v end
        end
    end,
    BenchmarkLength2DVector = function(iterations)
        local a = Vector(1000, 2000, 3000)
        for i = 1, iterations do
            local v = a:Length2D()
            if v ~= nil then v = v end
        end
    end,
    BenchmarkLength2DFVector = function(iterations)
        local a = FVector(1000, 2000, 3000)
        for i = 1, iterations do
            local v = a:Length2D()
            if v ~= nil then v = v end
        end
    end,
    BenchmarkLengthSqrVector = function(iterations)
        local a = Vector(1000, 2000, 3000)
        for i = 1, iterations do
            local v = a:LengthSqr()
            if v ~= nil then v = v end
        end
    end,
    BenchmarkLengthSqrFVector = function(iterations)
        local a = FVector(1000, 2000, 3000)
        for i = 1, iterations do
            local v = a:LengthSqr()
            if v ~= nil then v = v end
        end
    end,
}

function BenchmarkFVector()

    local function Benchmark(name, iterations)
        local func = Benchmarks[name]
        local start = SysTime()
        func(iterations)
        local delta = SysTime() - start
        local fps = math.Round(1 / delta, 2)

        print(name .. ": iterations: " .. tostring(iterations) .. ", " .. tostring(iterations / delta) .. " ops/s, total time: " .. tostring(delta) .. "s, fps: " .. tostring(fps))
        -- Force garbage collection so it won't affect the next benchmark.
        collectgarbage("collect")
    end

    local iterations = 1000000

    Benchmark("BenchmarkCreateVector", iterations)
    Benchmark("BenchmarkCreateFVector", iterations)
    Benchmark("BenchmarkAddVector", iterations)
    Benchmark("BenchmarkAddFVector", iterations)
    Benchmark("BenchmarkMulVector", iterations)
    Benchmark("BenchmarkMulFVector", iterations)
    Benchmark("BenchmarkDivVector", iterations)
    Benchmark("BenchmarkDivFVector", iterations)
    Benchmark("BenchmarkDotVector", iterations)
    Benchmark("BenchmarkDotFVector", iterations)
    Benchmark("BenchmarkCrossVector", iterations)
    Benchmark("BenchmarkCrossFVector", iterations)
    Benchmark("BenchmarkLengthVector", iterations)
    Benchmark("BenchmarkLengthFVector", iterations)
    Benchmark("BenchmarkLength2DVector", iterations)
    Benchmark("BenchmarkLength2DFVector", iterations)
    Benchmark("BenchmarkLengthSqrVector", iterations)
    Benchmark("BenchmarkLengthSqrFVector", iterations)
end