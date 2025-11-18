// Yul (Ethereum assembly)
object "HelloWorld" {
    code {
        datacopy(0, dataoffset("Runtime"), datasize("Runtime"))
        return(0, datasize("Runtime"))
    }
    object "Runtime" {
        code {
            mstore(0x00, "Hello, World!")
            return(0x00, 0x20)
        }
    }
}
