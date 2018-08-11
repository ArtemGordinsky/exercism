def verify(isbn):
    isbn_digits = list(filter(lambda x: x.isdigit() or x == 'X', isbn))

    if len(isbn_digits) != 10:
        return False

    # Check that if X is used as a check character, it's the last one.
    if 'X' in isbn_digits and isbn_digits[-1] != 'X':
        return False

    isbn_digits = [int(x) if x.isdigit() else 10 for x in isbn_digits]
    isbn_with_weight = list(zip(isbn_digits, range(10, 0, -1)))

    total = 0
    for x, weight in isbn_with_weight:
        total += x * weight

    return total % 11 == 0
