= Classification
In machine learning, classification is a supervised learning task where the goal is to predict the categorical label of an input based on its features. 

== Naive Bayes Classifier
The Naive Bayes classifier is a simple yet effective probabilistic classifier based on Bayes' theorem with the "naive" assumption of feature independence.

The model computes the posterior probability of each class given the input features and assigns the class with the highest probability.
The formula for the Naive Bayes classifier is given by:
$
  P(Y, F_1, dots, F_n) = P(Y) product_(i=1)^n P(F_i | Y)
$
Where:
- $Y$ is the class label.
- $F_1, dots, F_n$ are the features.
- $P(Y)$ is the prior probability of class $Y$.

== Inference for Naive Bayes
To classify a new instance with features $f_1, dots, f_n$, we compute the posterior probability for each class $y$:
$
  P(Y = y | F_1 = f_1, dots, F_n = f_n) prop P(Y = y) product_(i=1)^n P(F_i = f_i | Y = y)
$

== General Naive Bayes
What we neeed to use Naive Bayes is:
1. Inference method:
  - Compute $P(Y = y)$ for each class $y$.
  - Compute $P(F_i = f_i | Y = y)$ for each feature $F_i$ and class $y$.
2. Estimates of local conditional probabilisty tables:
  - $P(Y)$: Estimated from the training data as the frequency of each class.
  - $P(F_i | Y)$: Estimated from the training data as the frequency of each feature value given each class.

Naive Bayes assumes that all features are conditionally independent given the class label.\
One detail is that we take the logarithm of the probabilities to avoid numerical underflow and convert products into sums:
$
  log P(Y = y | F_1 = f_1, dots, F_n = f_n) = log P(Y = y) + sum_(i=1)^n log P(F_i = f_i | Y = y) + C
$
Where $C$ is a constant that does not depend on $y$.
== Traing and Testing
Empirical Risk Minimization (ERM) is a principle in statistical learning theory that aims to find a hypothesis that minimizes the empirical risk, which is the average loss over the training data. But we might overfit the training data if we only focus on minimizing the empirical risk.

To evaluate the performance of a classifier, we typically split the dataset into training, held out, and testing sets. The training set is used to train the model, the held out set is used for model selection and hyperparameter tuning, and the testing set is used to evaluate the final performance of the model.

Overfitting occurs when a model learns the training data too well, including its noise and outliers, leading to poor generalization to new, unseen data.

== Parameter Estimation
Parameter estimation for the Naive Bayes classifier involves estimating the probabilities $P(Y)$ and $P(F_i | Y)$ from the training data. There are two common methods for parameter estimation: Maximum Likelihood Estimation (MLE) and Maximum A Posteriori (MAP) estimation.


=== Maximum Likelihood Estimation (MLE)
Maximum Likelihood Estimation (MLE) is a method for estimating the parameters of a statistical model by maximizing the likelihood function, which measures how well the model explains the observed data.
$
  theta_"MLE" &= arg max_theta P(XX | theta)
  &= arg max_theta product_(i=1)^n P(x_i | theta)\
$

=== Maximum A Posteriori (MAP) Estimation
Maximum A Posteriori (MAP) estimation is a method for estimating the parameters of a statistical model by maximizing the posterior distribution, which combines the likelihood of the observed data with a prior distribution over the parameters.
$
  theta_"MAP" &= arg max_theta P(theta | XX)\
$

== Laplace Smoothing
One common issue in parameter estimation is the zero-frequency problem, where a feature value does not appear in the training data for a particular class, leading to a probability of zero. To address this, we can use smoothing techniques such as Laplace smoothing, which adds a small constant to all counts to ensure that no probability is zero. This makes each estimates less extreme, which makes it more uniform.
== Confidence
In addition to predicting the class label, the Naive Bayes classifier can also provide a measure of confidence in its predictions by computing the posterior probabilities for each class. The confidence can be interpreted as the probability that the predicted class is correct given the input features.
$
  "confidence" = max_y P(y bar x)
$