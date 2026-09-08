#gcd:integers/loop

# Loop function for Euclidean algorithm to calculate GCD of integers
# Uses scoreboards to store intermediate values of a and b
# If b is 0, return a as the GCD
# Otherwise, set a to b and b to a mod b, then repeat the loop

# Check if b is 0
execute if score #gcd_b calc matches 0 run return run scoreboard players get #gcd_a calc

# If b is not 0, calculate a mod b and update scoreboards
scoreboard players operation #gcd_mod calc = #gcd_a calc
scoreboard players operation #gcd_mod calc %= #gcd_b calc
scoreboard players operation #gcd_a calc = #gcd_b calc
scoreboard players operation #gcd_b calc = #gcd_mod calc
return run function gcd:integers/loop