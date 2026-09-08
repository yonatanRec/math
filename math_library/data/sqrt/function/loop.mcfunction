#sqrt:loop

data modify storage mathlib:sqrt info.guesses append from storage mathlib:sqrt guess
# the input is in storage mathlib:sqrt as such:
# mathlib:sqrt {guess - current suspected guess, x - the original number, eps: the wanted precision}


### loop:
# for every iteration, we need to do this:
# new_guess = ( guess + (n/guess) )/ 2
# and stop when abs(new_guess - guess) < eps*max(1, abs(new_guess))

# first calculation - x/guess
data modify storage mathlib:temp a set from storage mathlib:sqrt x
data modify storage mathlib:temp b set from storage mathlib:sqrt guess
data modify storage mathlib:temp out set value "mathlib:temp b"
function math:division with storage mathlib:temp
data modify storage mathlib:sqrt info.div append from storage mathlib:temp b
# we now have x/guess,
# so we need to add the current guess to it
data modify storage mathlib:temp a set from storage mathlib:sqrt guess
data modify storage mathlib:temp out set value "mathlib:temp a"
function math:addition with storage mathlib:temp
data modify storage mathlib:sqrt info.add append from storage mathlib:temp a
# now we have guess + x/guess
# so we need to divide it by 2
data modify storage mathlib:temp b set value 0.5
data modify storage mathlib:temp out set value "mathlib:sqrt new_guess"
function math:multiplication with storage mathlib:temp
data modify storage mathlib:sqrt info.half append from storage mathlib:sqrt new_guess
# now we have the new guess saved in mathlib:sqrt new_guess
# so we need to check if we reached enough precision OR we iterated too many times
execute if score #loop_iter count >= #sqrt_max_loop count run return 0
scoreboard players add #loop_iter count 1

# now for checking precision... we need to do a lot of checking
# abs(new_guess - guess) < eps*max(1,abs(new_guess))
data remove storage mathlib:sqrt temp
function sqrt:check

# now if the check is true, end the loop
# else, continue the loop
execute if score #sqrt_condition temp matches 1 run return 1

# now the only thing left is to continue the loop, so we need to replace guess with new_guess
# guess:
data modify storage mathlib:sqrt guess set from storage mathlib:sqrt new_guess
#return fail
# x has not been changed
# and so has epsilon
return run function sqrt:loop