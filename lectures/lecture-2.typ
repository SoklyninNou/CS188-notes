= Search Problems
A *Search Problem* consists of:
- *State space:* all possible states
- *Successor Function:* What is the next state after taking an action in a given state
- *Start State:*What is the initial state
- *Goal Test:* What is the machine trying to achieve

We would then need a solution to solve the search problem. A *Solution* is a sequence of actions starting from the Start State to the Goal State.\
In Search Problems, we want to abstract away unnecessary details to capture just enough information.

== State Space
A *State Space* consists of a *World State*, every single detail of the environment, and a *Search State*, only details needed for planning.

== State Space Graphs
This is a mathematical way of representing search problems. The nodes are the possible states and the arcs/edges represent the successors.\

A *Search Tree* is a tree where the root node is the start state, the edges are the actions, and the children are successors of the parent given the edge action.\
Every search algorithm should be:
- *Complete:* Guaranteed to find a solution if one exists
- *Optimal:* Guaranteed to find the least solution
There is also the time and space complexity that comes with every algorithm.

=== Depth-First Search
This strategy is to explore the the deepest nodes first. It uses LIFO stack, which means we keep pushing all child of the node, pop the top node and iteratively run the algorithm. Terminates when the stack is empty.

`def dfs:
  place root node on stack
  while stack is not empty
    pop the stack
    ignore if node is visited
    append node to result and set as visited
    for every children of node:
      if the node is not visited
        set node as visited
        place node in stack
  return result
`

=== Breadth-First Search
Expand across by breadth instead of depth. This is implemented using a FIFO queue. we start with the root node, place all children in a queue, dequeue the first children, repeat.

`def bfs:
  place root node in queue
  while queue is not empty
    dequeue a node
    ignore if node is visited
    append node to result and set as visited
    for every children of node:
      if the node is not visited
        set node as visited
        place node in queue
  return result
`

== Uniform Cost Search
Expands the cheapest node first using a priority queue. This is similar to Breadth-First Search where each depth is the cost of the node. This means we can represent the tree with cost contours, or layer with path of equal cost.