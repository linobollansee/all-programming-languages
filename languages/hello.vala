// Vala
using GLib;

int main (string[] args) {
    stdout.printf ("Hello, World!\n");
    return 0;
}

string greet (string name) {
    return @"Hello, $name!";
}
