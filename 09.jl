input = split.(readlines("julia/2022/input/day9.txt"), " ")
moves = Dict("R" => (1, 0), "L" => (-1, 0), "U" => (0, 1), "D" => (0, -1))

move = (d) -> maximum(abs.(d)) > 1 ? map(x -> sign(x), d) : (0, 0)

cnt = 10 # 2 for A
knots = [(0, 0) for _ in 1:cnt]
hist = Set()

for i in input
    for j in 1:parse(Int, i[2])
        knots[1] = knots[1] .+ moves[i[1]]
        for k in 2:cnt
            knots[k] = knots[k] .+ move(knots[k-1] .- knots[k])
        end
        push!(hist, knots[cnt])
    end
end

@show(length(hist))
