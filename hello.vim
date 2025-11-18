" Vim script
echo "Hello, World!"

function! Greet(name)
    return "Hello, " . a:name . "!"
endfunction

echo Greet("Vim")