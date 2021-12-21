       PROGRAM FIZZBUZZ
       DO 40 I = 1, 20
 10    IF (MOD(I,15).NE.0) GOTO 20
       PRINT *, 8HFIZZBUZZ
       CONTINUE
 20    IF (MOD(I,5).NE.0) GOTO 30
       PRINT *, 4HBUZZ
       CONTINUE
 30    IF (MOD(I,3).NE.0) GOTO 40
       PRINT *, 4HFIZZ
       CONTINUE
 40    PRINT *, I
       END
