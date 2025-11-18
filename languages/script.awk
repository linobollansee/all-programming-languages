BEGIN {
    print "Hello, World!"
}

# Process lines
{
    sum += $1
}

END {
    print "Sum:", sum
}