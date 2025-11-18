// SuperCollider
"Hello, World!".postln;

~greet = { |name|
    ("Hello, " ++ name ++ "!").postln;
};

~greet.value("SuperCollider");
