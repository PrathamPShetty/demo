from collections import Counter

# Training documents
documents = {
    "comedy": [
        ["fun", "couple", "love", "love"],
        ["couple", "fly", "fast", "fun", "fun"]
    ],
    "action": [
        ["fast", "furious", "shoot"],
        ["furious", "shoot", "shoot", "fun"],
        ["fly", "fast", "shoot", "love"]
    ]
}

# New document to classify
D = ["fast", "couple", "shoot", "fly"]

# Calculate priors
total_docs = sum(len(docs) for docs in documents.values())
priors = {c: len(docs) / total_docs for c, docs in documents.items()}

# Word counts for each class
word_counts = {
    c: Counter(word for doc in docs for word in doc)
    for c, docs in documents.items()
}

# Vocabulary
vocabulary = set(word for docs in documents.values() for doc in docs for word in doc)
V = len(vocabulary)

# Total word count in each class
total_words = {c: sum(word_counts[c].values()) for c in documents}

# Laplace-smoothed word probability
def word_probability(word, c):
    return (word_counts[c][word] + 1) / (total_words[c] + V)

# Compute posterior for each class
posteriors = {}
for c in documents:
    likelihood = 1
    for word in D:
        likelihood *= word_probability(word, c)
    posteriors[c] = likelihood * priors[c]

# Predict class
predicted_class = max(posteriors, key=posteriors.get)

# Output
print(f"Priors: {priors}")
print(f"\nWord Probabilities:")
for c in documents:
    print(f"{c}:")
    for word in vocabulary:
        print(f"  P({word}|{c}) = {word_probability(word, c):.4f}")

print(f"\nPosteriors: {posteriors}")
print(f"\nPredicted Class for D: {predicted_class}")
