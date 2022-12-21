input = open("day_10/input.txt", "r")

register = 1
n_cycle = 0

function draw_pixel(register, cycle)
    shorted_cycle = (cycle)%40
    if shorted_cycle == register || shorted_cycle == (register -1) || shorted_cycle == (register + 1)
        print('#')
    else
        print('.')
    end
    if (shorted_cycle+1)%40 == 0
        print("\n")
    end
end

for line in readlines(input)
    if occursin("addx", line)
        a,b = split(line)
        remaining_cycles = 2
        while remaining_cycles > 0
            draw_pixel(register, n_cycle)
            global n_cycle += 1
            remaining_cycles -= 1
            
        end
        global register += parse(Int, b)
    else
        draw_pixel(register, n_cycle)
        global n_cycle += 1
        
    end
    
end

close(input)