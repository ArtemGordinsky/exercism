import re


def word_count(phrase):
    # Remove most punctuation.
    phrase = re.sub(r"[^\w\s',_]", '', phrase).lower()
    words = re.split(r'[.,_\s]', phrase)
    # Remove those pesky single quotes around words.
    words = [re.sub(r"^'|'$", '', word) for word in words if word]

    return dict((word, words.count(word)) for word in set(words))
