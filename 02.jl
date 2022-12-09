input = map(x -> [only(x[1]) - 'A', only(x[2]) - 'X'], split.(split(read("julia/2022/input/02.txt", String), "\n"), " "))

a = b = 0
for i in input
    a += i[2] + 1
    if i[2] == mod(i[1] + 1, 3)
        a += 6
    elseif i[1] == i[2]
        a += 3
    end

    if i[2] == 0 # lose
        b += mod(i[1] - 1, 3) + 1
    elseif i[2] == 1 # draw
        b += 3 + i[1] + 1
    elseif i[2] == 2 # win
        b += 6 + mod(i[1] + 1, 3) + 1
    end
end

println(a)
println(b)
