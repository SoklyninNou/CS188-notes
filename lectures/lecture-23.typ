= Foramlizing Learning
== Inductive Learning
In inductive learning, we observe examples and attempt to generalize from them. We do this by creating a function that maps inputs to outputs based on the observed data. The goal is to find a hypothesis that accurately predicts the output for new, unseen inputs. We can formalize this process as follows:
- Target Function $g: X arrow Y$
- Hypothesis Space $H = {h_1, h_2, ..., h_n}$ where each $h_i: X arrow Y$
- Training Data $D = {(x_1, y_1), (x_2, y_2), ..., (x_m, y_m)}$ where $y_i = g(x_i)$
Find $h in H$ such that $h(x_i) = y_i$ for all $(x_i, y_i) in D$ and $h$ generalizes well to unseen data.

== Bias and Variance
When evaluating a learning algorithm, we often consider two key concepts: bias and variance.

- *Bias* How well the model can spot the pattern. High bias can lead to underfitting, where the model fails to capture the underlying patterns in the data.

- *Variance* refers to the error introduced by the model's sensitivity to small fluctuations in the training data. High variance can lead to overfitting.

To lower variance, we can opeerationalize simplicity by:
- Reduce number of features / Reducing the complexity of the hypothesis space $H$
- Regularization: Adding a penalty term to the loss function to discourage complex models

= Decision Trees
Decision trees are a popular method for both classification and regression tasks. They work by recursively partitioning the input space into regions based on feature values, leading to a tree structure where each internal node represents a decision based on a feature, and each leaf node represents a predicted output.
*Example:*
`
          [Is it raining?]
              /        \
           Yes          No
          /              \
   [Have umbrella?]   [Go outside]
      /      \
    Yes      No
   /          \
  [Go outside] [Stay inside]
`

== Decision Trees vs Perceptrons
Decision trees and perceptrons are both used for classification tasks, but they have different strengths and weaknesses.
- Decision Trees:
  - Can handle both categorical and numerical data
  - Can model non-linear decision boundaries
  - Prone to overfitting if not pruned properly
- Perceptrons:
  - Primarily used for binary classification
  - Can only model linear decision boundaries
  - Less interpretable than decision trees

*Algorithm:*\
We grow the tree recursively by selecting the feature that splits the data at each node into the most homogeneous subsets:
`
function build_tree(data, features):
    if all examples have the same label:
        return leaf node with that label
    if features is empty:
        return leaf node with majority label
    best_feature = select_best_feature(data, features)
    tree = create_node(best_feature)
    for each value v of best_feature:
        subset = filter data where best_feature == v
        child_node = build_tree(subset, features - {best_feature})
        add child_node to tree
    return tree
  `

== Entropy and Information
To select the best feature for splitting the data, we can use the concept of entropy and information gain. Information says that the more uncertain about the outcome, the more information is gained when that uncertainty is reduced. Entropy is the expected amount of information needed to classify a randomly drawn example:
$
"Entropy"(S) = - sum p_i * log_2 (p_i)
$
Information Gain is the reduction in entropy after a dataset is split on an attribute. Using this measure, we can select the feature that maximizes information gain at each node in the decision tree.

== P-Chance
P-Chance is the probability to recieve the information gain by chance. We use P-chance to determine if our model is overfitting the data.