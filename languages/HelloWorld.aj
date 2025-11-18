// AspectJ
public aspect HelloWorld {
    pointcut main(): execution(public static void main(..));
    
    before(): main() {
        System.out.println("Hello, World!");
    }
}
