#!/usr/bin/env python3
# Python 3 specific
print("Hello, World!")

def greet(name: str) -> str:
    return f"Hello, {name}!"

if __name__ == "__main__":
    print(greet("Python 3"))
