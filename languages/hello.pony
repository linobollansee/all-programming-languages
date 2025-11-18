// Ponylang
actor Main
  new create(env: Env) =>
    env.out.print("Hello, World!")
    
  fun greet(name: String): String =>
    "Hello, " + name + "!"
