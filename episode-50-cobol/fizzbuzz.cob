       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 N PIC 9(3).
           01 M PIC 9(3).
           01 3REM PIC 9(1).
           01 5REM PIC 9(1).

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 100
             DIVIDE N BY 3 GIVING M REMAINDER 3REM
             DIVIDE N BY 5 GIVING M REMAINDER 5REM
             EVALUATE 3REM ALSO 5REM
               WHEN ZERO ALSO ZERO
                 DISPLAY 'FIZZBUZZ'
               WHEN ANY ALSO ZERO
                 DISPLAY 'BUZZ'
               WHEN ZERO ALSO ANY
                 DISPLAY 'FIZZ'
               WHEN OTHER
                 DISPLAY N
             END-EVALUATE
           END-PERFORM.
           STOP RUN.
