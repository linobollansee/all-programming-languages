fun hello () = print "Hello, World!\n"

fun greet name = "Hello, " ^ name ^ "!"

val () = hello ()
val () = print (greet "SML" ^ "\n")