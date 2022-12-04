input = open("day_04/input.txt", "r")

sum = 0

for line in readlines(input)
    elfs = split(line, ",")
    bounds_1 = split(elfs[1], "-")
    bounds_2 = split(elfs[2], "-")
    if (parse(Int,bounds_1[2]) >= parse(Int,bounds_2[1]) && parse(Int,bounds_2[2]) >= parse(Int,bounds_1[1]))
        global sum += 1
    end
end

print("result: ", sum)

close(input)