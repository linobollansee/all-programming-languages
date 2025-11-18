// Gleam (alternative)
import gleam/io

pub fn main() {
  io.println("Hello, World!")
}

pub fn greet(name: String) -> String {
  "Hello, " <> name <> "!"
}
