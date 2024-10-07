#!/bin/bash
echo "You've opened a simple password generator"
echo "Please enter length of the required password"
read PASS_LENGTH

for i in {1..10};
do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${PASS_LENGTH} | head -n 1);
done

# Print the strings
printf "$pass_output\n" > pw_list.txt &
printf "\n"
printf "END\n"

bash