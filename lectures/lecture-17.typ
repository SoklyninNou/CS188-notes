= Decision Networks
A decision network (or influence diagram) is an extension of a Bayesian network that includes decision nodes and utility nodes to model decision-making under uncertainty.\
- *Chance Nodes:* Represent random variables (like in Bayes nets).
- *Decision Nodes:* Represent choices available to the decision-maker.
- *Utility Nodes:* Represent the utility (or value) associated with outcomes.
*Example:*\
Consider a decision network for a medical diagnosis scenario:
```
      [Test Result]
           |
        [Disease] ----> [Treatment Decision] ----> [Utility]
```
- The "Test Result" node is a chance node representing the outcome of a medical test.
- The "Disease" node is a chance node representing whether the patient has a disease.
- The "Treatment Decision" node is a decision node representing the choice of treatment.
- The "Utility" node represents the utility associated with the treatment outcome (e.g., health improvement, side effects).
*Inference in Decision Networks:*\
To make decisions using a decision network, we need to compute the expected utility of each decision option and choose the one with the highest expected utility.\
*Steps to Compute Expected Utility:*\ 
  1. Compute expected utility by summing over all possible outcomes, weighted by their probabilities.
  2. Choose the decision option with the highest expected utility.
*Example Calculation:*\
To decide whether to treat a patient based on the test result:
 1. Calculate the expected utility of treating the patient given positive and negative test results.
2. Calculate the expected utility of not treating the patient given positive and negative test results.
3. Compare the two expected utilities and choose the option with the higher value.

*Advantages of Decision Networks:*\
  - Provide a structured way to model complex decision-making scenarios.
  - Allow for the incorporation of uncertainty and preferences in decision-making.
  - Facilitate the analysis of trade-offs between different decision options.
*Challenges:*\
  - Computational complexity in large networks.
  - Difficulty in accurately specifying probabilities and utilities.
  - Sensitivity to changes in model parameters.

== Value of Information
The value of information (VOI) is a concept used to quantify the benefit of obtaining additional information before making a decision. It helps decision-makers determine whether acquiring new information is worth the cost associated with obtaining it.\
*Definition:*\
The value of information is defined as the increase in expected utility that results from having access to additional information before making a decision.\
*Calculating VOI:*\
1. Compute the expected utility of the decision without the additional information.
2. Compute the expected utility of the decision with the additional information.
3. The value of information is the difference between the expected utility with the information and the expected utility without it.\
*Example:*\
Consider a scenario where a doctor must decide whether to treat a patient for a disease based on symptoms. The doctor can choose to order a diagnostic test that provides additional information about the patient's condition.\
1. Without the test, the doctor estimates the expected utility of treating or not treating based on prior probabilities of the disease.
2. With the test, the doctor can update the probabilities based on the test results and compute the expected utility of each decision option.
3. The VOI is the difference in expected utility between the two scenarios.\
*Properties:*\
- VOI is always non-negative; having additional information cannot decrease expected utility.
- VOI is non-additive; the value of multiple pieces of information is not the sum of their values.
- VOI is order-independent; the order in which information is obtained does not affect its value.\

*Value of Imperfect Information:*\
In many cases, the information obtained may be imperfect or noisy. All we have to do is add another node to encode the noise.\

= Partially Observable Markov Decision Processes (POMDPs)
A Partially Observable Markov Decision Process (POMDP) is an extension of a Markov Decision Process (MDP) that accounts for situations where the agent does not have full observability of the environment's state. In a POMDP, the agent must make decisions based on incomplete and uncertain information about the current state.\
*Components of a POMDP:*\
- *States (S):* A finite set of states representing the possible configurations of the environment.
- *Actions (A):* A finite set of actions that the agent can take.
- *Observations (O):* A finite set of observations that the agent can receive about the environment.
- *Transition Model (T):* The probability of going from one state to another given an action: T(s, a, s').
- *Observation Model (O):* The probability of receiving an observation given the current state and action: O(s', a, o) = P(o | s', a).
- *Reward Function (R):* A function that defines the immediate reward received after taking an action in a state: R(s, a).

*Belief State:*\
In a POMDP, the agent maintains a belief state, which is a probability distribution over all possible states. The belief state is updated based on the agent's actions and observations using Bayes' theorem. Put simply, the belief state represents the agent's knowledge about the environment at any given time.\



