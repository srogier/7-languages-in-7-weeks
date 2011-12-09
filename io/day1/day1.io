//Find:

//  • Some Io example problems
//  http://iolanguage.com/about/samplecode/
//  • An Io community that will answer questions

//  • A style guide with Io idioms
// http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide


//Answer:
//  • Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly typed?    Support your answer with code.

(1 + 1) println


e := try(
  (1 + "one") println
) 

e catch(Exception,
    "Io seems to be strongly typed. It doesn't automatically convert integer to string." println
)


//  • Is 0 true or false? What about the empty string? Is nil true or false?     Support your answer with code.
(" 0 is " .. if(0, "true", "false")) println
(" \"\" is " .. if("", "true", "false")) println
("nil is " .. if(nil, "true", "false")) println

//  • How can you tell what slots a prototype supports?

Foo := Object clone
Foo bar := "bar slot"
Foo slotNames println

//  • What is the difference between = (equals), := (colon equals), and ::= (colon    colon equals)? When would you use each one?


/**
 * http://www.iolanguage.com/scm/io/docs/IoGuide.html#Syntax-Assignment
 * 
 * ::=   Creates slot, creates setter, assigns value
 * :=    Creates slot, assigns value
 * =     Assigns value to slot if it exists, otherwise raises exception
 */

Car := Object clone
Car owner ::= "owner"
Car nbDoors := 0

aygo := Car clone setOwner("seb")
//aygo setNbDoors(2); this won't work
aygo nbDoors = 2
aygo owner println
aygo nbDoors println

//Do:
//  • Run an Io program from a file.

//io day1.io

//  • Execute the code in a slot given its name.

Foo hello := method(name, 
  ("hello " .. name .. " !!") println
);

Foo hello("seb")
Foo getSlot("hello") call("seb again")




