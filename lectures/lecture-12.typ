= Uncertainty
Expanding on the concept of learning without given information, we use the concept of *Uncertainty* to add to the model of the world. In a general situation, we have:
- *Observed Variables:* Data the agent knows
- *Unobserved Variables:* Data the agent doesn't knows
- *Model:* Relating the observed to the unobserved variables

To do this, we use *Random Variables*, which is an aspect of the world that has uncertainty.

== Probabilistic Model
In *Probability Distribution*, we associate each attribute of the environment with a non-zero probability. The reason why a probability of zero cannot be used is for computational reasons.

But, explicitly assignment probability to each outcome is impractical since if we have $n$ variables, each with a sample space of d, the total size of the probability table is $n^d$.

A *Probabilistic Model* is a joint distribution over a set of random variables. This is similar to Constraint Satisfaction Problems, where the constraints are the probability and the domain is the sample space. To expand on this, we need to implement new concepts.

An *Event $E$* is a set of outcomes:
$
P(E) = sum_(x_1, dots, x_n in E) P(x_1, dots, x_n)
$

*Marginal Distribution* is a sub-table that eliminate variables. For example, given the table for $P(T, W)$:
$
P(T) = sum_s P(T = t, S = s)
$
Intuitively, we group variables and aggregate the variable we want eliminated.

A *Conditional Probability* is the probability of an outcome given what we know:
$

$
We could then use this for a *Conditional Distribution*, the probabilities over known variable.
$
P(W bar T = t) = frac(P(W = w, T = t), sum_W P(W = w_i, T = t))
$
Each outcome is the joint probability of a given outcome over the sum of all probability over conditional. We then should *Normalize* it, which is the process of making the probability of all entries add up to 1.

== Probabilistic Inference
*Probabilistic Inference* compute a desired probability from other known probabilities. To do this, we compute conditional probabilities since it can relate variables to each other.

=== Inference by Enumeration
*Inference by Enumeration* is a general framework of implementing inference where we have:
- *Evidence variable:* Known information 
- *Query variable:* What we are trying to model
- *Hidden Variable:* unknown information

We then compute $P(Q bar e_1, dots, e_k)$. We can do this use the following procedure:
1. Select the entries containing the evidence
2. Sum out the hidden using conditional distribution
3. Normalize the distribution

To run this procedure we need to apply concepts of probability:
- *Product Rule:* $P(x,y) = P(x|y) p(y)$

- *Chain Rule:* $P(x_1, dots, x_n) = product_i P(x_i|x_1, dots, x_(i-1))$

- *Bayes Rule:* $P(x|y) = frac(P(y|x)P(x), P(y))$
