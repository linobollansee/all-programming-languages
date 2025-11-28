import java.util.*;
import java.util.stream.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.function.*;
import java.util.concurrent.*;

/**
 * Comprehensive Java demonstration showcasing idiomatic features
 * across multiple Java versions (8-21+)
 */
public class Main {
    
    public static void main(String[] args) {
        System.out.println("=== Java Idiomatic Features Demo ===\n");
        
        // Lambda expressions and method references
        demonstrateLambdas();
        
        // Stream API
        demonstrateStreams();
        
        // Optional for null safety
        demonstrateOptional();
        
        // Records (Java 14+)
        demonstrateRecords();
        
        // Pattern matching and switch expressions
        demonstratePatternMatching();
        
        // Collections and modern APIs
        demonstrateCollections();
        
        // Exception handling with try-with-resources
        demonstrateTryWithResources();
        
        // Functional interfaces
        demonstrateFunctionalInterfaces();
    }
    
    // Lambda expressions and method references
    private static void demonstrateLambdas() {
        System.out.println("--- Lambda Expressions ---");
        
        List<String> names = Arrays.asList("Alice", "Bob", "Charlie", "Diana");
        
        // Lambda with forEach
        names.forEach(name -> System.out.println("Hello, " + name));
        
        // Method reference
        names.forEach(System.out::println);
        
        // Comparator with lambda
        names.sort((a, b) -> a.length() - b.length());
        System.out.println("Sorted by length: " + names);
        
        System.out.println();
    }
    
    // Stream API - one of Java's most powerful features
    private static void demonstrateStreams() {
        System.out.println("--- Stream API ---");
        
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        
        // Filter, map, and collect
        List<Integer> evenSquares = numbers.stream()
            .filter(n -> n % 2 == 0)
            .map(n -> n * n)
            .collect(Collectors.toList());
        System.out.println("Even squares: " + evenSquares);
        
        // Reduce operation
        int sum = numbers.stream()
            .reduce(0, Integer::sum);
        System.out.println("Sum: " + sum);
        
        // Grouping
        Map<Boolean, List<Integer>> partitioned = numbers.stream()
            .collect(Collectors.partitioningBy(n -> n % 2 == 0));
        System.out.println("Partitioned: " + partitioned);
        
        // Statistics
        IntSummaryStatistics stats = numbers.stream()
            .mapToInt(Integer::intValue)
            .summaryStatistics();
        System.out.println("Statistics: " + stats);
        
        System.out.println();
    }
    
    // Optional for null safety
    private static void demonstrateOptional() {
        System.out.println("--- Optional ---");
        
        Optional<String> present = Optional.of("Hello");
        Optional<String> empty = Optional.empty();
        
        // ifPresent
        present.ifPresent(s -> System.out.println("Present: " + s));
        
        // orElse
        String value = empty.orElse("Default Value");
        System.out.println("With default: " + value);
        
        // map and flatMap
        Optional<Integer> length = present.map(String::length);
        System.out.println("Length: " + length.orElse(0));
        
        // filter
        present.filter(s -> s.startsWith("H"))
               .ifPresent(s -> System.out.println("Starts with H: " + s));
        
        System.out.println();
    }
    
    // Records (Java 14+)
    private static void demonstrateRecords() {
        System.out.println("--- Records ---");
        
        Person person = new Person("Alice", 30, "alice@example.com");
        System.out.println(person);
        System.out.println("Name: " + person.name());
        System.out.println("Age: " + person.age());
        
        // Records with validation
        Employee emp = new Employee("Bob", 50000.0, "Engineering");
        System.out.println(emp.getSummary());
        
        System.out.println();
    }
    
    // Pattern matching and switch expressions
    private static void demonstratePatternMatching() {
        System.out.println("--- Pattern Matching & Switch ---");
        
        Object obj = "Hello";
        
        // Pattern matching with instanceof
        if (obj instanceof String s) {
            System.out.println("String length: " + s.length());
        }
        
        // Switch expression (Java 14+)
        String result = switch (obj) {
            case Integer i -> "Integer: " + i;
            case String s -> "String: " + s;
            case null -> "Null value";
            default -> "Unknown type";
        };
        System.out.println(result);
        
        // Enhanced switch with yield
        int dayOfWeek = 3;
        String dayType = switch (dayOfWeek) {
            case 1, 7 -> "Weekend";
            case 2, 3, 4, 5, 6 -> "Weekday";
            default -> {
                System.out.println("Invalid day");
                yield "Unknown";
            }
        };
        System.out.println("Day type: " + dayType);
        
        System.out.println();
    }
    
    // Collections and modern APIs
    private static void demonstrateCollections() {
        System.out.println("--- Collections ---");
        
        // Immutable collections (Java 9+)
        List<String> immutableList = List.of("Java", "Python", "Go");
        Set<Integer> immutableSet = Set.of(1, 2, 3, 4, 5);
        Map<String, Integer> immutableMap = Map.of(
            "one", 1,
            "two", 2,
            "three", 3
        );
        
        System.out.println("Immutable list: " + immutableList);
        
        // Map operations
        immutableMap.forEach((key, value) -> 
            System.out.println(key + " -> " + value)
        );
        
        // Collectors joining
        String joined = immutableList.stream()
            .collect(Collectors.joining(", ", "[", "]"));
        System.out.println("Joined: " + joined);
        
        System.out.println();
    }
    
    // Try-with-resources for automatic resource management
    private static void demonstrateTryWithResources() {
        System.out.println("--- Try-With-Resources ---");
        
        // Multiple resources in try
        try (AutoCloseableResource res1 = new AutoCloseableResource("Resource 1");
             AutoCloseableResource res2 = new AutoCloseableResource("Resource 2")) {
            
            res1.use();
            res2.use();
            
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        
        System.out.println();
    }
    
    // Functional interfaces and composition
    private static void demonstrateFunctionalInterfaces() {
        System.out.println("--- Functional Interfaces ---");
        
        // Predicate
        Predicate<Integer> isEven = n -> n % 2 == 0;
        Predicate<Integer> isPositive = n -> n > 0;
        Predicate<Integer> isPositiveEven = isEven.and(isPositive);
        
        System.out.println("4 is positive even: " + isPositiveEven.test(4));
        
        // Function composition
        Function<String, String> toLowerCase = String::toLowerCase;
        Function<String, String> trim = String::trim;
        Function<String, String> process = toLowerCase.andThen(trim);
        
        System.out.println("Processed: '" + process.apply("  HELLO  ") + "'");
        
        // Consumer and BiConsumer
        Consumer<String> logger = msg -> 
            System.out.println("[" + LocalDateTime.now().format(
                DateTimeFormatter.ofPattern("HH:mm:ss")) + "] " + msg);
        logger.accept("Functional programming in Java!");
        
        // Supplier
        Supplier<Double> randomSupplier = Math::random;
        System.out.println("Random: " + randomSupplier.get());
        
        // BiFunction
        BiFunction<Integer, Integer, Integer> multiply = (a, b) -> a * b;
        System.out.println("5 * 3 = " + multiply.apply(5, 3));
        
        System.out.println();
    }
    
    // Record for immutable data (Java 14+)
    record Person(String name, int age, String email) {
        // Compact constructor with validation
        public Person {
            if (age < 0) {
                throw new IllegalArgumentException("Age cannot be negative");
            }
        }
    }
    
    // Record with custom methods
    record Employee(String name, double salary, String department) {
        public String getSummary() {
            return String.format("%s works in %s with salary $%.2f", 
                               name, department, salary);
        }
        
        public Employee withRaise(double percentage) {
            return new Employee(name, salary * (1 + percentage / 100), department);
        }
    }
    
    // Custom AutoCloseable for try-with-resources demo
    static class AutoCloseableResource implements AutoCloseable {
        private final String name;
        
        public AutoCloseableResource(String name) {
            this.name = name;
            System.out.println(name + " opened");
        }
        
        public void use() {
            System.out.println(name + " in use");
        }
        
        @Override
        public void close() {
            System.out.println(name + " closed");
        }
    }
}