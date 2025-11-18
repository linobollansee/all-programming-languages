// ChucK
"Hello, World!" => string message;
<<< message >>>;

fun string greet(string name) {
    return "Hello, " + name + "!";
}

<<< greet("ChucK") >>>;
