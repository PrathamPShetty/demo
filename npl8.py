# If you're using Jupyter Notebook or Colab, run this:
# !pip install transformers

from transformers import AutoTokenizer, AutoModelForSeq2SeqLM

# Load tokenizer and model
tokenizer = AutoTokenizer.from_pretrained("Helsinki-NLP/opus-mt-en-hi")
model = AutoModelForSeq2SeqLM.from_pretrained("Helsinki-NLP/opus-mt-en-hi")

# Translation function
def translate(text):
    input_ids = tokenizer.encode(text, return_tensors="pt", max_length=512, truncation=True)
    outputs = model.generate(input_ids, max_length=512, num_beams=4, early_stopping=True)
    return tokenizer.decode(outputs[0], skip_special_tokens=True)

# List of English sentences
texts = [
    "Took my heart by making ten excuses",
    "Every minute, every moment, I keep telling myself — I have forgotten you",
    "The mother-in-law abuses, the brother-in-law pacifies. The in-laws' house is a marigold flower",
    "I speak to you without talking to you, if you are with me"
]

# Perform translations
for text in texts:
    print("English Text:", text)
    print("Hindi Translation:", translate(text))
    print("*" * 50, "\n")
