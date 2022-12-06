input = open("day_06/input.txt", "r")

length_marker = 14

for line in readlines(input)
    for index in 1:length(line)-length_marker
        is_marker = true
        for i in index:index+length_marker-1, j in index:index+length_marker-1
            if i != j
                if line[i] == line[j]
                    is_marker = false
                end
            end
        end
        if is_marker == true
            print("yeyy! solution: ", index+length_marker-1)
            break
        end
    end
end

close(input)
