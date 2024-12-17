class ATM:
    def __init__(self, name, bank, balance, pin):
        self.name = name
        self.bank = bank
        self.balance = balance
        self.pin = pin

    def login_pin(self, pin):
        if self.pin == pin:
            print("log in Successful.")
            print(f"Welcome {self.name}!")
        else:
            print("Try again.")

    def check_balance(self):
        print(f"Current Balance: {self.balance} $")

    def deposit(self, amount):
        self.balance += amount
        print(f"Successful. Your current balance: {self.balance} $")

    def withdraw(self, amount):
        self.balance -= amount
        if self.balance > 0:
            print(f"Successful. Your current balance: {self.balance} $")
        else:
            print("your money not enough.")

    def tranfer(self, bank, amount):
        self.balance -= amount
        if self.balance > 0:
            print(f"tranfered {self.balance} $ to {bank}")
        else:
            print("your money not enough.")

# create user id
user1 = ATM("Solo", "ttb", 1000, 4141)

# login account
user1.login_pin(4141)

## deposit money
user1.deposit(500)

# withdraw money
user1.withdraw(200)

# tranfer money
user1.tranfer("scb" ,1500)
