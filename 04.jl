input = parse .. (Int, split(readlines("julia/2022/input/04.txt"), r",|-"))
a = 0
b = 0
println(input)

po = [parse.(Int, split(j, r",|-")) for j in input]

for j in input
    i = parse.(Int, split(j, r",|-"))
    r1 = i[1]:i[2]
    r2 = i[3]:i[4]
    int = intersect(r1, r2)
    a += int == r2 || int == r1 ? 1 : 0
    b += length(int) >= 1 ? 1 : 0
end

println(a)
println(b)
