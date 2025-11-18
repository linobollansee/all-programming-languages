// Terra
print("Hello, World!")

terra greet(name : &int8) : {}
    C.printf("Hello, %s!\n", name)
end
