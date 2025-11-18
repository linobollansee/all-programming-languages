// Jai (Jonathan Blow's language)
#import "Basic";

main :: () {
    print("Hello, World!\n");
}

greet :: (name: string) -> string {
    return sprint("Hello, %!\n", name);
}
