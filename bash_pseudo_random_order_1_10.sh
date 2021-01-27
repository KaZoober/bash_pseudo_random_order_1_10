#!/bin/bash
################################################################################
#                              bash_pseudo_random_order_1_10                   #
#                                                                              #
# This script generates a pseudo random sequence of numbers from 1 to 10       #
# because this is the way                                                      #
#                                                                              #
# Change History                                                               #
# 27/01/2021  Denis Spirin  Original code.                                     #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (C) 2021, 2021 Denis Spirin                                         #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 3 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #
#                                                                              #
################################################################################
################################################################################
################################################################################

# Knuth-Fisher-Yates shuffle
# Feel free to reuse it
shuffle() {
   local i tmp size max rand

   # $RANDOM % (i+1) is biased because of the limited range of $RANDOM
   # Compensate by using a range which is a multiple of the array size.
   size=${#array[*]}
   max=$(( 32768 / size * size ))

   for ((i=size-1; i>0; i--)); do
      while (( (rand=$RANDOM) >= max )); do :; done
      rand=$(( rand % (i+1) ))
      tmp=${array[i]} array[i]=${array[rand]} array[rand]=$tmp
   done
}

# array is to be shuffled. Change input for differen result 
array=('1' '2' '3' '4' '5' '6' '7' '8' '9' '10')
# This is where the shuffling happens
shuffle
# Printing the output. Very important! Do not delete
printf "%s\n" "${array[@]}"
