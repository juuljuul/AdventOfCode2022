input = open("day_01/input.txt", "r")

result = 0
current_sum = 0
all_sums = []

for line in readlines(input)
    if length(line) > 0
        global current_sum += parse(Int, line)
    else
        append!(all_sums, current_sum)
        current_sum = 0
    end
end

print(findmax(all_sums), "\n")
a = findmax(all_sums)
result += a[1]
deleteat!(all_sums, a[2])

print(findmax(all_sums), "\n")
a = findmax(all_sums)
result += a[1]
deleteat!(all_sums, a[2])

print(findmax(all_sums), "\n")
a = findmax(all_sums)
result += a[1]

println("result: ", result)

close(input)
