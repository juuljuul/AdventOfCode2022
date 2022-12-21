input = open("day_09/input.txt", "r")

pos_h = [0,0]
pos_t = [0,0]
total_positions_t = [[0,0]]

function move_t(position_h)
    if abs(pos_t[2]-position_h[2])>1
        pos_t[2] = (pos_t[2] + position_h[2])/2
        if pos_t[1] != position_h[1] 
            pos_t[1] = position_h[1]
        end
    elseif abs(pos_t[1]-position_h[1])>1
        pos_t[1] = (pos_t[1] + position_h[1])/2
        if pos_t[2] != position_h[2]
            pos_t[2] = position_h[2]
        end
    end
    if pos_t ∉ total_positions_t
        push!(total_positions_t, copy(pos_t))
    end
end

for line ∈ readlines(input)
    direction, length = split(line)
    length = parse(Int, length)
    while length > 0
        if direction == "D"
            pos_h[2] -= 1
        elseif direction == "U"
            pos_h[2] += 1
        elseif direction == "L"
            pos_h[1] -= 1
        elseif direction == "R"
            pos_h[1] += 1
        end
        move_t(pos_h)
        length -= 1
    end
end

result = length(total_positions_t)

print("result: ", result)

close(input)