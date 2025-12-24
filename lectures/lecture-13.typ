=== Independence
We say two variables $X tack.t.double Y$ are independent if the outcome of one doesn't affect the other:
$
P(x,y) = P(x) P(y)\
P(x|y) = P(x)
$

We rarely have absolute independence, instead we might have *Conditional Independence*. In this instance, some variables might be independent if another variable is present. If we say that:
$
P(A^+|B^+, C^+) = P(A^+|C^+)
P(A^-|B^+, C^-) = P(A^-|C^-)
$
then we can say that A is _conditionally independent_ of B given C. Biconditional implication:
$
P(B|A,C) = P(B|C)\
P(B,A|C) = P(B|C)P(A|C)
$
This can be applicable when simplifying the chain rule since we can remove any variable that is conditionally independent with the random variable.

= Bayes' Net
*Bayes' Nets* is a technique to compactly describe complex joint
distributions using simple, local distributions. This is a graph where the nodes are the variables and the edges indicates conditional independence. Each node should have a probability of the node given its connect nodes.

This means that a Bayes' Net implicitly encodes a joint distribution:
$
P(x_1, x_2, dots, x_3) = product_(i=1)^n P(x_i|"parents"(X_i))
$
This formula shows that we can simplify the chain rule of probability to only include the node's parents. This then implies that anything that is not a direct parent of the node is conditionally independent from the node.

