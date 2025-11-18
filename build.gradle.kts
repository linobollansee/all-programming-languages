// Groovy (Gradle DSL)
task hello {
    doLast {
        println 'Hello, World!'
    }
}

String greet(String name) {
    return "Hello, ${name}!"
}
