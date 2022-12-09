using DataStructures

input = read("julia/2022/input/07.txt", String)
input = split(replace(input, "\$ " => ""), "\n")

sizes = DefaultDict(() -> Int)
dir = ["/"]
for row in input
    if row != "ls"
        (first, second) = split(row, " ")
        if first == "cd"
            if second == ".."
                dir = dir[1:end-1]
            elseif second == "/"
                dir = ["/"]
            else
                dir = vcat(dir, second)
            end
        elseif first != "dir"
            sizes[vcat(dir, second)] = first
        end
    end
end

total = DefaultDict(0)
for s in sizes
    path = []
    for i in s[1][1:end-1]
        push!(path, i)
        total[join(path, "|")] += parse(Int, s[2])
    end
end

println(sum(filter(x -> x <= 100000, collect(values(total)))))
println(sort(filter(x -> x >= 30000000 - (70000000 - total["/"]), collect(values(total))))[1])

