= Types of Games

== Deterministic Games
A *Deterministic Game* is a game with no form of chance. It follows many possible structures, but it should generally have an initial state, actions from each states to another, a terminal test, and the terminal utility. The solution to these games is a policy of in each states.

== Zero Sum Games
In a *Zero-Sum Game*, every Agents have opposite utilities, this lets us think of a single value that one maximizes and the other minimizes. This means that each agent is adversarial.

== Adversarial Search
Because these types of games has two agents that are who are completely adversarial against each other, the agents must also consider the actions of its opponents, who considers the agents' actions, and so on. We assume the adversary plays optimally and is aware we are also playing optimally.

== Minimax Values
We can formulate actions of both agents, if they take turns, as nodes in a tree. We do this by alternating between layers of which one agent take action then the other does. Because each agent respectively minimize or maximize the utility, the value of the node as the min/max of the node's children.

#align(center)[#image("../images/minimax.png", width: 75%)]

== Alpha-Beta Pruning
In a typical minimax tree, we are essentially running depth-first search. This is inefficients because it has to scan the entire tree, even if the sub-tree will be irrelevant. This is why we need *Alpha-Beta Pruning*.

Alpha-Beta Pruning is when we set a lower bound for each subsequent sibling sub-tree, letting us ignore the rest of the nodes if the upper-bound of that sub-tree is lower than the lower bound. In other words, if with finish a sub-tree and know that the adversary will a value $x$, and the first node of the next sub-tree produces a value $y<x$, we can ignore the rest of that sub-tree since we already have a value greater than its upper-bounded value. The upper-bound is the value which the adversary will pick in that sub-tree.

#align(center)[#image("../images/alpha-beta-pruning.png", width: 75%)]

The pruning has no effect on the final value of the root, but the intermediate values of each of the node could be incorrect since we ignore a potentially lower value. This means that if we care about what action to take, rather than just the utility, alpha-beta pruning doesn't allow for action selection.


