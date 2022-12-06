#= matrix input:
                    [Q]     [P] [P]
                [G] [V] [S] [Z] [F]
            [W] [V] [F] [Z] [W] [Q]
        [V] [T] [N] [J] [W] [B] [W]
    [Z] [L] [V] [B] [C] [R] [N] [M]
[C] [W] [R] [H] [H] [P] [T] [M] [B]
[Q] [Q] [M] [Z] [Z] [N] [G] [G] [J]
[B] [R] [B] [C] [D] [H] [D] [C] [N]
 1   2   3   4   5   6   7   8   9 
 =#

input = open("day_05/input.txt", "r")

stacks = ["BQC" , "RQWZ", "BMRLV", "CZHVTW", "DZHBNVG", "HNPCJFVQ", "DGTRWZS", "CGMNBWZP", "NJBMWQFP"]

sum = 0

for line in readlines(input)
    # move 3 from 6 to 2
    local a = split(line)
    quantity = parse(Int, a[2])
    n_source_stack = parse(Int, a[4])
    n_target_stack = parse(Int, a[6])
    while quantity > 0
        stacks[n_target_stack] = stacks[n_target_stack] * last(stacks[n_source_stack])
        stacks[n_source_stack] = chop(stacks[n_source_stack])
    # chop(string, 1) # cuts last element
    # last (string, 1) # get last element of string
        quantity -= 1
    end
    print(stacks, "\n")
end

print("result: ")
# BWNCQRMDB

close(input)