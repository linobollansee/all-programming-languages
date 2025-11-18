// Linden Scripting Language (LSL)
default
{
    state_entry()
    {
        llSay(0, "Hello, World!");
    }
    
    touch_start(integer num)
    {
        llSay(0, "Hello, " + llDetectedName(0) + "!");
    }
}
