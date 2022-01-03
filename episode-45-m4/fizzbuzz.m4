define(`fizzbuzz',`ifelse(eval($1%15),0,`FizzBuzz
',eval($1%5),0,`Buzz
',eval($1%3),0,`Fizz
',`$1
')')dnl
define(`fizzbuzzloop',`ifelse(eval($1<=$2),1,`fizzbuzz($1)fizzbuzzloop(eval($1+1),$2)')')dnl
fizzbuzzloop(1,100)dnl
