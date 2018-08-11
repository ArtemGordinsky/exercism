import threading


def requires_open_account(func):
    def wrapper(self, *args, **kwargs):
        if not self.is_open:
            raise ValueError("Account is closed")

        return func(self, *args, **kwargs)

    return wrapper


def locking(func):
    def wrapper(self, *args, **kwargs):
        self.lock.acquire()

        try:
            return func(self, *args, **kwargs)
        finally:
            self.lock.release()

    return wrapper


class BankAccount(object):
    """Simple Bank Account."""

    balance: int = 0
    is_open: bool = False
    lock = threading.Lock()

    @locking
    @requires_open_account
    def get_balance(self) -> int:
        return self.balance

    @locking
    def open(self):
        if self.is_open:
            raise ValueError("Account is already open")

        self.is_open = True

    @locking
    @requires_open_account
    def close(self):
        self.is_open = False

    @locking
    @requires_open_account
    def deposit(self, amount: int):
        if amount < 0:
            raise ValueError("Cannot deposit a negative amount")

        self.balance += amount

    @locking
    @requires_open_account
    def withdraw(self, amount: int):
        if amount > self.balance:
            raise ValueError("This ain't a credit card, bitch")

        if amount < 0:
            raise ValueError("Cannot withdraw a negative amount")

        self.balance -= amount
