#!/usr/bin/env raku

say "Hello, World!";

sub greet($name) {
    "Hello, $name!"
}

say greet("Raku");
