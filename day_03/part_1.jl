using StatsBase

input = open("day_03/input.txt", "r")

sum = 0

for line in readlines(input)
    half = trunc(Int, length(line)/2)
    found = false
    for letter_1 in line[1:half]
        if found == true
            break
        end
        for letter_2 in line[half+1:end]
            if found == true
                break
            end
            if letter_1 == letter_2
                ascii_value = Int(letter_1)
                if ascii_value > 96
                    global sum += ascii_value - 96
                else
                    global sum += ascii_value - 64 + 26
                end
                found = true
            end
        end
    end
end

print("result: ", sum)

close(input)