// Motoko (Internet Computer)
actor HelloWorld {
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };
}
