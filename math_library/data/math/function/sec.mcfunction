#math:sec

# minecraft secant function
# definition: sec(x) = 1/sin(x)


$function math:sin {in:$(in), out:"mathlib:csc in"}
$data modify storage mathlib:csc out set value "$(out)"
return run function math:reciprocal with storage mathlib:csc