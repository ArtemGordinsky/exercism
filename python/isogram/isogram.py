import re


def is_isogram(string):
    string = string.lower()
    letters = re.sub(r'\W+', '', string)
    unique_letters = set(letters)

    return len(letters) == len(unique_letters)
