#math:reciprocal

### Input
# in: any number

### Output
# out: storage location for result



# reciprocal using matrix transformations
# All credit goes to gibbsly for the original implementation, which can be found here:
# https://github.com/gibbsly/gm/blob/main/data/gm/function/reciprocal.mcfunction

$data modify entity 91bb5-0-0-0-ffff transformation set value [1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,$(in)f]
$data modify storage $(out) set from entity 91bb5-0-0-0-ffff transformation.scale[0]