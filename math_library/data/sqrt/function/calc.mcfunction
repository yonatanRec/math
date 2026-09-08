#sqrt:calc

### Input:
# x: the number for calculating
# out: storage are for result
# eps - precision handler

# Equivalent to `√x`

### Output: 
# storing final value into `out`

scoreboard players set #sqrt_temp temp 0

### calculation:
# first, handle edge cases (x<0, x=0)
# x<0
$execute store result score #sqrt_temp temp run function math:smaller {a:$(x), b:0}
$execute if score #sqrt_temp temp matches 1 run function math:helper/error {message:"sqrt:calc: cannot calculate square root of negative number, input: $(x)"}
execute if score #sqrt_temp temp matches 1 run return fail


# x=0
$data modify storage mathlib:sqrt x set value $(x)
$execute if data storage mathlib:sqrt {x:0} run data modify storage $(out) set value 0
execute if data storage mathlib:sqrt {x:0} run return 0

$data modify storage mathlib:sqrt info.x set value $(x)
$data modify storage mathlib:sqrt info.out set value "$(out)"
$data modify storage mathlib:sqrt info.epsilon set value $(eps)
data modify storage mathlib:sqrt info.guesses set value []
data modify storage mathlib:sqrt info.div set value []
data modify storage mathlib:sqrt info.add set value []
data modify storage mathlib:sqrt info.half set value []
data modify storage mathlib:sqrt info.check set value []

#  before we call the loop function to calculate,
# we need to first make the initial guess, which is the max between 1 and x
$function math:max {a:1, b:$(x), out:"mathlib:sqrt guess"}

# now we need to prepare the other values to put inside the loop
$data modify storage mathlib:sqrt eps set value $(eps)

# and since this loop is in the sqrt function, there is no need to send the values directly, only using the storage math:sqrt
scoreboard players set #loop_iter count 1
function sqrt:loop

# now the final result is stored inside mathlib:sqrt guess, so we need to put guess inside $(out)
$data modify storage $(out) set from storage mathlib:sqrt guess