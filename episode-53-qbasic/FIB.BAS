DECLARE FUNCTION FIB! (N!)
CLS
FOR N = 1 TO 10
  PRINT "FIB(" + STR$(N) + ")=" + STR$(FIB(N))
NEXT N

FUNCTION FIB (N)
  IF N <= 2 THEN
    FIB = 1
  ELSE
    FIB = FIB(N - 1) + FIB(N - 2)
  END IF
END FUNCTION
