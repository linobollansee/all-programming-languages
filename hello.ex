defmodule Hello do
  def world do
    IO.puts "Hello, World!"
  end
  
  def greet(name) do
    "Hello, #{name}!"
  end
end

Hello.world()