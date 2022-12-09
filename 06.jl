input = read("julia/2022/input/06.txt", String)

function solve(cnt)
    for i in eachindex(input)
        if length(unique(input[i:i+cnt-1])) == cnt
            return i + cnt - 1
        end
    end
end
@show(solve(4), solve(14))