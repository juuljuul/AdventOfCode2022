input = open("day_08/input.txt", "r")

size_matrix = 99

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

all_scores = []

for row in 2:(size_matrix-1)
    for column in 2:(size_matrix-1)
        height_current_tree = trees[row, column]
        visible = [0, 0, 0, 0]
        for upper_tree in row-1:-1:1
            visible[1] += 1
            if trees[upper_tree, column] >= height_current_tree
                break
            end
        end
        for lower_tree in row+1:size_matrix
            visible[2] += 1
            if trees[lower_tree, column] >= height_current_tree
                break
            end
        end
        for left_tree in column-1:-1:1
            visible[3] += 1
            if trees[row, left_tree] >= height_current_tree
                break
            end
        end
        for right_tree in column+1:size_matrix
            visible[4] += 1
            if trees[row, right_tree] >= height_current_tree
                break
            end
        end
        scenic_score = visible[1] * visible[2] * visible[3] * visible[4]
        push!(all_scores, scenic_score)
        
    end
end

sort!(all_scores)
print("result: ", all_scores[end])

close(input)