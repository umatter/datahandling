
# just some simple arithmetic with fractions
.1 + .1 + .1
# ok 0.3 seems to be the sum, let's verify
.1 + .1 + .1 == .3
# whoops! what is happening?
# print more digits 
result <- .1 + .1 + .1
format(result, digits = 20)

