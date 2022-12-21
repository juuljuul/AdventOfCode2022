input = open("day_20/input.txt", "r")

pattern = Dict{Int64,Int64}()
original_pattern = Dict{Int64, Int64}()
id = 1
id_list = []
id_zero = 0
decrypt_key = 811589153

for line ∈ readlines(input)
    original_pattern[id] = decrypt_key * parse(Int, line)
    append!(id_list, id)
    if parse(Int, line) == 0
        global id_zero = id
    end
    global id += 1
end

unchanged_id_list = copy(id_list)

len = length(id_list)

for (key, value) in original_pattern
    new_value = (value -1) % (len-1) +1 
    if new_value < 0
        new_value = new_value + (len - 1)
    end
    pattern[key] = new_value
end

for round = 1:10
    for index in unchanged_id_list
        key = index
        value = pattern[key]
        current_position = findall(x->x==index, id_list)
        if length(current_position)> 1
            println("not good")
        end
        new_pos = current_position[1]+value
        if new_pos < 0
            new_pos = new_pos + (len - 1)
        elseif new_pos > len
            new_pos = new_pos - (len - 1)
        else
            new_pos += 0
        end

        if new_pos < 0
            new_pos = new_pos + (len - 1 )
        elseif new_pos > len
            new_pos = new_pos - (len - 1)
        else
            new_pos += 0
        end

        if new_pos == 1 && value < 0
            new_pos = len
        end
        if new_pos == 0
            new_pos = len
        end
        # delete from old position (actually not necessary)
        popat!(id_list, current_position[1])
        # insert to new position
        new_id_list = copy(id_list[1:new_pos-1])
        append!(new_id_list, key)
        append!(new_id_list, id_list[new_pos:end])
        global id_list = copy(new_id_list)
    end
end

# find position of the 0
z  = findfirst(x->x==id_zero, id_list)

result = original_pattern[id_list[(z+1000-1)%len+1]] +  original_pattern[id_list[(z+2000-1)%len+1]] +  original_pattern[id_list[(z+3000-1)%len+1]]

println("result: ", result)

close(input)
