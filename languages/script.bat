@echo off
setlocal EnableDelayedExpansion
REM ============================================================================
REM Comprehensive Windows Batch Script Demonstration
REM Showcasing idiomatic features and best practices
REM ============================================================================

title Batch Script Feature Showcase
color 0A

REM Display header
echo ====================================
echo  Batch Script Feature Showcase
echo ====================================
echo.

REM ============================================================================
REM Variables and String Manipulation
REM ============================================================================
echo [1] Variables and String Manipulation
echo -------------------------------------

set NAME=Batch Script
set VERSION=1.0
set AUTHOR=Windows Developer

echo Hello from %NAME% v%VERSION%
echo Author: %AUTHOR%
echo.

REM String concatenation
set GREETING=Hello
set TARGET=World
set MESSAGE=%GREETING%, %TARGET%!
echo %MESSAGE%
echo.

REM String length (using delayed expansion)
set TEXT=Sample Text
call :StrLen "%TEXT%" length
echo Text: "%TEXT%" has %length% characters
echo.

REM Substring extraction
set FULLNAME=JohnDoe
set FIRSTNAME=%FULLNAME:~0,4%
set LASTNAME=%FULLNAME:~4%
echo First Name: %FIRSTNAME%
echo Last Name: %LASTNAME%
echo.

REM String replacement
set ORIGINAL=Hello World
set MODIFIED=%ORIGINAL:World=Batch%
echo Original: %ORIGINAL%
echo Modified: %MODIFIED%
echo.

pause
cls

REM ============================================================================
REM Arithmetic Operations
REM ============================================================================
echo [2] Arithmetic Operations
echo --------------------------

set /a NUM1=15
set /a NUM2=7
set /a SUM=%NUM1% + %NUM2%
set /a DIFF=%NUM1% - %NUM2%
set /a PROD=%NUM1% * %NUM2%
set /a QUOT=%NUM1% / %NUM2%
set /a MOD=%NUM1% %% %NUM2%

echo %NUM1% + %NUM2% = %SUM%
echo %NUM1% - %NUM2% = %DIFF%
echo %NUM1% * %NUM2% = %PROD%
echo %NUM1% / %NUM2% = %QUOT%
echo %NUM1% %% %NUM2% = %MOD%
echo.

REM Increment and decrement
set /a COUNTER=0
set /a COUNTER+=1
echo Counter after increment: %COUNTER%
set /a COUNTER-=1
echo Counter after decrement: %COUNTER%
echo.

pause
cls

REM ============================================================================
REM Conditional Statements
REM ============================================================================
echo [3] Conditional Statements
echo ---------------------------

set AGE=25

if %AGE% GEQ 18 (
    echo Age %AGE%: You are an adult
) else (
    echo Age %AGE%: You are a minor
)
echo.

REM String comparison
set USER=admin
if /i "%USER%"=="admin" (
    echo User has administrator privileges
) else (
    echo User has standard privileges
)
echo.

REM Multiple conditions with AND/OR logic
set SCORE=85
if %SCORE% GEQ 90 (
    echo Grade: A
) else if %SCORE% GEQ 80 (
    echo Grade: B
) else if %SCORE% GEQ 70 (
    echo Grade: C
) else (
    echo Grade: F
)
echo.

REM Check if file exists
if exist "%~f0" (
    echo This script file exists: %~nx0
)
echo.

REM Check if directory exists
if exist "%TEMP%" (
    echo TEMP directory exists: %TEMP%
)
echo.

pause
cls

REM ============================================================================
REM Loops
REM ============================================================================
echo [4] Loops
echo ----------

REM FOR loop - counting
echo FOR loop counting 1 to 5:
for /L %%i in (1,1,5) do (
    echo   Count: %%i
)
echo.

REM FOR loop - iterating over list
echo FOR loop over items:
for %%f in (Apple Banana Cherry) do (
    echo   Fruit: %%f
)
echo.

REM FOR loop - iterating over files
echo Current directory .bat files:
for %%f in (*.bat) do (
    echo   - %%f
)
echo.

REM WHILE-like loop using GOTO
set /a INDEX=1
:WhileLoop
if %INDEX% LEQ 3 (
    echo   While-like iteration: %INDEX%
    set /a INDEX+=1
    goto :WhileLoop
)
echo.

pause
cls

REM ============================================================================
REM Arrays (using indexed variables)
REM ============================================================================
echo [5] Arrays (Simulated)
echo -----------------------

REM Define array
set ARRAY[0]=Windows
set ARRAY[1]=Linux
set ARRAY[2]=MacOS
set ARRAY[3]=Unix

REM Access array elements
echo Operating Systems:
for /L %%i in (0,1,3) do (
    echo   [%%i] !ARRAY[%%i]!
)
echo.

pause
cls

REM ============================================================================
REM Functions (Subroutines)
REM ============================================================================
echo [6] Functions (Subroutines)
echo ----------------------------

call :PrintMessage "Hello from a function!"
echo.

call :Add 10 20 result
echo 10 + 20 = %result%
echo.

call :GetDateTime currentDateTime
echo Current Date/Time: %currentDateTime%
echo.

call :IsEven 42 isEvenResult
if "%isEvenResult%"=="true" (
    echo 42 is even
) else (
    echo 42 is odd
)
echo.

pause
cls

REM ============================================================================
REM File Operations
REM ============================================================================
echo [7] File Operations
echo --------------------

REM Create a temporary file
set TEMP_FILE=%TEMP%\batch_demo_%RANDOM%.txt
echo Creating temporary file...
echo This is a test file created by batch script > "%TEMP_FILE%"
echo Line 2: Current date is %DATE% >> "%TEMP_FILE%"
echo Line 3: Current time is %TIME% >> "%TEMP_FILE%"

if exist "%TEMP_FILE%" (
    echo File created: %TEMP_FILE%
    echo.
    echo File contents:
    type "%TEMP_FILE%"
    echo.
)

REM Get file size and date
for %%f in ("%TEMP_FILE%") do (
    echo File size: %%~zf bytes
    echo File date: %%~tf
)
echo.

REM Clean up
echo Deleting temporary file...
del "%TEMP_FILE%" 2>nul
if not exist "%TEMP_FILE%" (
    echo File deleted successfully
)
echo.

pause
cls

REM ============================================================================
REM Directory Operations
REM ============================================================================
echo [8] Directory Operations
echo -------------------------

REM Display current directory
echo Current Directory: %CD%
echo.

REM Display environment variables
echo System Information:
echo   Computer Name: %COMPUTERNAME%
echo   User Name: %USERNAME%
echo   OS: %OS%
echo   Processor: %PROCESSOR_IDENTIFIER%
echo   Number of Processors: %NUMBER_OF_PROCESSORS%
echo.

REM Create and remove directory
set TEST_DIR=%TEMP%\batch_test_%RANDOM%
echo Creating test directory...
mkdir "%TEST_DIR%" 2>nul
if exist "%TEST_DIR%" (
    echo Directory created: %TEST_DIR%
    
    REM Remove directory
    echo Removing test directory...
    rmdir "%TEST_DIR%" 2>nul
    if not exist "%TEST_DIR%" (
        echo Directory removed successfully
    )
)
echo.

pause
cls

REM ============================================================================
REM Command Line Arguments
REM ============================================================================
echo [9] Command Line Arguments
echo ---------------------------

echo Script name: %~n0
echo Script full path: %~f0
echo Script directory: %~dp0
echo.

if "%~1"=="" (
    echo No arguments provided
    echo Usage: %~nx0 [arg1] [arg2] [arg3]
) else (
    echo Argument 1: %~1
    if not "%~2"=="" echo Argument 2: %~2
    if not "%~3"=="" echo Argument 3: %~3
)
echo.

pause
cls

REM ============================================================================
REM Error Handling
REM ============================================================================
echo [10] Error Handling
echo --------------------

REM Test successful command
dir "%WINDIR%" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Windows directory exists
) else (
    echo [ERROR] Windows directory not found
)

REM Test failing command
dir "Z:\NonExistentPath\Fake" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [INFO] Expected error: Path does not exist
)
echo.

REM Custom error handling
call :DivideByZero divResult
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Division by zero detected
)
echo.

pause
cls

REM ============================================================================
REM Date and Time Operations
REM ============================================================================
echo [11] Date and Time Operations
echo ------------------------------

echo Current Date: %DATE%
echo Current Time: %TIME%
echo.

REM Parse date components
for /f "tokens=1-3 delims=/" %%a in ("%DATE%") do (
    set MONTH=%%a
    set DAY=%%b
    set YEAR=%%c
)
echo Parsed Date: Month=%MONTH%, Day=%DAY%, Year=%YEAR%
echo.

REM Generate timestamp
set TIMESTAMP=%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set TIMESTAMP=%TIMESTAMP: =0%
echo Timestamp: %TIMESTAMP%
echo.

pause
cls

REM ============================================================================
REM Advanced Features
REM ============================================================================
echo [12] Advanced Features
echo -----------------------

REM Color codes
echo Testing color output...
color 0E
echo Yellow text on black background
timeout /t 1 >nul
color 0A
echo Green text on black background
timeout /t 1 >nul
color 0C
echo Red text on black background
timeout /t 1 >nul
color 07
echo Default colors restored
echo.

REM Progress bar simulation
echo Simulating progress bar:
set /a PROGRESS=0
:ProgressLoop
if %PROGRESS% LEQ 100 (
    set /a BARS=%PROGRESS% / 5
    set "PROGRESSBAR="
    for /L %%i in (1,1,!BARS!) do set "PROGRESSBAR=!PROGRESSBAR!█"
    <nul set /p "=Progress: [!PROGRESSBAR!] %PROGRESS%%%"
    timeout /t 0 >nul
    set /a PROGRESS+=10
    echo.
    goto :ProgressLoop
)
echo Complete!
echo.

pause
cls

REM ============================================================================
REM Summary
REM ============================================================================
echo ====================================
echo  Script Execution Complete!
echo ====================================
echo.
echo This script demonstrated:
echo  1. Variables and string manipulation
echo  2. Arithmetic operations
echo  3. Conditional statements
echo  4. Loops (FOR, WHILE-like)
echo  5. Arrays (simulated)
echo  6. Functions (subroutines)
echo  7. File operations
echo  8. Directory operations
echo  9. Command line arguments
echo 10. Error handling
echo 11. Date and time operations
echo 12. Advanced features
echo.
echo Thank you for using Batch Script!
echo.

pause
goto :EOF

REM ============================================================================
REM Function Definitions
REM ============================================================================

:StrLen
REM Calculate string length
set "str=%~1"
set "len=0"
:StrLen_Loop
if defined str (
    set "str=%str:~1%"
    set /a len+=1
    goto :StrLen_Loop
)
set "%~2=%len%"
goto :EOF

:PrintMessage
echo   Message: %~1
goto :EOF

:Add
set /a "%~3=%~1 + %~2"
goto :EOF

:GetDateTime
set "%~1=%DATE% %TIME%"
goto :EOF

:IsEven
set /a "temp=%~1 %% 2"
if %temp% EQU 0 (
    set "%~2=true"
) else (
    set "%~2=false"
)
goto :EOF

:DivideByZero
REM Simulate error handling
set /a "test=1 / 0" 2>nul
exit /b 1

:EOF
endlocal