input = open("day_01/input.txt", "r")

result = 0
current_sum = 0 # sum of the current elf

for line in readlines(input)
    if length(line) > 0
        global current_sum += parse(Int, line)
    else # new elf
        global result = max(result, current_sum)
        global current_sum = 0
    end
end

println("result: ", result)

close(input)
