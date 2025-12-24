== Inference
*Inference*: Calculating some useful information from the joint probability distribution. This allows use to extract the information we want by taking the joint distribution of the probability distribution.

=== Inference by Enumeration
*Inference by Enumeration* is the algorithm that helps us find inferences. The steps are:
1. The entries consistent with the evidence
2. Sum out H to get joint of Query and evidence
3. Normalize
This is straight forward but slow because we join up the whole distribution, which is exponentially large, before summing up the hidden variable.

=== Inference by Variable Elimination
A better option is *Variable Elimination*, which is exponential in the worst case but is faster in general. This is the process of take a subset of pieces, multiplying them. This means that there will be intermediate distributions that could or could not be useful.

These sub-distributions are called *Factors*, a multi-dimensional array. These array are usually not displayed in the final result.
\
\
To perform Variable Elimination, we:\

*Join Factors*:\
First basic operation: joining factors
- Combining factors:
- Just like a database join
- Get all factors over the joining variable
- Build a new factor over the union of the variables involved
#align(center)[#image("../images/join_factor.png", width: 80%)]
We apply the transformation of each condition from $P(R)$ to the corresponding value in $P(T bar R)$

*Eliminate*:\
Take a factor and sum out a variable
- Shrinks a factor to a smaller one
- A projection operation
#align(center)[#image("../images/eliminate_factor.png", width: 50%)]
This is equivalent to `df.groupby([all_col - r]).sum()`

==== Variable Elimination Ordering
Based on the implementation of Variable Elimination, the order in of the variables we eliminate through each iteration can effect the runtime of the algorithm. We want to chose factors that doesn't grow the result factor too much.