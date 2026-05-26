import numpy as np
import matplotlib.pyplot as plt
import heapq

# Maze
maze = np.array([
    [1,0,1,1,1,0,1,1,1,0,1,1],
    [1,0,1,1,1,0,1,1,1,0,1,1],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,0,0,0,0,1,0,0,0,1,0],
    [0,1,0,1,1,0,1,0,1,0,1,0],
    [0,1,0,0,1,0,1,0,1,0,1,0],
    [0,1,0,1,1,0,1,0,1,0,1,0],
    [0,1,0,0,1,0,1,0,1,0,1,0],
    [0,1,0,1,1,0,1,0,1,0,0,0],
    [0,0,0,0,1,0,0,0,1,0,1,1]
])

start = (10, 0)
goal = (9, 11)

rows, cols = maze.shape


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
ax.set_title("Maze - 2")
plt.show()

# find nodes and edges in the maze, find availabe lnodes using heruistic calcualtion eahc distance using euclaidenac distance and plot in matplotlib

# code 


nodes = []
for row in range(len(maze)):
    for col in range(len(maze[row])):
        if maze[row][col] == 0:
            nodes.append((row, col))

# calcualting eculidaena distance anca caluating the find hte nodes clacuate heuristic distance and plot the edges we can travel
def heuristic(a, b):
    return np.sqrt((a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2)

# each node heuristic distance calcualte to tbhe goal and use matplotlib to plot the edges we can travel from each node to the goal based on the heuristic distance
heuristic_distances = {node: heuristic(node, goal) for node in nodes}
# plot the edges we can travel from each node to the goal based on the heuristic distance
fig, ax = plt.subplots(figsize=(8, 7))
ax.imshow(maze, cmap="gray_r", interpolation="nearest")
for node in nodes:    
    ax.plot([node[1], goal[1]], [node[0], goal[0]], color="blue", linestyle="--", linewidth=0.5)
ax.text(start[1], start[0], "A", ha="center", va="center", color="blue", fontsize=16, fontweight="bold")
ax.text(goal[1], goal[0], "B", ha="center", va="center", color="red", fontsize=16, fontweight="bold")
ax.set_xticks([])
ax.set_yticks([])
ax.set_title("Heuristic Distances to Goal")
plt.show()


