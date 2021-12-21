       PROGRAM FIBONACCI
 10    FORMAT(4HFIB(, I3, 2H)=, I10)
       DO 20 I = 1, 20
       J = FIB(I)
 20    PRINT 10, I, J
       END

       FUNCTION FIB(I)
       K1 = 0
       K2 = 1
       DO 30 J = 1, I
       K3 = K1 + K2
       K1 = K2
 30    K2 = K3
       FIB=K1
       END
