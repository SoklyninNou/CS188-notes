== Size of Bayes' Net
Because each node much encode the probability given its parents, the size of the Bayes' Net scales exponentially with each new variable, specifically $N*D^K$ where $K$ is the number of direct parent, $N$ is the number of nodes, and $D$ is the sample space.

== Independence of Bayes' Net
Encoded in a Bayes' Net is the implication that any nodes not connected are conditionally independent of each other:
$
#circle(width: 5%)[X] arrow.long
#circle(width: 5%)[Y] arrow.long
#circle(width: 5%)[Z] arrow.long
#circle(width: 5%)[W]\
P(W|X,Y,Z) = P(W|Z)\
P(Z|X,Y) = P(Z|Y)
$
We can then say that $X$ and $Z$ are conditionally independent given $Y$, as well as:
- $Z tack.t.double X|Y$
- $W tack.t.double Y|Z$
- $W tack.t.double X|Z$

== D-Separation
In general, proving independence is very tedious since it requires analyzing all $N$ nodes. We should then use the *D-Separation* algorithm to simplify the process.

To prove that $Z tack.t.double X|Y$, we ask ourselves if we know $Y$, does knowing $X$ or $Z$ affect the outcome:
$
P(z|x,y) &= (P(x,y,z))/(P(x,y))
&= overbrace(cancel(P(x)P(y|x))P(z|y), "Bayes' Net Reconstitution Recipe")/underbrace(cancel(P(x)P(y|x)), "Product Rule")
&= P(z|y)
$
We can intuitively think of it as if removing $Y$ will remove all paths going from $X$ to $Z$.\
*Example 1:*\
$
#circle(width: 5%)[X] arrow.long
#circle(width: 5%)[Y] arrow.long.l
#circle(width: 5%)[Z]
$
In the above example, $X$ and $Z$ are independent from each other but are not conditionally independent given $Y$.\
*Example 2:*\
$
#circle(width: 5%)[X] arrow.long.l
#circle(width: 5%)[Y] arrow.long.r
#circle(width: 5%)[Z]
$
In the above example, $X$ and $Z$ are not independent from each other but are conditionally independent given $Y$.

These two examples highlight how the direction of the arc is important to determine conditionally and unconditionally independence.

== Active/Inactive Paths
The quickest way of checking for conditional and unconditional independence is to check for *Active/Inactive Paths*. The common pattern for *Active Triples* are:
- Casual Chain: $A arrow B arrow C$, where $B$ is unobserved
- Common Cause: $A arrow.l B arrow.r C$, where $B$ is unobserved
- Common Effect: $A arrow.r B arrow.l C$, where $B$ or one of its descendents are observed
If an inactive segment is on the path between two nodes, then the path is blocked.
If there is no path form $X$ to $Z$, then they are independent.
