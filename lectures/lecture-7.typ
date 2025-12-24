== Resource Limits
One problem with making a tree of possibility is the resource consumption and the limited space we have. To fix this, we implement *Depth-Limited Search*. In this search, we only search up to a certain depth of the tree. We then estimate the value of the nodes at that depth, since we are not at the terminal state. We would then propagate the values up to the root. This would remove the guarantee of optimal play.

One way to estimate the value of the node is to assign values on every action and state. We could then calculate the value function of the sequence of actions and states taken.

A potential problem is a replanning agent. This type of agent can loop at a tie-breaker. This will lead to the agent taking a series of looping actions and being stuck. Another reason for the being stuck is the evaluation function. A good evaluation function should minimize ties of sibling nodes.

== Indeterministic Games (Expectimax)
So far, we assumed that the opponent is playing optimally. But, we need to handle the case in which they are not or when we are unsure of the opponent's strategy. This means that we have to introduce an idea of uncertainty to our node selection method. This is the idea of *Expectimax*. Expectimax is a search algorithm where the children node is selected based on specific probability. This allows us to represent the average value of the node.

#align(center)[#image("../images/expectimax.png",width: 75%)]

In Expectimax, unlike Minimax, the magnitude of the values matter since we are taking the average of the nodes. This means we need to formulate a *Utility Function* which describes the preferences of the agent. The *Preferences* model how much a prize is valued over another.

== Multi-Agent Utilities
In the case where there are more than two players, the game will have more complex behaviors, and no longer a zero-sum game. This is because we can model each player differently, whether they are indifferent of the other player's score, adversarial, or supporting.
