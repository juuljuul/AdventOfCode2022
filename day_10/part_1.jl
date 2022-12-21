input = open("day_10/input.txt", "r")

signal_strength = []
register = 1
n_cycle = 0

for line in readlines(input)
    if occursin("addx", line)
        a,b = split(line)
        remaining_cycles = 2
        while remaining_cycles > 0
            n_cycle += 1
            remaining_cycles -= 1
            append!(signal_strength, n_cycle * register)
        end
        global register += parse(Int, b)
    else
        global n_cycle += 1
        append!(signal_strength, n_cycle * register)
    end
end

result = signal_strength[20] + signal_strength[60] + signal_strength[100] + signal_strength[140] + signal_strength[180] + signal_strength[220]
print("result: ", result)

close(input)