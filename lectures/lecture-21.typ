= Linear Classifier
A linear classifier makes its predictions based on a linear combination of the input features:
$ 
  y = w_0 + w_1 x_1 + w_2 x_2 + dots + w_n x_n
$
Where:
- $w_0$ is the bias term.
- $w_1, w_2, dots, w_n$ are the weights associated with each feature.
- $x_1, x_2, dots, x_n$ are the input features.
- $y$ is the output score.

== Decision Rule
The decision rule for a linear classifier is typically based on the sign of the output score $y$:
- If $y >= 0$, predict class 1.
- If $y < 0$, predict class 0.
We can visualize the decision boundary as a hyperplane in the feature space.

== Weight Updates / Perceptrons
The perceptron algorithm is an online learning algorithm that updates the weights based on the prediction error for each training example. The update rule is designed to adjust the weights in a way that reduces future misclassifications.

Properties of the perceptron learning rule:
- *Separability:* The perceptron is separable if some parameters correctly classify all training data.
- *Convergence:* The perceptron algorithm converges to a solution if the data is linearly separable.
- *Mistake Bound:* The maximum number of mistakes relates to the margin or degree of separability.

Some problems with the perceptron algorithm:
- *Noise:* if the data is not separable, the perceptron may oscillate and never converge.
- *Margin:* perceptrons doesn't maximize the margin between classes, leading to poor generalization.

=== Binary Perceptrons
The binary perceptron algorithm updates the weights based on the prediction error:
- For each training example $(f, y^*)$:
  - Classify with current weights to get prediction $y$.
  - If $y^* != y$ (misclassification):
    - Update weights: $w_i = w_i + y^* dot f$

=== Multiclass Perceptrons
For multiclass classification, the perceptron algorithm updates weights for each class:
- For each training example $(f, y^*)$:
  - Classify with current weights to get predicted class $y$.
  - If $y^* != y$ (misclassification):
    - Update weights for true class: $w_(y^*) = w_(y^*) + f$
    - Update weights for predicted class: $w_y = w_y - f$

== Logistic Regression 
When the data is not linearly separable, the perceptron algorithm may fail to converge. To address this, we can use a Probabilistic Decision model such as Logistic Regression:
$ 
  P(Y = 1 | X) = sigma(z) = frac(1, 1 + e^(-z))
$
When interpreting scores to probabilities, we use the logistic (sigmoid) function:
$ 
  z_1, z_2, z_3 arrow
  frac(e^(z_1), e^(z_1) + e^(z_2) + e^(z_3)),
  frac(e^(z_2), e^(z_1) + e^(z_2) + e^(z_3)),
  frac(e^(z_3), e^(z_1) + e^(z_2) + e^(z_3))
$
