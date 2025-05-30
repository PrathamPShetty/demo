import nltk
from nltk.corpus import wordnet

def get_synonyms_antonyms(word: str):
    """
    Return two sets: (synonyms, antonyms) for the given word.
    """
    synonyms = set()
    antonyms = set()
    
    for syn in wordnet.synsets(word):
        for lemma in syn.lemmas():
            # collect synonym
            synonyms.add(lemma.name())
            # collect antonyms, if any
            for ant in lemma.antonyms():
                antonyms.add(ant.name())
                
    return synonyms, antonyms

def main():
    word = input("Enter a word: ").strip()
    syns, ants = get_synonyms_antonyms(word)
    
    if syns:
        print(f"Synonyms of '{word}': {', '.join(sorted(syns))}")
    else:
        print(f"No synonyms found for '{word}'")
        
    if ants:
        print(f"Antonyms of '{word}': {', '.join(sorted(ants))}")
    else:
        print(f"No antonyms found for '{word}'")

if __name__ == "__main__":
    # Download WordNet data (run once; it will skip if already present)
    nltk.download('wordnet', quiet=True)
    nltk.download('omw-1.4', quiet=True)
    main()
