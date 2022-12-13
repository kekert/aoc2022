input = split(read("julia/2022/input/day11.txt", String), "\n\n")

monk = []
for i in input
    m = match(r"items: (.+)\n.+= (.*)\n.+by (\d+)\n.+(\d+)\n.+(\d+)"m, i)
    push!(monk, [parse.(Int, split(m[1], ", ")), eval(Meta.parse("old->" * m[2])), parse(Int, m[3]), parse(Int, m[4]), parse(Int, m[5]), 0])
end
denom = prod([x[3] for x in monk])

for round in 1:10000, m in monk #20 for A
    while length(m[1]) > 0
        m[6] += 1
        new = m[2](popfirst!(m[1])) % denom # div(,3) for A
        push!(monk[m[new % m[3] == 0 ? 4 : 5]+1][1], new)
    end
end

println(prod(sort([m[6] for m in values(monk)])[end-1:end]))