using DataStructures

input = read("julia/2022/input/05.txt", String)
(start, steps) = split(input, "\n\n")
steps = split.(split(steps, "\n"), " ")
state = DefaultDict(() -> Char[])
foreach(s -> [pushfirst!(state[i], s[v]) for (i, v) in enumerate(2:4:length(s)) if s[v] != ' '], split(start, "\n")[1:end-1])

function solve(state, steps, stacked=false)
    for s in steps
        (num, source, dest) = [parse(Int, s[i]) for i in 2:2:6]
        round = []
        for _ in 1:num
            func = stacked ? pushfirst! : push!
            func(round, state[source][end])
            pop!(state[source])
        end
        foreach(r -> push!(state[dest], r), round)
    end
    join([i[2][end] for i in sort(collect(state), by=x -> x[1])])
end

println(solve(deepcopy(state), steps))
println(solve(state, steps, true))