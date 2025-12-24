=== K-Consistency
We have seen before 1-consistency, where a constraint only applies to one variable, 2-consistency, where any pair of variables must be consistent. We can expand this notion to *K-Consistency*, which says that:
$
forall x in {X_1, dots,X_(k-1)}, exists x' in X_k: "all k variables are consistent"
$

=== Structure
We can exploit the structure of the problem to more efficiently solve the problem. A case is to use divide and conquer to tackle the subproblems, assuming they are independent.\

*Theorem:* If the constraint graph has no loops, the CSP can be solved in $O(n d^2)$.\

Another way of exploiting the structure is to turn the graph into a topological graph, where the directed edges are the arcs.

In general, if a CSP is tree-structured or close to tree-structured, we can run the tree-structured CSP algorithm on it to derive a solution in linear time. Similarly, if a CSP is close to tree-structured, we can use cut-set conditioning to transform the CSP into one or more independent tree-structured CSPs and solve each of these separately.

== Iterative Algorithms for CSPs
We start with a complete assignment of all the problems. Then, while it is not solved, we iteratively assign a different value to a randomly selected variable. We can use the minimum-conflict heuristic for this.

== Local Search
*Local Search* is an algorithm where you start at an initial state and gradually improve by looking at the neighbors. We do this until we reach a local optimal solution. This is the same as *Gradient Decent*.

== Genetic Algorithms
In *Genetic Algorithms*, we keep the best N solutions at each step based on a fitness function and perform pairwise crossover operators, with optional mutation to give variety in the hopes that the children is a better solution. This is analogous to natural selection.
