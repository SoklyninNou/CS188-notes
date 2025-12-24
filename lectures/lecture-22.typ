= Optimization
In general, optimization refers to the process of finding the best solution from a set of feasible solutions. In mathematical terms, it involves maximizing or minimizing an objective function subject to certain constraints.
== Gradient Descent/Ascent
1-D optimization focuses on finding the maximum or minimum of a function of a single variable. Gradient descent and ascent are popular techniques for this purpose. Gradient descent and ascent is an iterative method that updates the variable in the direction proportional to the gradient:
$
  x_{n+1} = x_n - alpha dot f'(x_n) quad "for minimization"\
  x_{n+1} = x_n + alpha dot f'(x_n) quad "for maximization"
$
where $alpha$ is the learning rate.

= Deep Neural Networks
Deep Neural Networks (DNNs) are a class of artificial neural networks with multiple layers between the input and output layers. A deep neural network can also learn the features automatically from the data, eliminating the need for manual feature engineering. 

In DNNs, each layer consists of multiple neurons that apply a linear transformation followed by a non-linear activation function. Repeated application of these transformations allows the network to get the set of complex features from the input data. To get the neuron at layer $k$, we can use the following equation:
$
  z_i^k = g(sum_j W_(i,j)^(k-1, k) dot z_j^(k-1))
$
where $z_i^k$ is the output of the $i^("th")$ neuron at layer $k$, $W_(i,j)^(k-1, k)$ is the weight connecting the $j^"th"$ neuron in layer $k-1$ to the $i^"th"$ neuron in layer $k$, and $g$ is the activation function.

== Training DNNs
Training DNNs involves adjusting the weights of the network to minimize a loss function that measures the difference between the predicted output and the actual output. This is typically done using backpropagation combined with optimization algorithms like gradient descent.

*Universal Function Approximation Theorem:*
A two layer neural network with a sufficient number of neurons can approximate any continuous function to any desired accuracy.

In general, we would we neural networks on complex data where it is difficult to manually engineer features. Examples include image recognition, natural language processing, and speech recognition.