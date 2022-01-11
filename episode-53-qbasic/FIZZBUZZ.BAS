CLS

FOR I = 1 TO 20
  IF I MOD 15 = 0 THEN
    PRINT "FizzBuzz"
  ELSEIF I MOD 5 = 0 THEN
    PRINT "Buzz"
  ELSEIF I MOD 3 = 0 THEN
    PRINT "Fizz"
  ELSE
    PRINT I
  END IF
NEXT I
