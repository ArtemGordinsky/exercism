DNA_TO_RNA = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U'
}


def to_rna(dna_strand):
    try:
        rna_strand = [DNA_TO_RNA[nucleotide] for nucleotide in dna_strand]
    except KeyError:
        raise ValueError('Provided DNA input is not translatable to RNA')

    return ''.join(rna_strand)
