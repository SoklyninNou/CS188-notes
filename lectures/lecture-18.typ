= Markov Chains
A Markov chain is a mathematical system that undergoes transitions from one state to another on a state space. It is a random process that satisfies the Markov property, which states that the future state depends only on the current state and not on the sequence of events that preceded it.

*Components of a Markov Chain:*\
- *States (S):* A finite set of states representing the possible configurations of the system. 
- *Transition Probabilities (P):* A matrix that defines the probabilities of transitioning from one state to another.
- *Initial State Distribution ($pi$):* A probability distribution over the states that defines the starting state of the system.

== Mini-Forward Algorithm
The mini-forward algorithm is a simplified version of the forward algorithm used in Hidden Markov Models (HMMs) to compute the probability of a sequence of observations. It operates by iteratively updating the probabilities of being in each state at each time step based on the transition probabilities and observation likelihoods.

*Algorithm:*\
1. Initialize the probabilities for the initial state distribution.
2. For each time step, update the probabilities for each state based on the previous time step's probabilities, transition probabilities, and observation likelihoods.
3. Normalize the probabilities at each time step to ensure they sum to 1.
*Example:*\
Consider a simple HMM with two states (Rainy and Sunny) and two observations (Walk and Shop). The transition probabilities and observation likelihoods are defined as follows:
- Transition Probabilities:
  - P(Rainy | Rainy) = 0.7
  - P(Sunny | Rainy) = 0.3
  - P(Rainy | Sunny) = 0.4
  - P(Sunny | Sunny) = 0.6

- Observation Likelihoods:
  - P(Walk | Rainy) = 0.1
  - P(Shop | Rainy) = 0.9
  - P(Walk | Sunny) = 0.6
  - P(Shop | Sunny) = 0.4
To compute the probability of the observation sequence [Walk, Shop] using the mini-forward algorithm:
1. Initialize the probabilities for the initial state distribution (e.g., P(Rainy) = 0.5, P(Sunny) = 0.5).
2. For the first observation (Walk), update the probabilities for each state:
  - $P("Rainy" | "Walk") = P("Walk" | "Rainy")(P("Rainy" | "Rainy")P("Rainy") + P("Rainy" | "Sunny")P("Sunny"))$
  - $P("Sunny" | "Walk") = P("Walk" | "Sunny")(P("Sunny" | "Rainy")P("Rainy") + P("Sunny" | "Sunny")P("Sunny"))$
3. Normalize the probabilities.
4. For the second observation, repeat the update process using the first observation probabilities.
5. Normalize the probabilities again.
The final probabilities is the likelihood of being in each state after observing the sequence [Walk, Shop].

== Stationary Distributions
A stationary distribution is a probability distribution over the states of a Markov chain that remains unchanged as the system evolves over time. In other words, if the Markov chain starts in the stationary distribution, it will remain in that distribution at all future time steps.

*Finding Stationary Distributions:*\
To find the stationary distribution of a Markov chain, we need to solve the following equation:
$
pi P = pi
$
where $pi$ is the stationary distribution vector and P is the transition probability matrix. This equation states that the stationary distribution is an eigenvector of the transition matrix corresponding to the eigenvalue 1.

*Example:*\
Consider a Markov chain with the following transition matrix:
```
|     |  A  |  B  |
|  A  | 0.8 | 0.2 |
|  B  | 0.4 | 0.6 |
```
To find the stationary distribution π = [π(A), π(B)], we need to solve the equations:
$
  pi(A) = 0.8 pi(A) + 0.4 pi(B) \
  pi(B) = 0.2 pi(A) + 0.6 pi(B) \
  pi(A) + pi(B) = 1\
$

*Properties of Stationary Distributions:*\
- A Markov chain can have multiple stationary distributions if it is not irreducible or aperiodic.
- If a Markov chain is irreducible and aperiodic, it has a unique stationary distribution.
- The stationary distribution can be interpreted as the long-term behavior of the Markov chain.

== Hidden Markov Models (HMMs)
A Hidden Markov Model (HMM) is a statistical model that represents a system with hidden states that generate observable outputs. HMMs are widely used in various applications, including speech recognition, natural language processing, and bioinformatics.

== Filtering / Monitoring
Filtering, also known as monitoring, is the process of estimating the current hidden state of a system based on a sequence of observations. In an HMM, filtering involves computing the posterior distribution of the hidden state given the observed evidence up to the current time step.

=== Passage of Time Update
When time passes without any new observations, we need to update our beliefs about the hidden state based on the transition probabilities of the HMM. This is done using the following equation:
$
B(s') = sum_s P(s' | s) B(s)
$
This says that the belief in state s' is the sum over all the probability of transitioning from s to s', for all s, times the belief in s.

*Algorithm:*\
1. Initialize the belief state based on the initial state distribution.
2. For each time step, update the belief state using the transition probabilities and observation likelihoods.
3. Normalize the belief state to ensure it sums to 1.
*Example:*\
Consider an HMM with two hidden states (Rainy and Sunny) and two observations (Walk and Shop). Given a sequence of observations [Walk, Shop], we want to estimate the current hidden state using filtering.
1. Initialize the belief state (e.g., P(Rainy) = 0.5, P(Sunny) = 0.5).
2. For the first observation (Walk), update the belief state:
  - $P("Rainy" | "Walk") = P("Walk" | "Rainy")(P("Rainy" | "Rainy")P("Rainy") + P("Rainy" | "Sunny")P("Sunny"))$
  - $P("Sunny" | "Walk") = P("Walk" | "Sunny")(P("Sunny" | "Rainy")P("Rainy") + P("Sunny" | "Sunny")P("Sunny"))$
3. Normalize the belief state.
4. For the second observation (Shop), repeat the update process using the first observation belief state.
5. Normalize the belief state again.
The final belief state represents the estimated probabilities of being in each hidden state after observing the sequence [Walk, Shop].

=== Observation Update
After we receive an observation, we need to update our beliefs based on how likely that observation is in each state. This is done using Bayes' theorem:
$
B(s) prop P(e | s) B'(s)
$
where alpha is a normalization constant to ensure the beliefs sum to 1.
This update adjusts our belief in each state based on the likelihood of the observed evidence given that state.

== Forward Algorithm
The forward algorithm is a dynamic programming algorithm used in Hidden Markov Models (HMMs) to compute the probability of a sequence of observations. It operates by iteratively updating the probabilities of being in each hidden state at each time step based on the transition probabilities and observation likelihoods.

*Algorithm:*\
1. Passage of Time: $p(x_2) = sum_(x_1) P(x_1,x_2) = sum_(x_1) p(x_1) P(x_2 bar x_1)$
  - This says that the probability of getting to state $x_2$ is the sum over all the ways of getting to $x_2$ from any previous state $x_1$, times the probability of being in that previous state $x_1$.
2. Observe evidence: $p(x_2 | e_2) prop P(e_2 | x_2) p(x_2)$
  - This says that the probability of being in state $x_2$ given evidence $e_2$ is proportional to the likelihood of observing $e_2$ given state $x_2$, times the prior probability of being in state $x_2$.

== Online Belief Update
The online belief update is a method for updating the belief state of a Hidden Markov Model (HMM) as new observations are received. It combines the passage of time update and the observation update to maintain an accurate estimate of the hidden state over time.


