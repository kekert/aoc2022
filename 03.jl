input = readlines("julia/2022/input/03.txt")

a = [intersect(i[1:div(length(i), 2)], i[div(length(i), 2)+1:end])[1] for i in input]
b = [intersect(input[i], input[i+1], input[i+2])[1] for i in 1:3:length(input)]
getScore = (x) -> sum([i in 'a':'z' ? i - 'a' + 1 : i - 'A' + 27 for i in x])

println(getScore(a))
println(getScore(b))

# val(c) = islowercase(c) ? c - 'a' + 1 : c - 'A' + 27
