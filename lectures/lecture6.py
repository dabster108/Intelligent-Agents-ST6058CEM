import numpy as np
import matplotlib.pyplot as plt
from collections import deque
# 0 = path (white), 1 = wall (black)
maze = np.array([
    [1,0,1,1,1,1,1,1,1,0,1,1],
    [1,0,1,1,1,1,1,1,1,0,1,1],
    [1,0,0,0,0,0,0,0,0,0,0,1],
    [1,0,1,1,1,1,1,1,1,1,0,1],
    [1,0,1,0,0,0,0,0,0,1,1,1],
    [1,0,0,0,1,1,1,1,1,1,1,1],
    [1,0,1,0,1,1,1,0,1,1,1,1],
    [1,0,1,0,0,0,1,0,1,1,1,1],
    [1,0,1,1,1,0,0,0,0,0,0,1],
    [1,0,1,1,1,1,1,1,1,1,0,1],
    [0,0,1,1,1,1,1,0,0,0,0,1]
], dtype=int)

# Start (A) and Goal (B)
start = (10, 0)
goal = (6, 7)

# Plot
fig, ax = plt.subplots(figsize=(8, 7))
ax.imshow(maze, cmap="gray_r", interpolation="nearest")

# Draw borders around every cell
rows, cols = maze.shape
ax.set_xticks(np.arange(-0.5, cols, 1), minor=True)
ax.set_yticks(np.arange(-0.5, rows, 1), minor=True)
ax.grid(which="minor", color="gray", linestyle="-", linewidth=0.8)
ax.tick_params(which="minor", bottom=False, left=False)

# Labels
ax.text(start[1], start[0], "A", ha="center", va="center", color="blue", fontsize=16, fontweight="bold")
ax.text(goal[1], goal[0], "B", ha="center", va="center", color="red", fontsize=16, fontweight="bold")

ax.set_xticks([])
ax.set_yticks([])
ax.set_title("Maze From Reference Image")
plt.show()

# find all the available nodes, 
# save a list of all the "0" node in this maze
nodes = []
for row in range(len(maze)):
    for col in range(len(maze[row])):
        if maze[row][col] == 0:
            nodes.append((row, col))

#find all the available nodes,
nodes_available = []
for i in range(maze.shape[0]):
    for j in range(maze.shape[1]):
        if maze[i,j] == 0 : 
            print(" " , end = "" ) 
            nodes_available.append((i,j))
print(nodes_available)




possible_direction = ((0,1) , (0,-1) , (1,0) ,(1,0) ,(-1,0))
#for each nnodes make a a graph that can traverse through possible direction 
# add edges/neighbors only if nodeis white  "0" 

# for each possible direction 
#nenext row = row + d_row
#next_col = col + d_col

graph = {}
edges = []

for row, col in nodes:
    current = (row, col)
    neighbors = []
    for d_row, d_col in possible_direction:
        next_row = row + d_row
        next_col = col + d_col
        if 0 <= next_row < rows and 0 <= next_col < cols and maze[next_row, next_col] == 0:
            neighbor = (next_row, next_col)
            neighbors.append(neighbor)
            if current < neighbor:
                edges.append((current, neighbor))
        graph[current] = neighbors 




def bfs_path(graph, start_node, goal_node):
    queue = deque([start_node])
    parents = {start_node: None}
    while queue:
        current = queue.popleft()
        if current == goal_node:
            break
        for neighbor in graph[current]:
            if neighbor not in parents:
                parents[neighbor] = current
                queue.append(neighbor)
    if goal_node not in parents:
        return None

    path = []
    current = goal_node
    while current is not None:
        path.append(current)
        current = parents[current]

    path.reverse()
    return path
bfs_path(graph, start, goal)



# dfs path 
def dfs_path(graph, start_node, goal_node):
    stack = [start_node]
    parents = {start_node: None}
    while stack:
        current = stack.pop()
        if current == goal_node:
            break
        for neighbor in graph[current]:
            if neighbor not in parents:
                parents[neighbor] = current
                stack.append(neighbor)
    if goal_node not in parents:
        return None

    path = []
    current = goal_node
    while current is not None:
        path.append(current)
        current = parents[current]

    path.reverse()
    return path
dfs_path(graph, start, goal)



