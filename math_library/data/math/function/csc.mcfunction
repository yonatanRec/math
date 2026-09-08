#math:csc

# minecraft secant function
# definition: csc(x) = 1/cos(x)


$function math:cos {in:$(in), out:"mathlib:sec in"}
$data modify storage mathlib:sec out set value "$(out)"
return run function math:reciprocal with storage mathlib:sec