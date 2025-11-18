// TLA+ (formal specification)
---- MODULE HelloWorld ----
EXTENDS Integers, Sequences

VARIABLE message

Init == message = "Hello, World!"

Next == UNCHANGED message

Spec == Init /\ [][Next]_message
============================
