== Exploration Function
The method of Exploration is to learn more about the environment around us. When doing this, we need to balance the over exploring, which may lead to repeated bad paths, and under exploring, which leads to not finding the optimal path.

The simplest way to do this is through random randoms, or *$epsilon$-greedy*. This method says that the agent acts randomly with probability $epsilon$, which is very small, and follows the current policy otherwise.

One key idea is to lower epsilon overtime since we would have explored most of the environment already.

The *Exploration Function* takes in a value estimate u and a visit count n, and returns an optimistic utility: $f(u, n) = u + k/n$. Intuitively, this is an upper bound on how go the path can be. This will turn the estimated value to:
$
Q(s, a) = alpha R(s, a, s') + gamma max_a' f(Q(s', a), N(s', a))
$
This will make the agent tend towards states that haven't been explored much.

== Regret
Intuitively, *Regret* is the measure of the total mistake cost. This is the different between your expect reward and the optimal expected reward.

== Approximate Q-Learning
In basic Q-learn, we have a table of all q-values. But, this is impractical in the real world since states are usually extremely large, which also means it will take a long time to visit enough states.

What we do instead is to generalize the Q-values of the environment. Rather than maintaining a list of value, we describe a state using a vector of features.

To compute this, we can do a weighted sum of the features:
$
V(s) = omega_1 f_1 (s) + dots +omega_n f_n (s)\
Q(s, a) = omega_1 f_1 (s, a) + dots +omega_n f_n (s, a)
$
Intuitively, we adjust the weights of each feature based on our prior knowledge and the current sample:
$
omega_i = omega_i + alpha ["difference"] f_i (s,a)
$

== Policy Search
In *Policy Search*, we start with an initial value function or Q-function and we adjust each function weight to see if the policy improves.

One problem with this is to know if the policy improve because we will have to run many samples.
