       PROGRAM DOUBLING
 10    FORMAT(7HDOUBLE(, I3, 2H)=, I4)
       DO 20 I = 1, 20
       J = DOUBLE(I)
 20    PRINT 10, I, J
       END

       FUNCTION DOUBLE(I)
       DOUBLE=I*2
       END
