input = open("day_07/input.txt", "r")

command_lines = []

for line in readlines(input)
    push!(command_lines, line)
end

    # $cd
        # ..
        # dir_name
    # $ls
    # dir
    # else: size, name
    
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
        for i in 0:length(current_path)
            paths = join(current_path[1:i])
            if !haskey(folder_size, paths)
                folder_size[paths] = 0
            end
            folder_size[paths] = folder_size[paths] + parse(Int,a)
        end
    end
end

sum = 0

for (k,v) in folder_size
    if v <= 100000
        global sum += v
    end
end

print("result: ", sum)

close(input)