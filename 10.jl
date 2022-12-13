input = readlines("julia/2022/input/day10.txt")

val = 1
steps = [20, 60:40:220...]
strength = []
screen = []

function register(screen, strength, val)
    i = length(screen)
    push!(screen, val in i%40-1:i%40+1 ? 1 : 0)
    push!(strength, val)
end

for i in input
    if i == "noop"
        register(screen, strength, val)
    else
        add = parse(Int, split(i, " ")[2])
        foreach(_ -> register(screen, strength, val), 1:2)
        val += add
    end
end

println(sum(strength[steps] .* steps))
display(transpose(reshape(screen, 40, 6)))
