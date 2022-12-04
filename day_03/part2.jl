using StatsBase

input = open("day_03/input.txt", "r")

sum = 0
array = []

for line in readlines(input)
    push!(array, line)
end

third = trunc(Int, length(array)/3)
for packet = 1:third
    found = false
    for letter_1 in array[3*packet-2]
        if found == true
            break
        end
        for letter_2 in array[3*packet-1]
            if found == true
                break
            end
            if letter_1 == letter_2
                for letter_3 in array[3*packet]
                    if letter_1 == letter_3
                        ascii_value = Int(letter_3)
                        if ascii_value > 96
                            global sum += ascii_value - 96
                        else
                            global sum += ascii_value - 64 + 26
                        end
                        found = true
                        break
                    end
                end
            end
        end
    end
end

print("result: ", sum)

close(input)