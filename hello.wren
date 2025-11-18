// Wren
System.print("Hello, World!")

class Greeter {
  static greet(name) {
    return "Hello, %(name)!"
  }
}

System.print(Greeter.greet("Wren"))
