= Reinforcement Learning
In *Reinforcement Learning* we assume a MDP:
- A set of states $s in S$
- A set of actions (per state) $A$
- A model $T(s,a,s’)$
- A reward function $R(s,a,s’)$

The difference is that we don't know the transition or reward function. Reinforcement learning takes into account the following concepts:
- *Exploration:* perform unknown actions to gather  information
- *Exploitation:* Based on current information, perform the optimal action
- *Regret:* the loss between the best action and performed action
- *Sampling:* Perform action repeatedly to estimate it better
- *Difficulty:* learning can be much harder than solving a known MDP

== Model-Based Learning
The idea behind *Model-based Learning* is that we make an approximate model based on what we know about the reward and transition functions. We then run the model as is.
1. *Step 1:* Take actions $a_i$ at state $s_i$ and estimate $T(s_i, a_i, s'_i)$, get $R(s_i, a_i, s'_i)$ when we reach $s'_i$
2. *Step 2:* Solve the MDP using the estimated reward and transition functions

== Model Free Learning/Passive Reinforcement Learning
In *Passive Reinforcement Learning*, we are given a fixed policy to learn the reward and transition functions. We could do this by *Direct Evaluation*, where we average reward of running that policy at each initial state.

This is a simple algorithm that is easy to run but faces some problems. Some problems are that we might get unlucky when evaluating the value of a state and each state is learned separately.
\
\
\
=== Sample-Based Policy Evaluation
Since we don't know the transition function, we can take a sample of our past actions onto successor states to get an estimate of the function:
$
"sample"_i = R(s, pi(s), s'_1) + gamma V_k^pi (s')\
V_(k+1)^pi (s) = 1/n sum_i "sample"_i
$

== Temporal Difference Learning / Exponential Moving Average
The previous strategy we did was to run a certain amount of episodes, then extract information from the runs. *Temporal Difference Learning* updates $V(s)$ each time we experience transition $(s, a, s', r)$:
$
V^pi (s) = (1-alpha) V^pi (S) + alpha "sample"
$
What this means is that our estimate for state $s$ is a weighted sum of our sample of $s$ we just observed and the old estimate we had before, where the value of alpha is importance of the new value.

In *Exponential Moving Average*, we can compute the average of the states we see by running interpolation update:
$
accent(x,-)_n &= (1 - alpha) accent(x,-)_(n-1) + alpha accent(x,-)_n\
&= frac(x_n + (1 - alpha) x_(n-1) + (1 - alpha)^2 x_(n-2) + dots, 1 + (1 - alpha) + (1 - alpha)^2 + dots)
$
This puts more emphasis on the most recent sample, with more distant sample decaying exponentially. $alpha$ tends to be a small number and gets smaller over time so that the averages converge.

Temporal Difference Learning gives us a good way of estimating values of individual states, but it doesn't allow for policy extraction like other methods. To fix this, we should estimate the *Q-value*, which describes the values of an action and state pair, instead of just the value.

== Active Reinforcement Learning
Unlike passive reinforcement learning, where a fixed policy is given to us, *Active Reinforcement Learning* makes us decide the next action by ourselves. Just like passive reinforcement learning. We are not given the reward nor the transition function

=== Q-Value Iteration
In *Q-Value Iteration*, we start we $Q_0(s, a) = 0$ as the base case and calculate:
$
Q_(k+1) (s, a) = sum_(s') T(s,a,s') [R(s,a,s') + gamma max_(a') underbrace(Q_k (s',a'), V_k (s'))]
$
We learn $Q(s, a)$ values as we go:
- receive a sample (s, a, s', r)
- Consider your old estimate: Q(s, a)
- Consider your new sample estimate: $"sample" = R(s,a,s') + gamma max_a Q(s', a')$
Q-learning converges to optimal policy after enough iterations. This is called *Off-Policy learning*.
