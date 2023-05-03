#!/usr/bin/perl
 
# Initialising an array of some elements
@Array = ('Ram', 'Shyam', 'Rahim', 'Geeta', 'Sheeta');
 
# Calling the grep() function
@A = grep(!/^R/, @Array);
 
# Printing the required elements of the array
print @A;
