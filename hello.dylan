// Dylan
module: hello
synopsis: Hello World program

define function main (name :: <string>, arguments :: <vector>)
  format-out("Hello, World!\n");
  exit-application(0);
end function main;

main(application-name(), application-arguments());
