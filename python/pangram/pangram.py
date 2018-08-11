import string


def is_pangram(sentence):
    sentence = sentence.lower()
    sentence_letters = set(sentence)
    alphabet = set(string.ascii_lowercase)

    return sentence_letters >= alphabet
