= Informed Search

== Search Heuristic
A *Search Heuristic* is a function that estimates how close a state is to the goal. We can use this to set our costs where a higher output of the heuristic function means the edge leads to a state further from the goal and a smaller output means the states is closer to the goal.

== Greedy Search
This algorithm expands to the closest node first. This assumes that the solution is in the sub-tree of the immediate lowest cost edge

== A\* Search
In *A\* Search*, we keep track of 3 values:
- *G value/Backwards Cost*: The cost to reach any given node.
- *H value/Forward Cost*: The distance from the goal
- *F value*: The sum of the backward and forward cost.
Terminates when we dequeue the goal

== Admissible Heuristic
We want our heuristic to be *Optimistic* rather than pessimistic. An admissible/optimistic heuristic is:
$
0 <= h(n) <= h^*(n)
$
This means that our heuristic should underestimate the true cost of each node to the goal. With this, we can prove the optimality of the $"A"^*$ algorithm.\

Let A is the optimal solution and B is the suboptimal solution. Assume that $"A"^*$ chooses B instead of A. An ancestor n of A must have been explored since we reached B. We know that:
$
&f(n) <= g(A) #h(3em) "Admissibility heuristic"\
&f(A) = g(A) #h(3em) "Since A is the goal, h(A) = 0"\
&f(A) < f(A) #h(3em) "By definition"\
&f(n) <= f(A) <= f(B)
$
This means that node n should expand before node B, leading to a contradiction.

== Creating Heuristics
Often, admissible heuristics are solutions to relaxed problems. *Relaxed Problems* are a version of the problem without the constraints, i.e. Pac-man without the walls.

In general, heuristics are defined in a semi lattice. This means that a heuristic dominants another if:
$
forall n : h_a(n) >= h_c(n)
$
This forms a semi-lattice where $h(n) = max(h_a(n), h_c(n))$. The bottom of the semi-lattice is the zero heuristic, where $h(n) = 0$ and the top is the exact heuristic.

Additionally, our heuristic must have consistency. *Consistency* means the edge/arc cost must be less than or equal to the actual cost of the edge/arc:
$
h(A) - h(C) <= "cost"("A to C")
$
A consequence of this is that the f value along the path never increases. Additionally, consistency is a sufficient condition for admissibility