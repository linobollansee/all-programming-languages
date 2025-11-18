// Bazel BUILD file
cc_binary(
    name = "hello",
    srcs = ["main.cc"],
)

genrule(
    name = "hello_message",
    outs = ["message.txt"],
    cmd = "echo 'Hello, World!' > $@",
)
