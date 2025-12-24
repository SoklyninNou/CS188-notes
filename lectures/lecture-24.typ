= Large Language Models
Large Language Models are neural networks trained on vast amounts of text data to understand and generate human-like language. They utilize architectures such as Transformers to capture the context and semantics of language effectively.

== Text Tokenization
Text tokenization is the process of breaking down text into smaller units called tokens, which can be words, subwords, or characters. This step is crucial for preparing text data for input into language models.

== Word Embeddings
Word embeddings are dense vector representations of words that capture their meanings and relationships. We can interpret each  word as a vector in space. The embedding vectors are learned during training and help models understand semantic similarities between words.

== Self-Attention
Self-attention is a mechanism that allows models to weigh the importance of different words in a sentence when making predictions. It enables the model to focus on relevant parts of the input sequence, improving its ability to understand context. For example, in the sentence "The cat sat on the mat," self-attention helps the model recognize that "cat" and "sat" are closely related.

*Implementation:*\
Self-attention is implemented using three main components: Query (Q), Key (K), and Value (V) matrices. The attention scores are computed as follows:
$
"Attention"(Q, K, V) = "softmax"((Q K^T) / sqrt(d_k))V
$
A key is a representation of the word to be compared against, a query is the representation of the current word, and a value is the actual information to be aggregated.

== Multi-Head Attention
Multi-head attention extends the self-attention mechanism by using multiple attention heads to capture different aspects of the input. Each head learns to focus on different parts of the sequence, allowing the model to gather diverse information. The outputs from all heads are concatenated and linearly transformed to produce the final output.

= Transformer Architecture
The Transformer architecture is a deep learning model designed for handling sequential data, particularly in natural language processing tasks. It consists of an encoder and a decoder, both built using layers of multi-head attention and feed-forward neural networks. The process involves the following steps:
1. Input text is tokenized and converted into embeddings.
2. The transformer block processes the embeddings through multiple layers of multi-head attention and feed-forward networks.
3. The output is un-embedded and un-tokenized to generate predictions, such as the next word in a sequence.

= Unsupervised / Self-Supervised Learning
The basic idea is to use large amounts of unlabeled text data to train language models. The model learns to predict the next word in a sentence or fill in missing words, enabling it to understand language patterns without explicit labels.

== Pre-training and Fine-tuning
Pre-training involves training a language model on a large corpus of text to learn general language representations. Fine-tuning is the subsequent process of adapting the pre-trained model to specific tasks, such as sentiment analysis or question answering, using smaller labeled datasets.

= Multi-Modal Models
Multi-modal models are designed to process and understand multiple types of data, such as text, images, and audio. These models can integrate information from different modalities to perform tasks like image captioning or visual question answering.