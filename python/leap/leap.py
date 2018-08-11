def is_leap_year(year: int) -> bool:
    return divisible_by(year, 4)\
        and not divisible_by(year, 100)\
        or (divisible_by(year, 100) and divisible_by(year, 400))


def divisible_by(num: int, divisor: int) -> bool:
    """Checks whether a number is evenly divisible by a divisor"""
    return num % divisor == 0
