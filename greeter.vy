// Vyper (Python-like smart contract language)
# @version ^0.3.0

greeting: public(String[100])

@external
def __init__():
    self.greeting = "Hello, World!"

@external
def set_greeting(_greeting: String[100]):
    self.greeting = _greeting
