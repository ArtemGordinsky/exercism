from datetime import timedelta

GIGASECOND = 1e9


def add_gigasecond(birth_date):
    return birth_date + timedelta(seconds=GIGASECOND)
