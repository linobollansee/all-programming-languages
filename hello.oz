// Oz
functor
import
   System
   Application
define
   {System.showInfo "Hello, World!"}
   
   fun {Greet Name}
      "Hello, "#Name#"!"
   end
   
   {Application.exit 0}
end
