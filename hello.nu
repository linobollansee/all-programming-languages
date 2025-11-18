# Nushell
print "Hello, World!"

def greet [name: string] {
    $"Hello, ($name)!"
}

greet "Nushell"
