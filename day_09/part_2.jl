input = open("day_09/input.txt", "r")

pos_t = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
total_positions_t = [[[0,0]], [[0,0]], [[0,0]], [[0,0]], [[0,0]], [[0,0]], [[0,0]], [[0,0]], [[0,0]], [[0,0]]]

function move_t(n_tail)
    if abs(pos_t[n_tail][2]-pos_t[n_tail-1][2])>1 && abs(pos_t[n_tail][1]-pos_t[n_tail-1][1])>1
        pos_t[n_tail][2] = (pos_t[n_tail][2] + pos_t[n_tail-1][2])/2
        pos_t[n_tail][1] = (pos_t[n_tail][1] + pos_t[n_tail-1][1])/2
    elseif abs(pos_t[n_tail][1]-pos_t[n_tail-1][1])>1
        pos_t[n_tail][1] = (pos_t[n_tail][1] + pos_t[n_tail-1][1])/2
        if pos_t[n_tail][2] != pos_t[n_tail-1][2]
            pos_t[n_tail][2] = pos_t[n_tail-1][2]
        end
    elseif abs(pos_t[n_tail][2]-pos_t[n_tail-1][2])>1
        pos_t[n_tail][2] = (pos_t[n_tail][2] + pos_t[n_tail-1][2])/2
        if pos_t[n_tail][1] != pos_t[n_tail-1][1]
            pos_t[n_tail][1] = pos_t[n_tail-1][1]
        end
    end
    if pos_t[n_tail] ∉ total_positions_t[n_tail]
        push!(total_positions_t[n_tail], copy(pos_t[n_tail]))
    end
end

for line ∈ readlines(input)
    direction, length = split(line)
    length = parse(Int, length)
    while length > 0
        if direction == "D"
            pos_t[1][2] -= 1
        elseif direction == "U"
            pos_t[1][2] += 1
        elseif direction == "L"
            pos_t[1][1] -= 1
        elseif direction == "R"
            pos_t[1][1] += 1
        end
        for n_tail in 2:10
            move_t(n_tail)
        end
        length -= 1
    end
end

result = length(total_positions_t[10])

print("result: ", result)

close(input)