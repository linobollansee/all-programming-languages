// Typst (typesetting language)
#set page(width: 10cm, height: auto)
#set text(font: "Linux Libertine", 14pt)

= Hello, World!

This is a *Typst* document.

#let greet(name) = [Hello, #name!]

#greet("World")
