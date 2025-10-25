#!/bin/bash

# count=5

# echo "Countdown starts...."

# while [ $count -gt 0 ];
# do
#     echo "Time left: $count"
#     count=$(($count-1))
# done

# echo "Times up!"

while IFS= read -r line; 
 do
  # Process each line here
  echo "Line read: $line"
  # You can perform other operations with the '$line' variable
  # For example:
  # echo "Length of line: ${#line}"
  # Some_command "$line"
done < 03-variables.sh