input = readlines("julia/2022/input/day12.txt")
heights = reduce(hcat, collect.(readlines()))

function trail(heights, S)
    steps = fill(-1, size(heights))
    steps[S] .= 0
    heights[S] .= 'a'
    E = findfirst(==('E'), heights)
    heights[E] = 'z'
    i = 0
    while steps[E] < 0
        i += 1
        for c in findall(==(i - 1), steps), m in [(1, 0), (-1, 0), (0, 1), (0, -1)]
            ind = m .+ Tuple(c)
            if all((1, 1) .<= ind .<= size(heights)) && heights[ind...] - heights[c] <= 1 && steps[ind...] < 0
                steps[ind...] = i
            end
        end
    end
    i
end

println(trail(copy(heights), [findfirst(x -> x == 'S', heights)]))
println(trail(heights, findall(==('a'), heights)))