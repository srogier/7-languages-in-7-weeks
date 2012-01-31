/*   A Fibonacci sequence starts with two 1s. Each subsequent number is
   the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21,
   and so on. Write a program to find the nth Fibonacci number. fib(1) is
   1, and fib(4) is 3. As a bonus, solve the problem with recursion and with
   loops.
*/

fib := method(nth,
  ante := 0
  prev := 1
  buff := 0
  for(i, 1, nth,
    buff = ante
    ante = prev
    prev = prev + buff
  )
  
  prev
)

recursFib := method(nth,
  if (nth <= 1) then (return 1)

  recursFib(nth -2) + recursFib(nth -1)
)

"classic Fibonacci sequence" println
for(i,0, 10,
  fib(i) println
)

"recursive Fibonacci sequence" println
for(i,0, 10,
  recursFib(i) println
)


//How would you change / to return 0 if the denominator is zero?

// 42 type => Number
// Number slotnames

oldDivide := Number getSlot("/")
Number / = method(b, if (b==0, 0, oldDivide(b)))
(42 / 0) println
(42 / 6) println

//Write a program to add up all of the numbers in a two-dimensional array.

foo := list(
  list (1, 2, 3),
  list (4, 5, 6)
)

sum2d := method(a, a flatten sum)
sum2d(foo) println

//Add a slot called myAverage to a list that computes the average of all the numbers in a list. 

List myAverage := method(sum / size)
list(7,8,9) myAverage println

//What happens if there are no numbers in a list?
//list() myAverage println
//Exception: nil does not respond to '/'
//list() sum returns nil not a Number, so we can't use /

//(Bonus: Raise an Io exception if any item in the list is not a number.)
List myStrictAverage := method(
  if (
    select(val, val isKindOf(Number)) size < size,
    Exception raise("Only numbers are allowed"),
    sum /size
  )
)

e := try(
  list(1,2,3, "foo") myStrictAverage println 
)

e catch(Exception
  "exception has been caught" println
)

"it still works" println
list(1,2,3) myStrictAverage println 

"---------------------------------------------- " println
" Write a prototype for a two-dimensional list. " println

//   Write a prototype for a two-dimensional list. 

List2d := List clone

// The dim(x, y) method should allocate a list of y lists that are x elements long. 
List2d dim := method(x, y, setSize(y) mapInPlace(_, List clone setSize(x)))

// set(x, y, value) should set  a value, and get(x, y) should return that value.
List2d set := method(x, y, value, at(y) atPut(x, value))
List2d get := method(x, y, at(y) at(x))
l := List2d dim(4,3)

l set(3, 2, "foo")
l get(3, 2) println

l println

// Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.
 
 
/* Write the matrix to a file, and read a matrix from a file. */

/*. Write a program that gives you ten tries to guess a random number from
   1–100. If you would like, give a hint of “hotter” or “colder” after the first
   guess.
*/

