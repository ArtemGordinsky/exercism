def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError('Strand length mismatch')

    return sum(a != b for a, b in zip(strand_a, strand_b))
