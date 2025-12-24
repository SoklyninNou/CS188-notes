= Filtering
Filtering, also known as monitoring, is the process of estimating the current state of a system based on a sequence of observations. In the context of Hidden Markov Models (HMMs), filtering involves computing the belief state, which is the probability distribution over the hidden states given all the observations up to the current time step.
1. *Elapse Time:* $quad P(x_t bar | e_1:t-1) = sum_(x_(t-1)) P(x_(t-1) | e_(1:t-1)) P(x_t | x_(t-1))$
2. *Observation:* $quad P(x_t | e_1:t) prop P(x_t | e_1:t-1) P(e_t | x_t)$

== Particle Filtering
Normal filtering can be computationally expensive, especially when the state space is large. Particle filtering is an approximate inference algorithm that uses a set of samples (particles) to represent the belief state. Each particle represents a possible state of the system, and the collection of particles approximates the probability distribution over the states.
\
\

*Algorithm:*
1. Initialize a set of N particles by sampling from the initial state distribution.
2. For each time step:
  - Elapse Time: For each particle, move it to a new state by sampling from the transition model.
  - Observation: Weight each particle based on the likelihood of the observed evidence given the particle's state. Down weight particles that are inconsistent with the evidence and up weight those that are consistent.
  - Resample: Draw N particles from the weighted set of particles, with replacement, to form the new set of particles.

=== Robot Localization Example
Consider a robot moving in a 1D world with three positions: Left, Center, and Right. The robot can move left or right with some uncertainty, and it can sense its position with some noise. We want to use particle filtering to estimate the robot's position based on its movements and sensor readings.
1. Initialize a set of particles representing the robot's possible positions.
2. For each time step:
  - Elapse Time: Move each particle based on the robot's movement model (e.g., if the robot moves right, shift particles to the right with some probability).
  - Observation: Weight each particle based on the sensor reading (e.g., if the sensor indicates the robot is at Center, give higher weights to particles at Center).
  - Resample: Draw a new set of particles based on the weights to form the updated belief state.
The final set of particles represents the estimated distribution of the robot's position after considering its movements and sensor readings.


