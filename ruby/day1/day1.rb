#Print the string “Hello, world.”

puts 'Hello, world.'

# For the string “Hello, Ruby,” find the index of the word “Ruby.”

puts 'Hello, Ruby,'.index 'Ruby'

# Print your name ten times.

10.times { puts 'Seb' }
puts 'Seb * ' * 10

# Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.

(1..10).each { |i|  puts "this is sentence number #{i}, " }


# Run a Ruby program from a file.

#ruby day1.rb


#Bonus problem: If you’re feeling the need for a little more, write a pro-
#gram that picks a random number. Let a player guess the number,
#telling the player whether the guess is too low or too high.

random_number = rand(100)
guess = -1

until random_number == guess
  puts "Guess a number between 0 & 100"

  guess = gets.to_i
  
  puts "Too high, try again" if guess > random_number
  puts "Too low, try again" if guess < random_number
  
  
end


puts '\o/'



