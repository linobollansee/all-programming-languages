-- Alloy (formal specification)
sig Message {
    content: String
}

pred HelloWorld {
    one m: Message | m.content = "Hello, World!"
}

run HelloWorld
