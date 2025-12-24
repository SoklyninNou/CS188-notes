= Non-deterministic Search
Unlike deterministic search, *Non-deterministic Search* is use to model the real world since there are uncertainty in the world like failures or inherent chance like dice rolls in a game. We can use a *Markov Chain* to model this probabilistic model to better understand the framework.

== Markov Decision Problem
A *Markov Decision Problem* is a search problem where the tree is modelled after a Markov Chain. MDPs are defined with:
- A set of states s $in$ S
- A set of actions a $in$ A
- A transition function $T(s, a, s’)$
  - Probability that a from s leads to $s’$, i.e., $P(s’| s, a)$, also called the model or the dynamics
- A reward function $R(s, a, s’)$ or just $R(s)$ and $R(s’)$
  - What reward you give for taking action $a$ at state $s$ and ending at state $s'$
- A start state and terminal state
Why do we use Markov? For Markov decision processes, “Markov” means action outcomes depend only on the current state. This simplifies the model since we don't have to consider the past of future.

In Deterministic Search, we have a plan that outlines the optimal path for the entire tree. This is in contrast to MDPs, which implements a policy $pi^*$. A *Policy* outlines an action for every single state. Usually, policies cannot be implemented as a lookup table since they are often extremely large.

There are some implementations of rewards we can do:
- *Living Reward:* Usually negative, the lower the reward, the faster the agent will want to exit.

*MDP Search Tree:* Each MDP state projects an Expectimax-like search tree

== Utilities of Sequences
There are many configurations of when a reward is received. Sometimes we want to make the agent prefer an immediate reward rather than a reward later. To do this, we make the reward decay exponentially by adding a *Discount Factor*. What this means is that the utility of a reward is calculated by:
$
R(s,t) = lambda^t R(s)
$
This means that the reward $R$ is worth $lambda^T R$ at time step $t$, where $lambda <= 1$.

If we assume stationary preferences:
$
[a_1, a_2, dots] succ [b_1, b_2, dots] arrow.double.r.l.long
[r, a_1, a_2, dots] succ [r, b_1, b_2, dots]
$
then we can define utility as:
- Additive: $U[r_0, r_1, dots] = r_0 + r_1 + r_2 + dots$
- Discounted: $U[r_0, r_1, dots] = r_0 + lambda r_1 + lambda^2 r_1 + dots$

What if the game lasts forever? Well, we can implement a finite horizon to terminate the game at a fixed time step. What we can also do is to use a discount factor less then one, which will be bounded due to the geometric series.

== Solving MDPs
To calculate the optimal utility at a given state, we need to recurse over the possible successor states. We define the optimal value of a given state $s$ as:
$
V^*(s) = max_a Q^*(s,a) 
$
where $Q^*(s,a)$ is the optimal value of taking an action $a$ at state $s$. We compute $Q^*(s,a)$ by:
$
Q^*(s,a) = sum_s' T(s,a,s') [R(s,a,s') + lambda V^*(s')]
$
this equation says that the optimal value of taking an action $a$ at state $s$ is the sum of the expected values of state $s'$ and its possible successors.

Substituting $Q^*$ into the first equation, we get:
$
V^*(s) = max_a sum_s' T(s,a,s') [R(s,a,s') + lambda V^*(s')]
$

We also need to implement *Time Limited Values*. This means we now have $V_k (s)$ to be the optimal value of s if the game ends in k more time steps. This allows us to bound our recursive tree to a depth of k. We now compute this by:
$
V_(k+1)(s) = max_a sum_s' T(s,a,s') [R(s,a,s') + lambda V_k^*(s')]
$
where $V_0 (s') = 0$ is our base case. The complexity of this algorithm is $O(S^2 A)$.\

*Example:*
#align(center)[#image("../images/time_limited.png", width: 80%)]