REM ============================================================================
REM Comprehensive QBasic/BASIC Program Demonstration
REM Showcasing idiomatic features and classic BASIC programming patterns
REM ============================================================================

DECLARE SUB DrawBox (x1%, y1%, x2%, y2%, col%)
DECLARE SUB Pause (seconds!)
DECLARE FUNCTION Factorial# (n%)
DECLARE FUNCTION IsPrime% (n%)
DECLARE FUNCTION Max% (a%, b%)

DIM SHARED title$
title$ = "QBasic Feature Showcase"

REM Clear screen and set up
CLS
COLOR 15, 1
PRINT STRING$(80, "=")
PRINT SPACE$((80 - LEN(title$)) \ 2); title$
PRINT STRING$(80, "=")
PRINT

REM ============================================================================
REM 1. Variables and Data Types
REM ============================================================================
PRINT "[1] Variables and Data Types"
PRINT STRING$(40, "-")

REM Integer variables (%)
DIM age%
age% = 25
PRINT "Integer age: "; age%

REM Long integers (&)
DIM population&
population& = 1000000&
PRINT "Population: "; population&

REM Single precision floats (!)
DIM price!
price! = 19.99
PRINT "Price: $"; price!

REM Double precision floats (#)
DIM pi#
pi# = 3.14159265358979#
PRINT "Pi: "; pi#

REM String variables ($)
DIM message$, firstName$, lastName$
firstName$ = "John"
lastName$ = "Doe"
message$ = firstName$ + " " + lastName$
PRINT "Full name: "; message$

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 2. Arithmetic Operations
REM ============================================================================
CLS
PRINT "[2] Arithmetic Operations"
PRINT STRING$(40, "-")

DIM a%, b%, sum%, diff%, prod%, quot%, remainder%
a% = 17
b% = 5

sum% = a% + b%
diff% = a% - b%
prod% = a% * b%
quot% = a% \ b%      REM Integer division
remainder% = a% MOD b%

PRINT a%; " + "; b%; " = "; sum%
PRINT a%; " - "; b%; " = "; diff%
PRINT a%; " * "; b%; " = "; prod%
PRINT a%; " \ "; b%; " = "; quot%; " (integer division)"
PRINT a%; " MOD "; b%; " = "; remainder%; " (modulo)"
PRINT a%; " / "; b%; " = "; a% / b%; " (float division)"
PRINT a%; " ^ 2 = "; a% ^ 2; " (exponentiation)"

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 3. String Operations
REM ============================================================================
CLS
PRINT "[3] String Operations"
PRINT STRING$(40, "-")

DIM text$, upper$, lower$
text$ = "Hello, QBasic!"

PRINT "Original: "; text$
PRINT "Length: "; LEN(text$)
PRINT "Uppercase: "; UCASE$(text$)
PRINT "Lowercase: "; LCASE$(text$)
PRINT "Left 5: "; LEFT$(text$, 5)
PRINT "Right 6: "; RIGHT$(text$, 6)
PRINT "Middle (8-14): "; MID$(text$, 8, 6)
PRINT "Position of 'Q': "; INSTR(text$, "Q")
PRINT "Repeated: "; STRING$(3, "*")
PRINT "Spaces: '"; SPACE$(10); "'"
PRINT "Trimmed: '"; LTRIM$(RTRIM$("  Hello  ")); "'"

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 4. Conditional Statements
REM ============================================================================
CLS
PRINT "[4] Conditional Statements"
PRINT STRING$(40, "-")

DIM score%, grade$
score% = 85

PRINT "Score: "; score%

IF score% >= 90 THEN
    grade$ = "A"
ELSEIF score% >= 80 THEN
    grade$ = "B"
ELSEIF score% >= 70 THEN
    grade$ = "C"
ELSEIF score% >= 60 THEN
    grade$ = "D"
ELSE
    grade$ = "F"
END IF

PRINT "Grade: "; grade$
PRINT

REM Single-line IF
DIM number%
number% = 42
IF number% > 0 THEN PRINT number%; "is positive"

REM SELECT CASE statement
PRINT
PRINT "Day of week example:"
DIM dayNum%
dayNum% = 3

SELECT CASE dayNum%
    CASE 1
        PRINT "Monday"
    CASE 2
        PRINT "Tuesday"
    CASE 3
        PRINT "Wednesday"
    CASE 4
        PRINT "Thursday"
    CASE 5
        PRINT "Friday"
    CASE 6, 7
        PRINT "Weekend!"
    CASE ELSE
        PRINT "Invalid day"
END SELECT

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 5. Loop Structures
REM ============================================================================
CLS
PRINT "[5] Loop Structures"
PRINT STRING$(40, "-")

PRINT "FOR...NEXT loop (1 to 5):"
DIM i%
FOR i% = 1 TO 5
    PRINT "  Iteration: "; i%
NEXT i%

PRINT
PRINT "FOR...NEXT loop with STEP (10 to 2 by -2):"
FOR i% = 10 TO 2 STEP -2
    PRINT "  Count: "; i%
NEXT i%

PRINT
PRINT "WHILE...WEND loop:"
DIM counter%
counter% = 1
WHILE counter% <= 3
    PRINT "  Counter: "; counter%
    counter% = counter% + 1
WEND

PRINT
PRINT "DO...LOOP UNTIL:"
counter% = 1
DO
    PRINT "  Value: "; counter%
    counter% = counter% + 1
LOOP UNTIL counter% > 3

PRINT
PRINT "Nested loops (multiplication table):"
DIM row%, col%
FOR row% = 1 TO 3
    FOR col% = 1 TO 3
        PRINT USING "####"; row% * col%;
    NEXT col%
    PRINT
NEXT row%

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 6. Arrays
REM ============================================================================
CLS
PRINT "[6] Arrays"
PRINT STRING$(40, "-")

REM One-dimensional array
DIM numbers%(5)
numbers%(1) = 10
numbers%(2) = 20
numbers%(3) = 30
numbers%(4) = 40
numbers%(5) = 50

PRINT "Array elements:"
FOR i% = 1 TO 5
    PRINT "  numbers("; i%; ") = "; numbers%(i%)
NEXT i%

PRINT
PRINT "Array sum: ";
DIM arraySum%
arraySum% = 0
FOR i% = 1 TO 5
    arraySum% = arraySum% + numbers%(i%)
NEXT i%
PRINT arraySum%

PRINT
PRINT "Two-dimensional array (matrix):"
DIM matrix%(3, 3)
FOR row% = 1 TO 3
    FOR col% = 1 TO 3
        matrix%(row%, col%) = row% * 10 + col%
    NEXT col%
NEXT row%

FOR row% = 1 TO 3
    PRINT "  ";
    FOR col% = 1 TO 3
        PRINT USING "###"; matrix%(row%, col%);
    NEXT col%
    PRINT
NEXT row%

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 7. Subroutines and Functions
REM ============================================================================
CLS
PRINT "[7] Subroutines and Functions"
PRINT STRING$(40, "-")

PRINT "Factorial function:"
PRINT "  5! = "; Factorial#(5)
PRINT "  7! = "; Factorial#(7)

PRINT
PRINT "Prime number checker:"
PRINT "  Is 17 prime? "; IsPrime%(17)
PRINT "  Is 18 prime? "; IsPrime%(18)

PRINT
PRINT "Max function:"
PRINT "  Max(10, 25) = "; Max%(10, 25)
PRINT "  Max(100, 50) = "; Max%(100, 50)

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 8. Mathematical Functions
REM ============================================================================
CLS
PRINT "[8] Mathematical Functions"
PRINT STRING$(40, "-")

DIM angle#, value#
angle# = 45

PRINT "Trigonometric functions (angle = 45 degrees):"
PRINT "  SIN("; angle#; ") = "; SIN(angle# * 3.14159 / 180)
PRINT "  COS("; angle#; ") = "; COS(angle# * 3.14159 / 180)
PRINT "  TAN("; angle#; ") = "; TAN(angle# * 3.14159 / 180)

PRINT
value# = 16
PRINT "Other math functions:"
PRINT "  SQR("; value#; ") = "; SQR(value#)
PRINT "  ABS(-42) = "; ABS(-42)
PRINT "  SGN(-5) = "; SGN(-5); " (sign)"
PRINT "  INT(3.7) = "; INT(3.7)
PRINT "  FIX(-3.7) = "; FIX(-3.7)
PRINT "  LOG(100) = "; LOG(100)
PRINT "  EXP(2) = "; EXP(2)

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 9. Random Numbers
REM ============================================================================
CLS
PRINT "[9] Random Numbers"
PRINT STRING$(40, "-")

RANDOMIZE TIMER

PRINT "Random numbers (0 to 1):"
FOR i% = 1 TO 5
    PRINT "  "; RND
NEXT i%

PRINT
PRINT "Random integers (1 to 100):"
FOR i% = 1 TO 5
    PRINT "  "; INT(RND * 100) + 1
NEXT i%

PRINT
PRINT "Random dice rolls:"
FOR i% = 1 TO 10
    PRINT INT(RND * 6) + 1;
NEXT i%
PRINT

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 10. Input and Output
REM ============================================================================
CLS
PRINT "[10] Input and Output"
PRINT STRING$(40, "-")

DIM userName$, userAge%

PRINT "Interactive input example:"
INPUT "Enter your name: ", userName$
INPUT "Enter your age: ", userAge%

PRINT
PRINT "Hello, "; userName$; "!"
PRINT "You are "; userAge%; " years old."

IF userAge% >= 18 THEN
    PRINT "You are an adult."
ELSE
    PRINT "You are a minor."
END IF

PRINT
PRINT "Formatted output with PRINT USING:"
DIM price1#, price2#, price3#
price1# = 19.5
price2# = 125.99
price3# = 7.3

PRINT USING "Price 1: $###.##"; price1#
PRINT USING "Price 2: $###.##"; price2#
PRINT USING "Price 3: $###.##"; price3#

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 11. Graphics and Colors
REM ============================================================================
CLS
PRINT "[11] Graphics and Colors"
PRINT STRING$(40, "-")

PRINT "Testing colors:"
FOR i% = 1 TO 15
    COLOR i%
    PRINT "Color "; i%;
NEXT i%
COLOR 15

PRINT
PRINT
PRINT "Drawing boxes with characters:"
CALL DrawBox(5, 10, 35, 15, 14)

PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT "Screen manipulation:"
PRINT "  LOCATE - positions cursor"
PRINT "  COLOR - sets text/background color"
PRINT "  CLS - clears screen"
PRINT "  SCREEN - sets screen mode"

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 12. Date and Time
REM ============================================================================
CLS
PRINT "[12] Date and Time"
PRINT STRING$(40, "-")

PRINT "Current date: "; DATE$
PRINT "Current time: "; TIME$
PRINT
PRINT "Timer: "; TIMER; " (seconds since midnight)"

PRINT
PRINT "Formatted date/time:"
DIM currentDate$, currentTime$
currentDate$ = DATE$
currentTime$ = TIME$
PRINT "  Today is "; currentDate$
PRINT "  The time is "; currentTime$

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 13. Data and Read Statements
REM ============================================================================
CLS
PRINT "[13] DATA and READ Statements"
PRINT STRING$(40, "-")

DIM planet$, distance!

PRINT "Reading planet data:"
RESTORE PlanetData
FOR i% = 1 TO 4
    READ planet$, distance!
    PRINT "  "; planet$; ": "; distance!; " million km"
NEXT i%

PlanetData:
DATA "Mercury", 57.9
DATA "Venus", 108.2
DATA "Earth", 149.6
DATA "Mars", 227.9

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM 14. Error Handling
REM ============================================================================
CLS
PRINT "[14] Error Handling"
PRINT STRING$(40, "-")

ON ERROR GOTO ErrorHandler

PRINT "Attempting division:"
DIM numerator%, denominator%
numerator% = 100
denominator% = 0

PRINT "  "; numerator%; " / "; denominator%; " = ";
IF denominator% = 0 THEN
    PRINT "Error: Division by zero!"
ELSE
    PRINT numerator% / denominator%
END IF

PRINT
PRINT "Error handling with ON ERROR GOTO"
PRINT "Proper error checking prevents crashes"

GOTO SkipErrorHandler

ErrorHandler:
    PRINT "Error "; ERR; " occurred!"
    RESUME NEXT

SkipErrorHandler:

PRINT
INPUT "Press Enter to continue...", dummy$

REM ============================================================================
REM Summary
REM ============================================================================
CLS
COLOR 14, 1
PRINT STRING$(80, "=")
PRINT SPACE$(25); "Program Complete!"
PRINT STRING$(80, "=")
COLOR 15, 1
PRINT
PRINT "This program demonstrated:"
PRINT "  1.  Variables and data types (%, &, !, #, $)"
PRINT "  2.  Arithmetic operations (+, -, *, /, \, MOD, ^)"
PRINT "  3.  String operations (LEN, UCASE$, LEFT$, etc.)"
PRINT "  4.  Conditional statements (IF...THEN...ELSE, SELECT CASE)"
PRINT "  5.  Loop structures (FOR...NEXT, WHILE...WEND, DO...LOOP)"
PRINT "  6.  Arrays (1D and 2D)"
PRINT "  7.  Subroutines and functions (SUB, FUNCTION)"
PRINT "  8.  Mathematical functions (SIN, COS, SQR, etc.)"
PRINT "  9.  Random numbers (RND, RANDOMIZE)"
PRINT "  10. Input and output (INPUT, PRINT, PRINT USING)"
PRINT "  11. Graphics and colors (COLOR, LOCATE)"
PRINT "  12. Date and time (DATE$, TIME$, TIMER)"
PRINT "  13. DATA and READ statements"
PRINT "  14. Error handling (ON ERROR GOTO)"
PRINT
COLOR 10
PRINT "Thank you for exploring QBasic!"
COLOR 15
PRINT
END

REM ============================================================================
REM Subroutine and Function Definitions
REM ============================================================================

REM Draw a box using characters
SUB DrawBox (x1%, y1%, x2%, y2%, col%)
    DIM oldColor%
    oldColor% = 7
    COLOR col%
    
    LOCATE y1%, x1%
    PRINT CHR$(201); STRING$(x2% - x1% - 1, CHR$(205)); CHR$(187);
    
    DIM y%
    FOR y% = y1% + 1 TO y2% - 1
        LOCATE y%, x1%
        PRINT CHR$(186); SPACE$(x2% - x1% - 1); CHR$(186);
    NEXT y%
    
    LOCATE y2%, x1%
    PRINT CHR$(200); STRING$(x2% - x1% - 1, CHR$(205)); CHR$(188);
    
    COLOR oldColor%
END SUB

REM Pause for specified seconds
SUB Pause (seconds!)
    DIM startTime!
    startTime! = TIMER
    WHILE TIMER < startTime! + seconds!
    WEND
END SUB

REM Calculate factorial
FUNCTION Factorial# (n%)
    IF n% <= 1 THEN
        Factorial# = 1
    ELSE
        Factorial# = n% * Factorial#(n% - 1)
    END IF
END FUNCTION

REM Check if number is prime
FUNCTION IsPrime% (n%)
    IF n% <= 1 THEN
        IsPrime% = 0
        EXIT FUNCTION
    END IF
    
    IF n% = 2 THEN
        IsPrime% = -1
        EXIT FUNCTION
    END IF
    
    IF n% MOD 2 = 0 THEN
        IsPrime% = 0
        EXIT FUNCTION
    END IF
    
    DIM i%
    FOR i% = 3 TO INT(SQR(n%)) STEP 2
        IF n% MOD i% = 0 THEN
            IsPrime% = 0
            EXIT FUNCTION
        END IF
    NEXT i%
    
    IsPrime% = -1
END FUNCTION

REM Return maximum of two numbers
FUNCTION Max% (a%, b%)
    IF a% > b% THEN
        Max% = a%
    ELSE
        Max% = b%
    END IF
END FUNCTION
