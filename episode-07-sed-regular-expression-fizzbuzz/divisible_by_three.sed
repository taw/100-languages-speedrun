#!/usr/bin/sed -Ef

# Replace numbers by their reminder by 3
s/[369]/0/g
s/[47]/1/g
s/[58]/2/g

# Add pairs of digits, taking only remainder by 3
# Each line reduces number of digits by at least half
# so every number up to 1024 digits works
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g
s/00|12|21/0/g; s/01|10|22/1/g; s/02|20|11/2/g

# Do the final substitution
s/^0$/Divisible by 3/
s/^[12]$/Not divisible by 3/
