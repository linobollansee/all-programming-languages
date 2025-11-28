#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <memory>
#include <algorithm>
#include <numeric>
#include <optional>
#include <variant>
#include <functional>
#include <thread>
#include <chrono>
#include <random>
#include <ranges>
#include <format>
#include <span>
#include <concepts>

/**
 * Comprehensive C++ demonstration showcasing idiomatic features
 * from C++11, C++14, C++17, C++20, and C++23
 */

// ============================================================================
// Concepts (C++20) - Type constraints
// ============================================================================
template<typename T>
concept Numeric = std::integral<T> || std::floating_point<T>;

template<typename T>
concept Printable = requires(T t, std::ostream& os) {
    { os << t } -> std::same_as<std::ostream&>;
};

// ============================================================================
// Classes and RAII
// ============================================================================
class Person {
private:
    std::string name_;
    int age_;
    
public:
    // Constructor with member initializer list
    Person(std::string name, int age) : name_(std::move(name)), age_(age) {}
    
    // Default constructor
    Person() : name_("Unknown"), age_(0) {}
    
    // Getters (const correctness)
    [[nodiscard]] const std::string& getName() const noexcept { return name_; }
    [[nodiscard]] int getAge() const noexcept { return age_; }
    
    // Setters
    void setName(std::string name) { name_ = std::move(name); }
    void setAge(int age) { age_ = age; }
    
    // Friend function for output
    friend std::ostream& operator<<(std::ostream& os, const Person& p) {
        os << "Person{name: \"" << p.name_ << "\", age: " << p.age_ << "}";
        return os;
    }
    
    // Comparison operator (C++20 spaceship operator)
    auto operator<=>(const Person& other) const = default;
};

// ============================================================================
// Struct with designated initializers (C++20)
// ============================================================================
struct Point {
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;
    
    [[nodiscard]] double distance() const {
        return std::sqrt(x * x + y * y + z * z);
    }
};

// ============================================================================
// Template Functions
// ============================================================================
template<Numeric T>
T add(T a, T b) {
    return a + b;
}

template<typename T>
void printContainer(const T& container, std::string_view label) {
    std::cout << label << ": [";
    bool first = true;
    for (const auto& item : container) {
        if (!first) std::cout << ", ";
        std::cout << item;
        first = false;
    }
    std::cout << "]\n";
}

// ============================================================================
// Lambda and Functional Programming
// ============================================================================
void demonstrateLambdas() {
    std::cout << "\n=== Lambda Expressions ===\n";
    
    // Simple lambda
    auto greet = [](const std::string& name) {
        std::cout << "Hello, " << name << "!\n";
    };
    greet("Lambda");
    
    // Lambda with capture
    int multiplier = 3;
    auto multiply = [multiplier](int x) { return x * multiplier; };
    std::cout << "5 * " << multiplier << " = " << multiply(5) << "\n";
    
    // Mutable lambda
    auto counter = [count = 0]() mutable {
        return ++count;
    };
    std::cout << "Counter: " << counter() << ", " << counter() << ", " << counter() << "\n";
    
    // Generic lambda (C++14)
    auto genericAdd = [](auto a, auto b) { return a + b; };
    std::cout << "Generic add: " << genericAdd(10, 20) << ", " << genericAdd(3.14, 2.86) << "\n";
}

// ============================================================================
// Smart Pointers (Modern Memory Management)
// ============================================================================
void demonstrateSmartPointers() {
    std::cout << "\n=== Smart Pointers ===\n";
    
    // unique_ptr - exclusive ownership
    auto uniquePerson = std::make_unique<Person>("Alice", 30);
    std::cout << "Unique pointer: " << *uniquePerson << "\n";
    
    // shared_ptr - shared ownership
    auto sharedPerson1 = std::make_shared<Person>("Bob", 25);
    auto sharedPerson2 = sharedPerson1; // Reference count: 2
    std::cout << "Shared pointer (use_count: " << sharedPerson1.use_count() << "): " 
              << *sharedPerson1 << "\n";
    
    // weak_ptr - non-owning reference
    std::weak_ptr<Person> weakPerson = sharedPerson1;
    if (auto locked = weakPerson.lock()) {
        std::cout << "Weak pointer is valid: " << *locked << "\n";
    }
}

// ============================================================================
// STL Containers and Algorithms
// ============================================================================
void demonstrateContainersAndAlgorithms() {
    std::cout << "\n=== Containers and Algorithms ===\n";
    
    // Vector with initialization list
    std::vector<int> numbers = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    printContainer(numbers, "Original");
    
    // Sort using std::sort
    std::sort(numbers.begin(), numbers.end());
    printContainer(numbers, "Sorted");
    
    // Transform with lambda
    std::vector<int> squared(numbers.size());
    std::transform(numbers.begin(), numbers.end(), squared.begin(),
                   [](int x) { return x * x; });
    printContainer(squared, "Squared");
    
    // Filter using std::copy_if
    std::vector<int> evens;
    std::copy_if(numbers.begin(), numbers.end(), std::back_inserter(evens),
                 [](int x) { return x % 2 == 0; });
    printContainer(evens, "Evens");
    
    // Accumulate (reduce)
    int sum = std::accumulate(numbers.begin(), numbers.end(), 0);
    std::cout << "Sum: " << sum << "\n";
    
    // Find element
    auto it = std::find(numbers.begin(), numbers.end(), 5);
    if (it != numbers.end()) {
        std::cout << "Found 5 at index: " << std::distance(numbers.begin(), it) << "\n";
    }
    
    // Map (associative container)
    std::map<std::string, int> ages = {
        {"Alice", 30},
        {"Bob", 25},
        {"Charlie", 35}
    };
    
    std::cout << "Map contents:\n";
    for (const auto& [name, age] : ages) { // Structured bindings (C++17)
        std::cout << "  " << name << ": " << age << "\n";
    }
}

// ============================================================================
// Ranges (C++20)
// ============================================================================
void demonstrateRanges() {
    std::cout << "\n=== Ranges (C++20) ===\n";
    
    std::vector<int> numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    
    // Ranges with views (lazy evaluation)
    auto evenSquares = numbers 
        | std::views::filter([](int n) { return n % 2 == 0; })
        | std::views::transform([](int n) { return n * n; });
    
    std::cout << "Even squares: [";
    bool first = true;
    for (int val : evenSquares) {
        if (!first) std::cout << ", ";
        std::cout << val;
        first = false;
    }
    std::cout << "]\n";
}

// ============================================================================
// Optional and Variant (C++17)
// ============================================================================
std::optional<int> divide(int a, int b) {
    if (b == 0) return std::nullopt;
    return a / b;
}

void demonstrateOptionalAndVariant() {
    std::cout << "\n=== Optional and Variant ===\n";
    
    // Optional for nullable values
    auto result1 = divide(10, 2);
    auto result2 = divide(10, 0);
    
    if (result1) {
        std::cout << "10 / 2 = " << *result1 << "\n";
    }
    
    if (result2.has_value()) {
        std::cout << "10 / 0 = " << *result2 << "\n";
    } else {
        std::cout << "10 / 0 = Error (division by zero)\n";
    }
    
    std::cout << "Using value_or: " << result2.value_or(-1) << "\n";
    
    // Variant for type-safe unions
    std::variant<int, double, std::string> value;
    
    value = 42;
    std::cout << "Variant holds int: " << std::get<int>(value) << "\n";
    
    value = 3.14;
    std::cout << "Variant holds double: " << std::get<double>(value) << "\n";
    
    value = "Hello";
    std::cout << "Variant holds string: " << std::get<std::string>(value) << "\n";
    
    // Visitor pattern with variant
    std::visit([](auto&& arg) {
        std::cout << "Visited value: " << arg << "\n";
    }, value);
}

// ============================================================================
// Move Semantics and Forwarding
// ============================================================================
class Resource {
private:
    std::vector<int> data_;
    
public:
    // Constructor
    explicit Resource(size_t size) : data_(size, 0) {
        std::cout << "Resource constructed (size: " << size << ")\n";
    }
    
    // Copy constructor
    Resource(const Resource& other) : data_(other.data_) {
        std::cout << "Resource copied\n";
    }
    
    // Move constructor
    Resource(Resource&& other) noexcept : data_(std::move(other.data_)) {
        std::cout << "Resource moved\n";
    }
    
    // Copy assignment
    Resource& operator=(const Resource& other) {
        if (this != &other) {
            data_ = other.data_;
            std::cout << "Resource copy-assigned\n";
        }
        return *this;
    }
    
    // Move assignment
    Resource& operator=(Resource&& other) noexcept {
        if (this != &other) {
            data_ = std::move(other.data_);
            std::cout << "Resource move-assigned\n";
        }
        return *this;
    }
    
    ~Resource() {
        std::cout << "Resource destroyed\n";
    }
    
    [[nodiscard]] size_t size() const { return data_.size(); }
};

void demonstrateMoveSemantics() {
    std::cout << "\n=== Move Semantics ===\n";
    
    Resource r1(100);
    std::cout << "r1 size: " << r1.size() << "\n";
    
    Resource r2 = std::move(r1); // Move constructor
    std::cout << "r2 size: " << r2.size() << "\n";
    
    std::vector<Resource> resources;
    resources.push_back(Resource(50)); // Move into vector
    std::cout << "Vector size: " << resources.size() << "\n";
}

// ============================================================================
// Structured Bindings and Tuples (C++17)
// ============================================================================
std::tuple<int, double, std::string> getValues() {
    return {42, 3.14, "Hello"};
}

void demonstrateStructuredBindings() {
    std::cout << "\n=== Structured Bindings ===\n";
    
    // Tuple decomposition
    auto [intVal, doubleVal, strVal] = getValues();
    std::cout << "Tuple values: " << intVal << ", " << doubleVal << ", " << strVal << "\n";
    
    // Pair decomposition
    std::map<std::string, int> scores = {{"Alice", 95}, {"Bob", 87}};
    for (const auto& [name, score] : scores) {
        std::cout << name << " scored " << score << "\n";
    }
    
    // Array decomposition
    int arr[] = {10, 20, 30};
    auto [a, b, c] = arr;
    std::cout << "Array values: " << a << ", " << b << ", " << c << "\n";
}

// ============================================================================
// Constexpr and Compile-time Programming
// ============================================================================
constexpr int factorial(int n) {
    return n <= 1 ? 1 : n * factorial(n - 1);
}

constexpr bool isPrime(int n) {
    if (n <= 1) return false;
    if (n <= 3) return true;
    if (n % 2 == 0 || n % 3 == 0) return false;
    for (int i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) return false;
    }
    return true;
}

void demonstrateConstexpr() {
    std::cout << "\n=== Constexpr (Compile-time Computation) ===\n";
    
    // Computed at compile time
    constexpr int fact5 = factorial(5);
    constexpr bool is17Prime = isPrime(17);
    
    std::cout << "factorial(5) = " << fact5 << "\n";
    std::cout << "isPrime(17) = " << std::boolalpha << is17Prime << "\n";
    
    // constexpr if (C++17)
    auto printType = []<typename T>(T value) {
        if constexpr (std::is_integral_v<T>) {
            std::cout << "Integer: " << value << "\n";
        } else if constexpr (std::is_floating_point_v<T>) {
            std::cout << "Float: " << value << "\n";
        } else {
            std::cout << "Other: " << value << "\n";
        }
    };
    
    printType(42);
    printType(3.14);
    printType("Hello");
}

// ============================================================================
// Attributes (C++11/14/17/20)
// ============================================================================
[[nodiscard]] int computeValue() {
    return 42;
}

[[maybe_unused]] void helperFunction() {
    std::cout << "This might not be used\n";
}

[[deprecated("Use newFunction instead")]]
void oldFunction() {
    std::cout << "Old function\n";
}

void demonstrateAttributes() {
    std::cout << "\n=== Attributes ===\n";
    
    int value = computeValue(); // [[nodiscard]] warns if not used
    std::cout << "Computed value: " << value << "\n";
    
    // [[deprecated]] would generate a warning if uncommented
    // oldFunction();
    
    std::cout << "Attributes demonstration complete\n";
}

// ============================================================================
// Exception Handling
// ============================================================================
class CustomException : public std::exception {
private:
    std::string message_;
    
public:
    explicit CustomException(std::string msg) : message_(std::move(msg)) {}
    
    [[nodiscard]] const char* what() const noexcept override {
        return message_.c_str();
    }
};

void demonstrateExceptions() {
    std::cout << "\n=== Exception Handling ===\n";
    
    try {
        std::cout << "Throwing custom exception...\n";
        throw CustomException("This is a custom error");
    }
    catch (const CustomException& e) {
        std::cout << "Caught custom exception: " << e.what() << "\n";
    }
    catch (const std::exception& e) {
        std::cout << "Caught standard exception: " << e.what() << "\n";
    }
    catch (...) {
        std::cout << "Caught unknown exception\n";
    }
    
    // RAII ensures cleanup even with exceptions
    std::cout << "Exception handling complete (RAII ensures cleanup)\n";
}

// ============================================================================
// Threading (C++11)
// ============================================================================
void demonstrateThreading() {
    std::cout << "\n=== Threading ===\n";
    
    // Create and run threads
    auto task = [](int id, int iterations) {
        for (int i = 0; i < iterations; ++i) {
            std::cout << "Thread " << id << " iteration " << i << "\n";
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }
    };
    
    std::thread t1(task, 1, 3);
    std::thread t2(task, 2, 3);
    
    // Wait for threads to complete
    t1.join();
    t2.join();
    
    std::cout << "All threads completed\n";
}

// ============================================================================
// Enum Class (Strongly-typed enums)
// ============================================================================
enum class Color { Red, Green, Blue };
enum class Status { Active, Inactive, Pending };

void demonstrateEnumClass() {
    std::cout << "\n=== Enum Class ===\n";
    
    Color color = Color::Red;
    Status status = Status::Active;
    
    // Type-safe: cannot compare different enum types
    // if (color == status) {} // Compilation error!
    
    if (color == Color::Red) {
        std::cout << "Color is Red\n";
    }
    
    // Underlying type can be specified
    std::cout << "Color value: " << static_cast<int>(color) << "\n";
}

// ============================================================================
// Main Function
// ============================================================================
int main() {
    std::cout << "=================================================\n";
    std::cout << "  Modern C++ Feature Showcase (C++11-C++23)\n";
    std::cout << "=================================================\n";
    
    try {
        demonstrateLambdas();
        demonstrateSmartPointers();
        demonstrateContainersAndAlgorithms();
        demonstrateRanges();
        demonstrateOptionalAndVariant();
        demonstrateMoveSemantics();
        demonstrateStructuredBindings();
        demonstrateConstexpr();
        demonstrateAttributes();
        demonstrateExceptions();
        demonstrateThreading();
        demonstrateEnumClass();
        
        std::cout << "\n=================================================\n";
        std::cout << "  All demonstrations completed successfully!\n";
        std::cout << "=================================================\n";
    }
    catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << "\n";
        return 1;
    }
    
    return 0;
}