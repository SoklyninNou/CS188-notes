== Bellman Equations
Definition of “optimal utility” via Expectimax recurrence gives a simple one-step look ahead relationship amongst optimal utility values:
$
V^*(s) = max_a sum_s' overbrace(T(s,a,s'), "Probabilty") underbrace([R(s,a,s') + gamma V^*(s')], "Utility of taking action a in s to s'")
$

== Policy Method/Evaluation
One variance of policy evaluation is for a fixed policy:
$
V^pi (s) = sum_s' T(s,a,s') [R(s,a,s') + gamma V^*(s')]
$
notice how we are no longer maximizing over the possible actions since we have a fixed policy. This reduces the time complexity to: $O(S^2)$. This is also a linear system of equation.

== Policy Extraction
What we can also do is to find what policy is optimal at each state:
$
pi^* (s) = arg max_a sum_s' T(s,a,s') [R(s,a,s') + gamma V^*(s')]
$
This is called *Policy Extraction*. Given the q-values, we can also compute it by:
$
pi^* (s) = arg max_a Q^* (s,a)
$
this is more trivial since $Q^* (s,a)$ tells you the utility of each action.

== Policy Iteration
*Policy iteration* is a method of finding the optimal policy. The problem with value iteration is that it is slow to converge values, bottle necking the policies. In Policy iteration, we alternate between two steps:
1. *Policy evaluation:* calculate utilities for some fixed policy (not optimal utilities!) until convergence
$
V_(k+1)^pi_i (s) = sum_s' T(s,a,s') [R(s,a,s') + gamma V_k^pi_i (s')]
$
2. *Policy improvement:* update policy using one-step look-ahead with resulting converged (but not optimal!) utilities as future values
$
pi^* (s) = arg max_a sum_s' T(s,a,s') [R(s,a,s') + gamma V^(pi_i) (s')]
$
This method converges much faster under some conditions.

In Policy Iteration, we run with a fixed policy and compute the utility of each state given that policy. We then find the best expected action for each room and change the policy accordingly. Repeat until the best expected action for each room is the policy we just ran.

