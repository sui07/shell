
1. Write a shell script to find first N prime numbers.
      Answer:



 1.   #!/bin/bash
 2.   echo "Enter an integer N:"
 3.   read N
 4.
 5.   echo "The first $N prime numbers are:"
 6.
 7.   count=0
 8.   number=2
 9.
10.   while [ $count -lt $N ]
11.   do
12.     prime=1
13.      for (( i=2; i<$number; i++ ))
14.      do
15.        if [ $(($number % $i)) -eq 0 ]
16.        then
17.          prime=0
18.           break
19.        fi
20.      done
21.
22.     if [ $prime -eq 1 ]
23.     then
24.       echo $number
25.       count=$(($count + 1))
26.     fi
27.
28.     number=$(($number + 1))
29.   done
30.

2. Write a shell script to accept two files name and concatenate the content
   of the file into another file if both file are exits.
       Answer:
 1. #!/bin/bash
 2.
 3. echo "Enter the name of the first file:"
 4. read file1
 5.
 6. echo "Enter the name of the second file:"
 7. read file2
 8.
 9. echo "Enter the name of the file to concatenate to:"
10. read concat_file
11.
12. if [ -f $file1 ] && [ -f $file2 ]
13. then
14.   cat $file1 $file2 > $concat_file
15.   echo "Content of $file1 and $file2 have been concatenated to
$concat_file."
16. else
17.   echo "Both files $file1 and $file2 must exist to concatenate their
content."
18. fi
19.


 3. Write a shell script to list the attributes of the process running on a
    system, also store this information in a file named "processInfo.info".
       Answer:
         Shell Script
 1.   #!/bin/bash
 2.
 3.   echo "Listing process attributes..."
 4.
 5.   # get process ID
 6.   echo -n "Process ID: "
 7.   echo $$
 8.
 9.   # get process name
10.   echo -n "Process name: "
11.   echo $(basename $0)

12.
13. # get process user
14. echo -n "Process user: "
15. echo $USER
16.
17. # get process start time
18. echo -n "Process start time: "
19. echo $(date +"%Y-%m-%d %H:%M:%S")
20.
21. # get process CPU usage
22. echo -n "Process CPU usage: "
23. echo $(ps -p $$ -o %cpu | awk 'NR==2')
24.
25. # get process memory usage
26. echo -n "Process memory usage: "
27. echo $(ps -p $$ -o %mem | awk 'NR==2')
28.
29. # write process information to file
30. echo "Writing process information to file processInfo.info..."
31. echo "Process ID: $$" > processInfo.info
32. echo "Process name: $(basename $0)" >> processInfo.info
33. echo "Process user: $USER" >> processInfo.info
34. echo "Process start time: $(date +"%Y-%m-%d %H:%M:%S")" >> processInfo.info
35. echo "Process CPU usage: $(ps -p $$ -o %cpu | awk 'NR==2')" >>
processInfo.info
36. echo "Process memory usage: $(ps -p $$ -o %mem | awk 'NR==2')" >>
processInfo.info
37.
38. echo "Process attributes have been listed and written to processInfo.info."




4. Write a shell script to check your present working directory, and make a
   list of a files modified within last 24 hours.
      Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   echo "Checking present working directory..."
 4.
 5.   # get the present working directory
 6.   pwd
 8.   echo "Listing files modified within the last 24 hours..."
 9.
10.   # use the find command to list files modified within the last 24 hours
11.   find . -type f -mtime -1 -ls > modified_files.txt
12.
13.   echo "List of modified files written to modified_files.txt."
14.



5. Write a shell script to check whether the number is prime or not. The
   number should be given as an input through command line argument.
    
 1.   #!/bin/bash
 2.
 3.   # check if number of arguments is correct
 4.   if [ $# -ne 1 ]
 5.   then
 6.     echo "Usage: $0 <number>"
 7.      exit 1
 8.   fi
 9.
10.   # get the input number
11.   n=$1
12.
13.   # check if number is less than 2
14.   if [ $n -lt 2 ]
15.   then
16.     echo "$n is not a prime number"
17.      exit 0
18.   fi
19.
20.   # check if number is equal to 2
21.   if [ $n -eq 2 ]
22.   then
23.     echo "$n is a prime number"
24.      exit 0
25.   fi
26.
27.   # check if number is divisible by any integer from 2 to its square root
28.   for ((i=2; i*i<=n; i++))
29.   do
30.      if [ $((n%i)) -eq 0 ]
31.      then

32.     echo "$n is not a prime number"
33.     exit 0
34.   fi
35. done
36.
37. # if none of the above conditions were met, the number is prime
38. echo "$n is a prime number"
39.


 6. Write a shell script to count number of digit of a multi-digit number
    taken as command line input.
       Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   # check if number of arguments is correct
 4.   if [ $# -ne 1 ]
 5.   then
 6.     echo "Usage: $0 <number>"
 7.      exit 1
 8.   fi
 9.
10.   # get the input number
11.   n=$1
12.
13.   # check if number is negative
14.   if [ $n -lt 0 ]
15.   then
16.     n=$(( -n ))
17.   fi
18.
19.   # count the number of digits in the number
20.   count=0
21.   while [ $n -gt 0 ]
22.   do
23.     n=$(( n / 10 ))
24.     count=$(( count + 1 ))
25.   done
26.
27.   # output the number of digits
28.   echo "The number of digits in $1 is $count"
29.
   

 7. Write a shell script to create a substring from a string. The starting
    position and length of the substring must be given by the user.
   Answer:
    Shell Script
 1. #!/bin/bash
 2.
 3. # check if number of arguments is correct
 4. if [ $# -ne 3 ]
 5. then
 6.   echo "Usage: $0 <string> <start position> <length>"
 7.    exit 1
 8. fi
 9.
10. # get the input string, start position, and length
11. string=$1
12. start_pos=$2
13. length=$3
14.
15. # check if start position is negative
16. if [ $start_pos -lt 0 ]
17. then
18.   echo "Start position cannot be negative"
19.    exit 1
20. fi
21.
22. # check if start position is greater than the length of the string
23. if [ $start_pos -gt ${#string} ]
24. then
25.   echo "Start position cannot be greater than the length of the string"
26.    exit 1
27. fi
28.
29. # check if length is negative
30. if [ $length -lt 0 ]
31. then
32.   echo "Length cannot be negative"
33.    exit 1
34. fi
35.
36. # create the substring
37. substring=${string:start_pos:length}
38.
39. # output the substring
40. echo "The substring of \"$string\" starting from position $start_pos and of
length $length is \"$substring\""
41.



8.    Write a shell script to compare two files and list the dissimilarities.
      Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   # check if number of arguments is correct
 4.   if [ $# -ne 2 ]
 5.   then
 6.     echo "Usage: $0 <file1> <file2>"
 7.      exit 1
 8.   fi
 9.
10.   # check if both files exist
11.   if [ ! -f "$1" ] || [ ! -f "$2" ]
12.   then
13.     echo "Error: Both files must exist"
14.      exit 1
15.   fi
16.
17.   # compare the two files and output the differences
18.   diff "$1" "$2"
19.
 

9. Write a shell script to get the current date, time, username and present
   working directory. Store the results in a file and count the number of
   characters in the file.
      Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   # get the current date and time
 4.   date_time=$(date "+%Y-%m-%d %H:%M:%S")
 5.
 6.   # get the username
 7.   username=$(whoami)
 8.
 9.   # get the present working directory
10.   pwd=$(pwd)
11.
12.   # create a file and write the results to it
13.   file="results.txt"
14.   echo "Date and time: $date_time" >> "$file"
15.   echo "Username: $username" >> "$file"
16.   echo "Present working directory: $pwd" >> "$file"
17.
18.   # count the number of characters in the file
19.   char_count=$(wc -m < "$file")
20.
21.   # output the number of characters in the file
22.   echo "The number of characters in \"$file\" is $char_count"
23.
24.
  



10. Write a shell script to print the Fibonacci series up to N terms. Where N
    should be taken as command line input.
      Answer:
       Shell Script
 1.   #!/bin/bash
 2.
 3.   # check if number of arguments is correct
 4.   if [ $# -ne 1 ]
 5.   then
 6.     echo "Usage: $0 <N>"
 7.      exit 1
 8.   fi
 9.
10.   # check if argument is a positive integer
11.   if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]
12.   then
13.     echo "Error: Argument must be a positive integer"
14.        exit 1
15.   fi
16.
17.   # initialize variables
18.   n=$1
19.   a=0
20.   b=1
21.
22.   # print the first two terms of the series
23.   echo -n "$a $b "
24.
25.   # print the remaining terms of the series
26.   for (( i=3; i<=n; i++ ))
27.   do
28.      # calculate the next term of the series
29.     c=$((a + b))
30.     echo -n "$c "
31.
32.     # update the variables for the next iteration
33.     a=$b
34.     b=$c
35.   done
36.
37.   echo # print a newline at the end
38.
39.



11. Write a shell script to check whether a number is Armstrong number or
    not. The number should be given as an input through command line
    argument.
      Answer:
       Shell Script
 1.   #!/bin/bash
 2.
 3.   # check if number of arguments is correct
 4.   if [ $# -ne 1 ]
 5.   then
 6.     echo "Usage: $0 <number>"
 7.      exit 1
 8.   fi
 9.
10.   # check if argument is a positive integer
11.   if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]
12.   then
13.     echo "Error: Argument must be a positive integer"
14.      exit 1
15.   fi

16.
17.   # initialize variables
18.   number=$1
19.   sum=0
20.
21.   # calculate the number of digits in the number
22.   n=${#number}
23.
24.   # calculate the sum of the cubes of the digits
25.   for (( i=0; i<$n; i++ ))
26.   do
27.     digit=${number:$i:1}
28.     sum=$((sum + digit ** n))
29.   done
30.
31.   # check if the number is an Armstrong number
32.   if [ $sum -eq $number ]
33.   then
34.     echo "$number is an Armstrong number"
35.   else
36.     echo "$number is not an Armstrong number"
37.   fi
38.
39.



12. Write a shell script to sort an array of integers. The length of the array
    should be taken a command line argument and array elements should be
    provided at the run time.
      Answer:
       Shell Script
 1.   #!/bin/bash
 2.
 3.   # check if number of arguments is correct
 4.   if [ $# -ne 1 ]
 5.   then
 6.     echo "Usage: $0 <length>"
 7.      exit 1
 8.   fi
 9.
10.   # check if argument is a positive integer
11.   if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]
12.   then
13.     echo "Error: Argument must be a positive integer"
14.      exit 1
15.   fi
16.
17.   # read array elements from user input
18.   echo "Enter the array elements:"
19.   for (( i=0; i<$1; i++ ))
20.   do
21.     read -p "Element $((i+1)): " array[$i]
22.   done
23.
24.   # sort the array using bubble sort algorithm
25.   for (( i=0; i<$1-1; i++ ))
26.   do
27.      for (( j=0; j<$1-i-1; j++ ))
28.      do
29.        if [ ${array[j]} -gt ${array[j+1]} ]
30.        then
31.          temp=${array[j]}
32.          array[j]=${array[j+1]}
33.          array[j+1]=$temp
34.        fi
35.      done
36.   done
37.
38.   # print the sorted array
39.   echo "Sorted array:"
40.   for (( i=0; i<$1; i++ ))
41.   do
42.     echo ${array[i]}
43.   done
44.

13. Write a shell script to create an array using user input and perform scalar
    multiplication on the array elements.
      Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   # read array size from user input
 4.   read -p "Enter the size of the array: " size
 5.
 6.   # declare an array of the given size
 7.   declare -a array
 8.
 9.   # read array elements from user input
10.   echo "Enter the array elements:"
11.   for (( i=0; i<$size; i++ ))
12.   do
13.     read -p "Element $((i+1)): " array[$i]
14.   done
15.
16.   # read scalar value from user input
17.   read -p "Enter the scalar value: " scalar
18.
19.   # perform scalar multiplication on the array elements
20.   for (( i=0; i<$size; i++ ))
21.   do
22.     array[$i]=$((array[$i]*scalar))
23.   done
24.
25.   # print the resulting array
26.   echo "Resulting array:"
27.   for (( i=0; i<$size; i++ ))
28.   do
29.     echo ${array[$i]}
30.   done
31.


 14. Write a shell script to input a file name containing multiple lines and
     then create a new file by copying line 4 to 10 from inputted file.
       Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   # read input file name from user input
 4.   read -p "Enter the input file name: " input_file
 5.
 6.   # check if input file exists
 7.   if [ ! -f $input_file ]
 8.   then
 9.     echo "Error: Input file $input_file does not exist"
10.      exit 1
11.   fi
12.
13.   # create output file name
14.   output_file="${input_file}_output"
15.
16.   # copy lines 4 to 10 from input file to output file
17.   sed -n '4,10p' $input_file > $output_file
18.
19.   # print success message
20.   echo "Lines 4 to 10 from $input_file have been copied to $output_file"
21.




 15. Write a shell script to input a year as command line argument and check
     whether the year is palindrome or not.
       Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   # check if year argument is passed
 4.   if [ $# -ne 1 ]
 5.   then
 6.     echo "Error: Please provide a year as command line argument"
 7.      exit 1
 8.   fi
 9.
10.   # store year in a variable
11.   year=$1
12.
13.   # reverse the year
14.   reverse=0
15.   temp=$year

16.   while [ $temp -gt 0 ]
17.   do
18.     remainder=$((temp % 10))
19.     reverse=$((reverse * 10 + remainder))
20.     temp=$((temp / 10))
21.   done
22.
23.   # check if year is a palindrome
24.   if [ $year -eq $reverse ]
25.   then
26.     echo "$year is a palindrome"
27.   else
28.     echo "$year is not a palindrome"
29.   fi
30.
31.




 16. Write a shell script to find whether a pair of integers are twin prime. A
     twin prime is either a prime number that is 2 less or 2 more than
     another prime number- for example, member of the twin prime pair (41,
     43). In other words, a twin prime is a prime that has a prime gap of two.
       Answer:
         Shell Script
 1.   #!/bin/bash
 2.
 3.   # Check if two arguments are passed
 4.   if [ $# -ne 2 ]
 5.   then
 6.     echo "Error: Please provide two integers as command line arguments."
 7.      exit 1
 8.   fi
 9.
10.   # Store the two arguments as variables
11.   num1=$1
12.   num2=$2
13.
14.   # Check if the two numbers are prime
15.   is_prime()
16.   {
17.     n=$1
18.     if [ $n -lt 2 ]
19.     then
20.       return 1
21.     fi

22.       for (( i=2; i<=n/2; i++ ))
23.       do
24.         if [ $((n%i)) -eq 0 ]
25.         then
26.            return 1
27.         fi
28.       done
29.       return 0
30.   }
31.
32.   is_prime $num1
33.   if [ $? -ne 0 ]
34.   then
35.     echo "$num1 is not a prime number."
36.      exit 1
37.   fi
38.
39.   is_prime $num2
40.   if [ $? -ne 0 ]
41.   then
42.     echo "$num2 is not a prime number."
43.      exit 1
44.   fi
45.
46.   # Check if the two numbers are twin primes
47.   diff=$((num2-num1))
48.   if [ $diff -eq 2 ] || [ $diff -eq -2 ]
49.   then
50.     echo "$num1 and $num2 are twin primes."
51.   else
52.     echo "$num1 and $num2 are not twin primes."
53.   fi
54.
55.




17. Write a shell script to count number of words in a string given by the
    user.
          Answer:
           Shell Script
 1.   #!/bin/bash
 2.
 3.   echo "Enter a string:"
 4.   read input_string
 5.
 6.   word_count=0
 7.
 8.   # loop through the string and count the number of spaces

 9.   for (( i=0; i<${#input_string}; i++ )); do
10.       if [[ "${input_string:i:1}" == " " ]]; then
11.           (( word_count++ ))
12.       fi
13.   done
14.
15.   # add 1 to word count for the last word
16.   (( word_count++ ))
17.
18.   echo "Number of words in the string: $word_count"
19.




18. Write a shell script to check whether a number is BUZZ number or not.
    A BUZZ number is the number, which either ends with 7 or is divided by
    7.
      Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   echo "Enter a number:"
 4.   read num
 5.
 6.   if (( num % 7 == 0 )) || (( num % 10 == 7 )); then
 7.       echo "$num is a BUZZ number"
 8.   else
 9.       echo "$num is not a BUZZ number"
10.   fi
11.


19. Write a shell script to find the GCD of two integers taken as command
    line arguments.
      Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   # Check if both arguments are provided
 4.   if [ $# -ne 2 ]; then
 5.       echo "Usage: $0 num1 num2"
 6.       exit 1
 7.   fi
 8.
 9.   # Get the arguments
10.   num1=$1
11.   num2=$2
12.
13.   # Find the GCD using Euclid's algorithm
14.   while [ $num2 -ne 0 ]
15.   do
16.       remainder=$(( num1 % num2 ))
17.       num1=$num2
18.       num2=$remainder
19.   done
20.
21.   # Print the GCD
22.   echo "GCD of $1 and $2 is: $num1"
23.
24.



20. Write a shell script to find the LCM of two integers taken as command
    line arguments.
      Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   # Check if both arguments are provided
 4.   if [ $# -ne 2 ]; then
 5.       echo "Usage: $0 num1 num2"
 6.       exit 1
 7.   fi
 8.
 9.   # Get the arguments
10.   num1=$1
11.   num2=$2
12.
13.   # Find the GCD using Euclid's algorithm

14.   while [ $num2 -ne 0 ]
15.   do
16.       remainder=$(( num1 % num2 ))
17.       num1=$num2
18.       num2=$remainder
19.   done
20.
21.   # Calculate the LCM
22.   lcm=$(( $1 * $2 / $num1 ))
23.
24.   # Print the LCM
25.   echo "LCM of $1 and $2 is: $lcm"
26.



21. Write a shell script to check whether a number is automorphic number or
    not. An automorphic number contains the last digits of its square. 25 is an
    automorphic number as its square is 625 and 25 is present as the last two
    digit.
      Answer:
         Shell Script
 1.   #!/bin/bash
 2.
 3.   # Take the number as input from the user
 4.   echo "Enter a number: "
 5.   read num
 6.
 7.   # Compute the square of the number
 8.   square=$(expr $num \* $num)
 9.
10.   # Extract the last digits of the square and the number
11.   num_digits=${#num}
12.   last_digits=${square:(-$num_digits)}
13.
14.   # Check if the last digits of the square match the original number
15.   if [ "$last_digits" == "$num" ]; then
16.       echo "$num is an automorphic number"
17.   else
18.       echo "$num is not an automorphic number"
19.   fi
20.


22. Write a shell script to find the sum of digits from a multi-digit number.
       Answer:
         Shell Script
 1.   #!/bin/bash
 2.
 3.   num=$1     # get number from command line argument
 4.   sum=0     # initialize sum to zero
 5.
 6.   while [ $num -gt   0 ]; do
 7.       digit=$((num   % 10))    # get the last digit
 8.       sum=$((sum +   digit))   # add the digit to the sum
 9.       num=$((num /   10))      # remove the last digit
10.   done
11.
12.   echo "The sum of digits in $1 is: $sum"
13.





23. Write a shell script to input a multi-digit number and print whether the
    number is special number or not. A number is said to be a special number
    if the sum of the factorial of the digits of the number is same as the
    original number. 145 is a special number as 1! + 4! + 5! =1 + 24 + 120 =
    145.
       Answer:
         Shell Script
 1.   #!/bin/bash
 2.
 3.   echo "Enter a multi-digit number:"
 4.   read n
 5.
 6.   temp=$n
 7.   sum=0
 8.
 9.   while [ $temp -gt 0 ]
10.   do
11.       digit=$((temp%10))
12.       fact=1
13.       for (( i=1; i<=digit; i++ ))
14.       do
15.           fact=$((fact*i))
16.       done
17.       sum=$((sum+fact))
18.       temp=$((temp/10))
19.   done

20.
21.   if [ $n -eq $sum ]
22.   then
23.       echo "$n is a special number."
24.   else
25.       echo "$n is not a special number."
26.   fi
27.




24. Write a shell script to check whether a number is duck number or not. A
    number is said to be duck if the digit 0(zero) is present in it.
      Answer:
        Shell Script
 1.   #!/bin/bash
 2.
 3.   read -p "Enter a number: " number
 4.
 5.   if [[ "${number:0:1}" != "0" ]] && [[ "${number}" =~ "0" ]]; then
 6.     echo "${number} is a duck number"
 7.   else
 8.     echo "${number} is not a duck number"
 9.   fi
10.
