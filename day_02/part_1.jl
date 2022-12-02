input = open("day_02/input.txt", "r")

sum = 0
# A,B,C = rock, paper, scissors (1,2,3)
# X,Y,Z = rock, paper, scissors
for line in readlines(input)
    game = split(line)
    if game[2] == "X"
        global sum += 1
        if game[1] == "A"
            global sum += 3
        elseif game[1] == "B"
            global sum += 0
        elseif game[1] == "C"
            global sum += 6
        end
    elseif game[2] == "Y"
        global sum += 2
        if game[1] == "A"
            global sum += 6
        elseif game[1] == "B"
            global sum += 3
        elseif game[1] == "C"
            global sum += 0
        end
    elseif game[2] == "Z"
        global sum += 3
        if game[1] == "A"
            global sum += 0
        elseif game[1] == "B"
            global sum += 6
        elseif game[1] == "C"
            global sum += 3
        end
    else
        print("nothing to do here \n")
    end
end

print("result: ", sum)

close(input)