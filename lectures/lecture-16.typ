= Bayes Net Sampling
An alternate approach for probabilistic reasoning is to implicitly calculate the probabilities for our query by simply counting samples. We can generate samples from the Bayes net and use those samples to estimate probabilities This will give us a good estimate of the conditional probability.

== Prior Sampling
Generate samples from the full joint distribution defined by the Bayes net. In short, we walk down the Bayes Net and sample each node given fixed parents. It is good when we don't have evidence.\
*Algorithm:*\
  1. Order variables in topological order.
  2. For each variable, sample its value based on the values of its parents.
  3. Repeat to generate many samples.
*Example:*
Consider the following Bayes net:
```
    A
   / \
  B   C
   \ /
    D
```
To generate a sample:
1. Pick an outcome A from P(A).
2. Pick an outcome B from P(B | A).
3. Pick an outcome C from P(C | A).
4. Pick an outcome D from P(D | B, C).

== Rejection Sampling
In rejection sampling, we generate samples from the prior distribution but only keep those that are consistent with the evidence.\
*Algorithm:*\
  1. Generate a sample from the prior distribution.
  2. If the sample is consistent with the evidence, keep it; otherwise, discard it.
  3. Repeat to generate many samples.
  4. Estimate probabilities based on the kept samples.
*Example:*\
To estimate P(Burglary | JohnCalls = true):
1. Generate a sample from the prior distribution.
2. If JohnCalls = true in the sample, keep it; otherwise, discard it.
3. Count how many kept samples have Burglary = true and divide by the total number of kept samples to estimate the probability.

The main drawback of rejection sampling is that if the evidence is rare, many samples will be discarded, leading to inefficiency.

== Likelihood Weighting
Likelihood weighting is a more efficient sampling method that incorporates evidence directly into the sampling process. Instead of discarding samples that don't match the evidence, we weight them based on how likely they are given the evidence.\
*Algorithm:*\
  1. For each variable, if it is an evidence variable, set it to the evidence value and assign a weight based on its probability given its parents.
  2. For non-evidence variables, sample their values based on their parents (Honest sampling).
  3. Repeat to generate many weighted samples.
  4. Estimate probabilities using the weights of the samples.
*Example:*\
To estimate P(Burglary | JohnCalls = true):
1. For each sample, set JohnCalls = true and assign a weight based on P(JohnCalls = true | Parents).
2. Sample the other variables (Burglary, Earthquake, MaryCalls) based on their parents.
3. Use the weights of the samples to estimate the probability of Burglary given JohnCalls = true.
The disadvantage of this is that it works better if our query evidence is at the top.

== Gibbs Sampling
Gibbs sampling is a Markov Chain Monte Carlo (MCMC) method that generates samples by iteratively updating the value of one variable at a time, conditioned on the current values of all other variables.
*Algorithm:*\
  1. Initialize all variables to some value.
  2. For each variable, sample its value based on the current values of all other variables.
  3. Repeat for many iterations to generate samples.
  4. Estimate probabilities based on the samples.
*Example:*\
To estimate P(Burglary | JohnCalls = true):
1. Initialize all variables (Burglary, Earthquake, MaryCalls) to some values.
2. For each variable, sample its value based on the current values of the other variables and the evidence (JohnCalls = true).
3. After many iterations, use the samples to estimate the probability of Burglary given JohnCalls = true.
Gibbs sampling is particularly useful when dealing with complex networks where direct sampling is difficult.