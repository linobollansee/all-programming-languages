#!/usr/bin/perl
use strict;
use warnings;

print "Hello, World!\n";

sub greet {
    my $name = shift;
    return "Hello, $name!";
}

print greet("Perl") . "\n";