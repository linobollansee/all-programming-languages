// Sway (Fuel blockchain)
contract;

abi HelloWorld {
    fn greet() -> str[13];
}

impl HelloWorld for Contract {
    fn greet() -> str[13] {
        "Hello, World!"
    }
}
