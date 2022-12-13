input = split.(split(read("julia/2022/input/day13.txt", String), "\n\n"), "\n")

function check(l, r)
    if typeof(l) == typeof(r) == Int64
        return l < r ? true : l > r ? false : nothing
    elseif l isa Array && r isa Array
        for i in 1:max(length(l), length(r))
            if i > length(l)
                return true
            elseif i > length(r)
                return false
            end
            if (ch = check(l[i], r[i])) !== nothing
                return ch
            end
        end
    else
        if typeof(l) == Int64
            check([l], r)
        else
            check(l, [r])
        end
    end
end

num = 0
parsed = []
for (i, lr) in enumerate(input)
    lr = [eval(Meta.parse(x)) for x in lr]
    push!(parsed, lr...)
    num += check(lr...) ? i : 0
end

println(num)
newbies = [[[2]], [[6]]]
push!(parsed, newbies...)
println(prod(findall(∈(newbies), sort(parsed, lt=check))))


# compare(a::Integer, b::Integer) = sign(b - a)
# compare(a::Integer, b::Vector) = compare([a], b)
# compare(a::Vector, b::Integer) = compare(a, [b])

# function compare(a::Vector, b::Vector)
#     na = length(a)
#     nb = length(b)

#     for k in 1:min(na, nb)
#         v = compare(a[k], b[k])
#         v == 0 && continue
#         return v
#     end

#     return sign(nb - na)
# end
