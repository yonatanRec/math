# the number is the equivalent of allowing all numbers up to 2^#pow_integer_depth, which is more than enough for most purposes
# current value of 15 allows for numbers up to 32768, which is more than enough for most purposes and keeps the calculations manageable
scoreboard players set #pow_integer_depth count 15


scoreboard players set #pow_fraction_depth count 15