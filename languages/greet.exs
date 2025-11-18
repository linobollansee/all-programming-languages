// Elixir (alternative)
defmodule Greet do
  def hello do
    IO.puts("Hello, World!")
  end
  
  def greet(name) do
    "Hello, #{name}!"
  end
end

Greet.hello()
