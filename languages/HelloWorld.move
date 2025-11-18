// Move (blockchain language)
module HelloWorld {
    use std::debug;

    public fun main() {
        debug::print(&b"Hello, World!");
    }
}
