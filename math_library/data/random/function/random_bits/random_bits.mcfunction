# random/random_bits:random_bits
# returns a random number with k random bits
### Input: 
# k - the number of bits to generate
### Output:



# using this algorithm:
# function random_bits(k):
#     result = 0
#     remaining = k

#     while remaining >= 30:
#         x = random(0, 2147483646)

#         while x >= 1073741824:
#             x = random(0, 2147483646)

#         result = result * 1073741824 + x
#         remaining = remaining - 30

#     if remaining > 0:
#         limit = 2^remaining
#         x = random(0, 2147483646)

#         while x >= floor(2147483647 / limit) * limit:
#             x = random(0, 2147483646)

#         x = x mod limit

#         result = result * limit + x

#     return result



data modify storage mathlib:random random_bits.result set value 0
$data modify storage mathlib:random random_bits.remaining set value $(k)