object HelloWorld {
  def main(args: Array[String]): Unit = {
    println("Hello, World!")
  }
  
  def greet(name: String): String = {
    s"Hello, $name!"
  }
}