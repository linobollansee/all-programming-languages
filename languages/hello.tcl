#!/usr/bin/tclsh

puts "Hello, World!"

proc greet {name} {
    return "Hello, $name!"
}

puts [greet "Tcl"]