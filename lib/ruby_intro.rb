#----------------------------------------------------------------------------------------------------------------------
# Define a method sum(array) that takes an array of integers as an argument and returns the sum of its elements. For an 
# empty array it should return zero. Run associated tests via: $ rspec -e '#sum ' spec/part1_spec.rb
def sum(a)
	s = 0
	a.each {|x| s+= x}
	s
end

#----------------------------------------------------------------------------------------------------
# Define a method max_2_sum(array) which takes an array of integers as an argument and returns the sum of its two largest  
# elements. For an empty array it should return zero. For an array with just one element, it should return that element. Run 
# associated tests via: $ rspec -e '#max_2_sum' spec/part1_spec.rb
def max_2_sum(a)
	return 0 if a.empty?
	return a[0] if a.length == 1
	ar = a.sort
	ar[-1] + ar[-2]
end

#--------------------------------------------------------------------------------------
# Define a method sum_to_n?(array, n) that takes an array of integers and an additional integer, n, as arguments and 
# returns true if any two elements in the array of integers sum to n. sum_to_n?([], n) should return false for any value of n, 
# by definition. Run associated tests via: $ rspec -e '#sum_to_n' spec/part1_spec.rb
def sum_to_n?(a, n)
	return false if a.empty? or a.length == 1

	h = Hash.new
	a.each{|x| 
		if h.key? x
			return true
		else
			h[n - x] = n	
		end
	}
	return false
end

#-------------------------------------------------------------------------------------------------------
# Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with 
# the name. Run associated tests via: $ rspec -e '#hello' spec/part2_spec.rb
def hello(name)
	"Hello, #{name}"
end

#---------------------------------------------------------------------------------------------------------
# Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false 
# otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and 
# lower case and for nonletters! Run associated tests via: $ rspec -e '#starts_with_consonant?' spec/part2_spec.rb
def starts_with_consonant? (s)
	/^[b-df-hj-np-tv-z]/i.match(s) != nil
end

#------------------------------------------------------------------------------------------------------
# Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number 
# that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number! Run associated tests via:
# $ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb
def binary_multiple_of_4? (s)
	return true if s == "0"
	/^[10]*00$/.match(s) != nil
end

#----------------------------------------------------------------------------------------------------
# Define a class BookInStock which represents a book with an ISBN number, isbn, and price of the book as a floating-point 
# number, price, as attributes. Run associated tests via: $ rspec -e 'getters and setters' spec/part3_spec.rb
# The constructor should accept the ISBN number (a string, since in real life ISBN numbers can begin with zero and can include 
# hyphens) as the first argument and price as second argument, and should raise ArgumentError (one of Ruby's built-in 
# exception types) if the ISBN number is the empty string or if the price is less than or equal to zero. Include the proper getters 
# and setters for these attributes. Run associated tests via: $ rspec -e 'constructor' spec/part3_spec.rb
#
# Include a method price_as_string that returns the price of the book formatted with a leading dollar sign and two decimal 
# places, that is, a price of 20 should format as "$20.00" and a price of 33.8 should format as "$33.80". Run associated tests via:
# $ rspec -e '#price_as_string' spec/part3_spec.rb
class BookInStock

	attr_accessor :isbn
	attr_accessor :price

	def initialize(isbn, price)
		raise ArgumentError, 
			"Illegal argument" if isbn.empty?  or price <= 0
		@isbn = isbn
		@price = price
	end

	def price_as_string
		sprintf("$%2.2f", @price)
	end
end
