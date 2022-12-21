input = open("day_07/input.txt", "r")

command_lines = []

for line in readlines(input)
    push!(command_lines, line)
end
    
folder_size = Dict{String,Int64}("/" => 0) 
current_path = []

for c_line in command_lines
    a,b = split(c_line)

    if a == "\$"
        if b == "cd"
            c = chop(c_line, head = 5, tail = 0)
            if c == ".."
                pop!(current_path)
            elseif c == "/"
                folder_size["/"] = 0
            else
                push!(current_path, c)
            end
        elseif b == "ls"
        end
    elseif a == "dir" 
    else # it is a file
        for i in 1:length(current_path)
            paths = join(current_path[1:i])
            if !haskey(folder_size, paths)
                folder_size[paths] = 0
            end
            folder_size[paths] = folder_size[paths] + parse(Int,a)
        end
        folder_size["/"] = folder_size["/"] + parse(Int,a)
    end
end

total_space = folder_size["/"]
needed_space = 30000000
available_space = 70000000
free_space = available_space - total_space
to_be_freed = needed_space - free_space

possible_candidates = []
for (k,v) in folder_size
    if v >= to_be_freed
        push!(possible_candidates, v)
    end
end

sort!(possible_candidates)

print("result: ", possible_candidates[1])

close(input)