########Using R as a calculator
###Basic operations
3 + 4
3 - 7
2 * 20
4/2

###Others
10^3
sqrt(10)

###What about logarithms? E.g. which base is R default?
#Let us ask R for help
#We can search "vague" topics with ??
??"logarithm"
#For known help topics (i.e., once we know the function name) we can instead use help or ?
help("log")
?"log"
#Now we know that R default is the natural logarithm (base e)
log(exp(1))
#We can specify a different base as follows
log(25, base = 5)

###Fancier things such as modular arithmetic are also possible...

###Comparisons
3 < 5
3 > 5
3 <= 5 
3 >= 5
3 == 5     #Attention: double equal sign
3 != 5



########"Say my name, say my name" (storage)
###We can assign a value to a name using a left-pointing arrow (combination of "<" and "-")
#A single equal sign "=" is also supported in most cases, but not preferred
x <- 3
#However, pay attention to spacing (you are not trying to check whether x is smaller than -3 :) )

#You can also assign from right to left with a right-pointing arrow (combination of "-" and ">")
4 -> y

###Now we can call these objects by name...
x
y
#... and perform operations
x^2 + y^2

#Do you see where I am going?
z <- 5
x^2 + y^2 == z^2
#x, y and z are a Pythagorean triple!!
#We might want to store all of them together...



########(Atomic) vectors: the simplest data structure in R
###We can combine our x, y and z in a vector using the function c(), which stand for combine/concatenate...
c(x, y, z)
#... and also perform an assignment in the usual way
pythag_triple <- c(x, y, z)
#Operations are performed on a numeric vector element by element
pythag_triple^2


###Atomic vectors
#A vector is called "atomic" if all its elements are of the same type
pythag_triple #A numeric vector
#Compare
r_ladies <- c("Liya", "Laura", "Camilla")
r_ladies      #A character vector
#c() coerces all its arguments to be of the same type
c("one", 1)

########################################
#Create the vector "some_numbers" containing your age in years, your favourite number, and the last digit of your phone nr
#Create the vector "some_characters" containing your first name, your last name, and the name of your hometown
#Create the vector "something" containing a pet name and the number 27. What happens? 
########################################


#Regular sequences with seq()
seq(1, 5)                       #Default
seq(1, 5, by = 0.1)             #Specifying the increment
seq(1, 5, length.out = 25)      #Specifying the desired length of the sequence

#Replicating with rep()
rep(0, 4)                       #Replicate 0 four times
rep(r_ladies, 2)                #Replicate the vector "r_ladies" two times


###Two main properties of atomic vectors
##1) Type: we use typeof() to ask R what are we dealing with
#There are six types of atomic vectors in R, here we focus on four of them

#1.1 - "logical" (TRUE/FALSE, T/F)
logic_av <- c(TRUE, F, T)
typeof(logic_av)
is.logical(x^2 + y^2 == z^2)
is.logical(7 == 5)
#1.2 - "integer" (using L)
integ_av <- c(1L, 1L, 2L, 3L, 5L, 8L, 13L)         
typeof(integ_av)
is.integer(1)         #Attention
is.integer(1L)
#1.3 - "double"
double_av <- c(3, 1.2, 1.6, 1007)
typeof(double_av)
is.double(1)
#1.4 - "character"  (using quotes "" or '')
charac_av <- c("A", "B", 'C', "Hello", 'world')   
typeof(charac_av)
is.character(1)
is.character("1")
is.character('1')

#Coercing
typeof(pythag_triple)
#We know these numbers should be integers really...
pythag_triple <- as.integer(pythag_triple)
typeof(pythag_triple)


##2) Length: we use length() to ask R how many elements are in a vector
length(pythag_triple)
length(7)    #A vector consisting of only one element as length one
length(NULL) #The length of an empty vector is zero

##NOTE: str() gives an overview of the structure of an R object



########Matrices


########Lists and dataframes
#They can contain elements of different types

###Lists: the most flexible objects in R
#Compare
c("one", 1)
list("one", 1)

###Dataframes
