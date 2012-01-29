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

