input = open("day_08/input.txt", "r")

size_matrix = 99
sum = (size_matrix-1)*4

# create matrix
trees    = zeros(size_matrix, size_matrix)
n_row    = 0
n_column = 0
for line in readlines(input)
    global n_row += 1
    for char in line
        global n_column += 1
        trees[n_row, n_column] = parse(Int,char)
    end
    global n_column = 0
end

for row in 2:(size_matrix-1)
    for column in 2:(size_matrix-1)
        height_current_tree = trees[row, column]
        visible = [true, true, true, true]
        for upper_tree in 1:row-1
            if trees[upper_tree, column] >= height_current_tree
                visible[1] = false
            end
        end
        for lower_tree in row+1:size_matrix
            if trees[lower_tree, column] >= height_current_tree
                visible[2] = false
            end
        end
        for left_tree in 1:column-1
            if trees[row, left_tree] >= height_current_tree
                visible[3] = false
            end
        end
        for right_tree in column+1:size_matrix
            if trees[row, right_tree] >= height_current_tree
                visible[4] = false
            end
        end
        if count(visible) > 0
            global sum += 1
        end
    end
end


print("result: ", sum)

close(input)