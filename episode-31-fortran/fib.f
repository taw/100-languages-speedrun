       PROGRAM FIBONACCI
 10    FORMAT(4HFIB(, I3, 2H)=, I10)
       DO 20 I = 1, 20
       J = FIB(I)
 20    PRINT 10, I, J
       END

       RECURSIVE FUNCTION FIB(I) RESULT(A)
       IF (I-2) 30,30,40
 30    A=1
       RETURN
 40    A=FIB(I-1)+FIB(I-2)
       END
