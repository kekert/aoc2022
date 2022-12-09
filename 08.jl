input = parse.(Int64, reduce(hcat, collect.(readlines("julia/2022/input/08.txt"))))

a = b = 0
for x in axes(input, 1), y in axes(input, 2)
    lrtd = [input[x-1:-1:1, y:y], input[x+1:end, y:y], input[x:x, y-1:-1:1], input[x:x, y+1:end]]
    a += any(val .> maximum.(lrtd, init=-1))
    b = max(b, prod([something(findfirst(i -> i >= input[x, y], vec(j)), length(j)) for j in lrtd]))
end

@show(a, b)
