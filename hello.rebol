// Rebol
REBOL [
    Title: "Hello World"
]

print "Hello, World!"

greet: func [name] [
    rejoin ["Hello, " name "!"]
]

print greet "Rebol"
