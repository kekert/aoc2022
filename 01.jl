input = split.(split(read("julia/2022/input/01.txt", String), "\n\n"), "\n")
println(maximum([sum(parse.(Int,i)) for i in input]))
println(sum(sort([sum(parse.(Int,i)) for i in input])[end-2:end]))
