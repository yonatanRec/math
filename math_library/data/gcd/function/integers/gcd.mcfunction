#gcd:integers/gcd
# Greatest common divisor function for integers
### Input: a, b (any integers)

# store inputs in scoreboard for calculation
# then call the loop function for euclidean algorithm

$scoreboard players set #gcd_a calc $(a)
$scoreboard players set #gcd_b calc $(b)

return run function gcd:integers/loop