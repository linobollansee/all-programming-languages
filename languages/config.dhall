// Dhall
let greeting = "Hello, World!"
let greet = \(name : Text) -> "Hello, ${name}!"
in { message = greeting, greet = greet }
