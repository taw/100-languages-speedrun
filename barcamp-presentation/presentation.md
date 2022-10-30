# 100 Languages Speedrun

## by Tomasz Węgrzanowski

---

## S Tier

### Great first choice across many domains.

* Python
* Ruby

You're doing yourself a great disservice if you don't know one of them, and preferably both.

---

## A Tier

### Very solid choice for its domain.

* Crystal
* JQ
* Kotlin
* Rake
* SQLite

There are more narrow, but they're so far ahead of competition in their domain, you should use them if applicable.

---

## B Tier

.fx: two-columns

### Solid second choice languages, or first choice for a small niche.

* ANTLR
* Clojure
* CSVQ
* Elixir
* Groovy
* Julia
* PowerShell
* Racket
* Ruby Z3
* SageMath
* SLY
* Verilog

These are very good at what they're doing, but it's a somewhat narrow thing. Or you can use them if for some reason a higher tier language wouldn't quite work for you.

---

## C Tier

.fx: two-columns

### I wouldn't really recommend, but it's not crazy.

* D
* Gherkin
* Octave
* Perl
* R
* Raku
* Scala
* XQuery
* YueScript

I can definitely see why you'd use them, and it's not completely wrong, but I'd generally recommend checking some higher-tier language, they might be a better fit for what you're doing.

---

## D Tier

### Don't use in production yet. Experimental languages showing serious promise.

* Elvish
* Raku Grammars
* Wren
* Xonsh

These are not production ready. But they're promising, and they could be really great in a few years. Or if you're willing to suffer all early adopter problems.

---

## E Tier

.fx: two-columns

### Enjoy a weekend with them, then move on.

* Brat
* Coconut
* Factor
* Forth
* Haskell
* Io
* Ioke
* Logo
* Prolog
* Smalltalk

These are very interesting languages, which I definitely wouldn't recommend for any real programming, but I'd absolutely recommend for giving them a try, to expand your horizons.

---

## F Tier

.fx: two-columns

### Fun esoteric language, but definitely don't use for anything real.

* Asciidots
* Assembly
* Befunge
* ChucK
* CSS
* Emojicode
* Lingua Romana Perligata
* POV-Ray
* Thue
* WebGL
* Whenever

These aren't meant for any kind of real programming, but they're fun!

---

## K Tier

### Kids who don't speak English.

* Ezhil
* Langage Linotte
* Linguagem Potigol

If you need to teach some kids programming, and those kids just so happen to only speak a specific non-English language, and if you also believe that them not knowing English is the main barrier to learning programming, then these are a valid option. I don't really believe that, but hey, maybe you do. Of these Linguagem Potigol was by far the best. I checked a lot of other non-English programming languages, but none were really doing anything new.

---

## O Tier

.fx: two-columns

### Maybe it was fine once, but it's completely obsoleted by other languages.

* Awk
* BC
* Emacs Lisp
* Erlang
* Fortran
* Java
* Lua
* MoonScript
* OCaml
* Pascal
* PLY
* Rexx
* Sed
* TeX
* Tcl/Tk
* Windows Batch Files

Once upon a time, these languages were fine. Maybe even good. Using them in 2022 is a really poor idea, with much better alternatives available.

---

## R Tier

### Languages for Robots. Never meant for humans in the first place.

* JVM Assembly
* LLVM IR
* Postscript

These were never meant for humans, and to be honest they're not even that great for expanding your horizons.

---

## T Tier

.fx: two-columns

### Trash, and It was always trash.

* Ada
* AppleScript
* Arc
* Arturo
* COBOL
* Go
* Janet
* M4
* newLISP
* PHP
* Pyret
* QBasic
* Quackery
* Sidef
* Tcsh
* XSLT

Total trash. They were always trash. No redeemigng qualities whatsoever.

---

## 01 Python

    !python
    def override(value, condition):
      def decorator(func):
        def wrapper(*args, **kwargs):
          if condition(*args, **kwargs):
            return value
          else:
            return func(*args, **kwargs)
        return wrapper
      return decorator

    @override("FizzBuzz", lambda i: i%15 == 0)
    @override("Buzz", lambda i: i%5 == 0)
    @override("Fizz", lambda i: i%3 == 0)
    def fizzbuzz(i):
      return str(i)

    for i in range(1,101):
      print(fizzbuzz(i))

---

## 02 Emojicode


    🏁 🍇
      🔂 i 🆕⏩ 1 101 1 ❗ 🍇
        ↪️ i 🚮 15 🙌 0 🍇
          😀 🔤𝔽𝕚𝕫𝕫𝔹𝕦𝕫𝕫🔤 ❗
        🍉
        🙅↪️ i 🚮 3 🙌 0 🍇
          😀 🔤𝔽𝕚𝕫𝕫🔤 ❗
        🍉
        🙅↪️ i 🚮 5 🙌 0 🍇
          😀 🔤𝔹𝕦𝕫𝕫🔤 ❗
        🍉🙅🍇
          😀 🔤🧲i🧲🔤 ❗
        🍉
      🍉
    🍉

---

## 03 CSS

    !css
    span {
      counter-increment: fizzbuzz-counter;
    }
    span::after { content: ", "; }
    span:last-child::after { content: "."; }
    span::before {
      content: counter(fizzbuzz-counter);
    }
    span:nth-child(3n)::before {
      content: "Fizz";
    }
    span:nth-child(5n)::before {
      content: "Buzz";
    }
    span:nth-child(15n)::before {
      content: "FizzBuzz";
    }

---

## 07 Sed and Regexp FizzBuzz

    !perl
    #!/usr/bin/sed -Ef

    s/^(([0369]*[147]([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|[0369]*[258])(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|([147][0369]*[258]|[0369]?))*(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*[258][0369]*|[147][0369]*)|([0369]*[147]([258][0369]*[147]|[0369])*[258][0369]*|[0369]*))0$/FizzBuzz/
    s/^(([0369]*[147]([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|[0369]*[258])(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|([147][0369]*[258]|[0369]?))*(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*([258][0369]*[147]|[0369]?)|([147][0369]*[147]|[258]))|([0369]*[147]([258][0369]*[147]|[0369])*([258][0369]*[147]|[0369]?)|[0369]*[147]))5$/FizzBuzz/
    s/^.*[05]$/Buzz/
    s/^(([0369]*[147]([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|[0369]*[258])(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|([147][0369]*[258]|[0369]?))*(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*[258][0369]*|[147][0369]*)|([0369]*[147]([258][0369]*[147]|[0369])*[258][0369]*|[0369]*))$/Fizz/

---

## 08 Reverse Polish Notation Calculator

    !ruby
    class RPNTokenizer
      def call(string)
        tokens = []
        until string.empty?
          if string =~ /\A\s+/
            string = string[$&.size..-1]
          elsif string =~ /\A-?\d+(?:\.\d*)?/
            tokens << { type: "number", value: $&.to_f }
            string = string[$&.size..-1]
          elsif string =~ /\A[\+\-\*\/]|in|out/
            tokens << { type: $& }
            string = string[$&.size..-1]
          else
            raise "Invalid character #{string[0]}"
          end
        end
        tokens
      end
    end

---

## 10 Befunge

    98*     :, 93*+2+ :,v
    v,:        ,:     +7<
    >3+     :, 97*-4- :,v
    v,: +1+*69 ,:   -3-9<
    >83*+   :, 3+     :,v
    v,:     -8 ,:     -6<
    >93*6+  ,  91+     ,@

---

## 19 Julia

    !julia
    u = [1 1]
    m = [1 1; 1 0]

    for i=1:40
      result = (u * (m ^ (i-1)))[2]
      println("fib($i) = $result")
    end

---

## 22 XSLT

    !xml
    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
      <xsl:output method="text"/>
      <xsl:template match="/fizzbuzz"><xsl:apply-templates select="number"/></xsl:template>
      <xsl:template match="number">
        <xsl:variable name="i" select="." />
        <xsl:choose>
          <xsl:when test="$i mod 15 = 0">FizzBuzz</xsl:when>
          <xsl:when test="$i mod 3 = 0">Fizz</xsl:when>
          <xsl:when test="$i mod 5 = 0">Buzz</xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$i" />
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&#10;</xsl:text>
      </xsl:template>
    </xsl:stylesheet>

---

## 27 Whenveer

    1 2#-1,3#-1,4#-1,5#-1,6#-1,7#-1,8#-1,9#-1;
    2 2;
    3 3;
    4 4;
    5 defer(1 || (N(6) + N(7) + N(8) + N(9)) != 3) 6#-N(6),7#-N(7),8#-N(8),9#-N(9);
    6 defer(1 || N(3) == 0 || N(4) == 0) print(N(2));
    7 defer(1 || 3 || N(4) == 0) print("Fizz");
    8 defer(1 || N(3) == 0 || 4) print("Buzz");
    9 defer(1 || 3 || 4) print("FizzBuzz");
    10 defer(1 || 5 || N(2) >= 100) 2,3,-3#((N(3)/3)*3),4,-4#((N(4)/5)*5),5,6,7,8,9,10;
    11 defer(1 || 5 || N(2) < 100) -2#N(2),-3#N(3),-4#N(4),-10#N(10);

---

## 39 SQLite

    !sql
    with recursive generate_series(value) as (
      select 1
      union all select value+1
      from generate_series
      where value + 1 <= 100
    )
    select
      case
        when value % 15 = 0 then 'FizzBuzz'
        when value % 5 = 0 then 'Buzz'
        when value % 3 = 0 then 'Fizz'
        else value
      end
    from generate_series;

---

## 43 Thue

    ^roll::=^ROLL
    ^,::=^COMMA
    ^$::=~
    ROLL::=~1
    ROLL::=~2
    ROLL::=~3
    ROLL::=~4
    ROLL::=~5
    ROLL::=~6
    COMMA::=~,
    ::=
    ^roll,roll,roll$

---

### RISC-V Assembly

    .text
    .global _start
    _start:
      /* Tell the operating system to write "Hello, World!\n" to stdout */
      li a7, 64
      li a0, 1       /* standard output */
      lla a1, hello  /* address of thing to write */
      li a2, 14      /* amount of data to write */
      ecall

      /* Tell the operating system to exit with code 0 */
      li a7, 93
      li a0, 0
      ecall

    .data
    hello:
      .ascii "Hello World!\n"

---

## 49 Crystal

    !ruby
    def add(a, b)
      puts "#{a} + #{b} = #{a + b}"
    end

    add 400, 20
    add 6, 0.9
    add "foo", "bar"

---

## 50 COBOL

    !cobol
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

---

## 53 QBasic

    !basic
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

---

## 54 Haskell

    !haskell
    import Data.List
    import Data.Bool
    import Control.Monad

    divBy :: Int -> Int -> Bool
    divBy = ((0 ==) .) . flip mod

    fizz :: Int -> String
    fizz = liftM3 bool show (const "Fizz") $ divBy 3

    buzz :: Int -> String
    buzz = liftM3 bool fizz (const "Buzz") $ divBy 5

    fizzbuzz :: Int -> String
    fizzbuzz = liftM3 bool buzz (const "FizzBuzz") $ divBy 15

    fizzBuzzLoop :: Int -> String
    fizzBuzzLoop =
      intercalate "\n" . map fizzbuzz . flip take [1..]

    main =
      putStrLn $ fizzBuzzLoop 100

---

## 60 AsciiDots

                               /-$"Fizz"
                        /------~-$"FizzBuzz"
                    /---*--{%}-/
                    | .-#5-(*)
                    |          /-$#
            /-----\ |   /------~-$"Buzz"
      .-#0-->-{+}-*-~---*--{%}-/
         .-#1-(*)   | .-#5-(*)
                    |
           >->---->-/
    .->-#0-*-*-#1-*
      \-----------/

---

## 85 Linguagem Potigol

    verifique(acho : Texto, palavra : Texto)
      var blocos = ""
      para número de 1 até 5 faça
        se acho[número] == palavra[número]
          blocos := blocos + "🟩"
        senãose palavra.contem(acho[número])
          blocos := blocos + "🟨"
        senão
          blocos := blocos + "⬛"
        fim
      fim
      escreva blocos
    fim

---

### 90 YueScript

    class Wordle
      new: =>
        @words = readlines("wordle-answers-alphabetical.txt")
      report: (word, guess) =>
        for i = 1, 5
          letter = guess::sub(i,i)
          if word::sub(i,i) == letter
            io.write "🟩"
          elseif word::find(letter, 1, true)
            io.write "🟨"
          else
            io.write "🟥"
        io.write "\n"

---

## 94 Ezhil

    அ = 1
    செய்
      @( 0 == அ % 15 ) ஆனால்
        பதிப்பி "FizzBuzz"
      @( 0 == அ % 5 ) இல்லைஆனால்
        பதிப்பி "Buzz"
      @( 0 == அ % 3 ) இல்லைஆனால்
        பதிப்பி "Fizz"
      இல்லை
        பதிப்பி அ
      முடி
      அ = அ + 1
    முடியேனில் @(அ <= 100)

---

# 100 Languages Speedrun

## [dev.to/taw](https://dev.to/taw)

## Questions?

<style>
  img {
    /* max-width: 100%; */
    /* max-height: 100%; */
    max-height: 500px;
  }
  pre {
    white-space: pre-wrap;
  }
  .two-columns ul {
    column-count: 2;
  }
</style>
