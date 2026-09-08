#math:lcm
# Least common multiple function
### Input: a, b (integers only)
# lcm(a, b) = abs(a * b) / gcd(a, b)

# Calculate gcd of a and b using the gcd function
$execute store result score #gcd_result calc run function math:gcd {a: $(a), b: $(b)}

$scoreboard players set #lcm_a calc $(a)
$scoreboard players set #lcm_b calc $(b)

# Calculate lcm using the formula: lcm(a, b) = abs(a * b) / gcd(a, b)
scoreboard players operation #lcm_result calc = #lcm_a calc
scoreboard players operation #lcm_result calc *= #lcm_b calc
execute if score #lcm_result calc matches ..-1 run scoreboard players operation #lcm_result calc *= minus_1 custom_value
scoreboard players operation #lcm_result calc /= #gcd_result calc
return run scoreboard players get #lcm_result calc