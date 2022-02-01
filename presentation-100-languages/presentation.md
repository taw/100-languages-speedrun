# 100 Languages Speedrun

## by Tomasz Węgrzanowski

---

# 74 / 100 so far

Ada,
AppleScript,
Arc,
ARM64 Assembly,
Asciidots,
Awk,
BC,
Befunge,
Better Thue Interpreter in Crystal,
ChucK,
Clojure,
COBOL,
Crystal,
CSS,
CSVQ,
D,
Elvish,
Emojicode,
Factor,
Forth,
Fortran,
Free Pascal,
Gherkin,
Groovy,
Haskell,
Io,
Ioke,
JQ,
Julia,
Kotlin,
LLVM Intermediate Representation,
Logo,
Lua,
M4,
OCaml,
Octave,
Perl,
PHP,
PLY Python Lex-Yacc,
Postscript,
POV-Ray,
Prolog,
Python ANTLR 4,
Python,
QBasic,
R,
Racket Scheme,
Rake,
Raku (Perl 6),
Raku (Perl 6) Grammars,
Raku (Perl 6) Regular Expressions,
Randomized Finite Automaton for Fast Thue Interpreter in Crystal,
Recursive Descent Parser,
Reverse Polish Notation Calculator,
RISC-V Assembly,
Ruby Z3,
SageMath,
Scala,
Sed and Regular Expression FizzBuzz,
Smalltalk,
SQLite,
Tcl/Tk,
Tcsh,
TeX,
Thue,
Verilog,
WebGL Shader Language,
Whenever,
Windows Batch Files,
Wren,
x86-64 Assembly,
Xonsh,
XQuery,
XSLT.

---

# 7? Why not 100?

![7langs](slide-7langs.jpg)

---

# 01 Python

    !python
      def fizzbuzz(i):
        if i % 15 == 0:
          return "FizzBuzz"
        elif i % 3 == 0:
          return "Fizz"
        elif i % 5 == 0:
          return "Buzz"
        else:
          return str(i)

      for i in range(1,101):
        print(fizzbuzz(i))

---

# 01 Python

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

# 02 Emojicode


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

# 03 CSS

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

# 04 Lua

    !lua
    function inspect(value)
      if type(value) == "table" then
        local result = ""
        for k, v in pairs(value) do
          if result ~= "" then
            result = result .. ", "
          end
          result = result .. tostring(k) .. "=" .. inspect(v)
        end
        return "{" .. result .. "}"
      else
        return tostring(value)
      end
    end

---

# 05 Kotlin

## Should you use Java?

Normally I'd ask "should you use Kotlin", but that's looking at things backwards. The real question is "should you use Java" and the answer is clear and unambiguous NO! If you need to run something on JVM and interact with the "Java" ecosystem, you can do this without ever touching that miserable excuse for a language. Kotlin is to Java what ES6 was to old style JavaScript, but the improvement is much greater here. Old style JavaScript is dead, completely replaced by ES6+ JavaScript, and that's the fate that should befall Java as well.

There are other JVM languages like JRuby, Clojure, Scala, and so on, but they are essentially different languages, with different semantics, and with varied interoperability story. Kotlin is just Fixed Java, nothing more, nothing less.

So please don't use Java, ever.

---

# 06 Tlc/Tk

    !tcl
    set x 2
    set y "4"
    set z [expr $x+$y]
    puts [string toupper Hello]
    puts [string tolower "World"]
    puts "$x + $y = $z"
    puts {$x + $y = $z}
    puts stdout hello

---

# 07 Sed and Regexp FizzBuzz

    !perl
    #!/usr/bin/sed -Ef

    s/^(([0369]*[147]([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|[0369]*[258])(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|([147][0369]*[258]|[0369]?))*(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*[258][0369]*|[147][0369]*)|([0369]*[147]([258][0369]*[147]|[0369])*[258][0369]*|[0369]*))0$/FizzBuzz/
    s/^(([0369]*[147]([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|[0369]*[258])(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|([147][0369]*[258]|[0369]?))*(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*([258][0369]*[147]|[0369]?)|([147][0369]*[147]|[258]))|([0369]*[147]([258][0369]*[147]|[0369])*([258][0369]*[147]|[0369]?)|[0369]*[147]))5$/FizzBuzz/
    s/^.*[05]$/Buzz/
    s/^(([0369]*[147]([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|[0369]*[258])(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*([258][0369]*[258]|[147])|([147][0369]*[258]|[0369]?))*(([147][0369]*[147]|[258])([258][0369]*[147]|[0369])*[258][0369]*|[147][0369]*)|([0369]*[147]([258][0369]*[147]|[0369])*[258][0369]*|[0369]*))$/Fizz/

---

# 08 Reverse Polish Notation Calculator

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

# 10 Befunge

    98*     :, 93*+2+ :,v
    v,:        ,:     +7<
    >3+     :, 97*-4- :,v
    v,: +1+*69 ,:   -3-9<
    >83*+   :, 3+     :,v
    v,:     -8 ,:     -6<
    >93*6+  ,  91+     ,@

---

# 13 Arc

    !scheme
    (mac oddeven (v ifeven ifodd)
      `(if (even ,v) ,ifeven ,ifodd))

    (prn "Choose a number?")
    (let number (int (readline))
      (oddeven number
        (prn number " is even")
        (prn number " is odd")))

---

# 14 Recursive Descent Parser

    !ruby
    def parse_statement
      token = expect_token("read", "set", "print")
      case token[:type]
      when "read"
        token = expect_token("id")
        {type: "read", id: token[:value]}
      when "set"
        var_token = expect_token("id")
        expect_token("=")
        expr = parse_expression
        {type: "set", id: var_token[:value], expr: expr}
      when "print"
        token = expect_token("id")
        {type: "print", id: token[:value]}
      end
    end

---

# 17 Rake

    !ruby
    task :default => "hello.html"

    rule ".html" => ".md" do |t|
      sh "pandoc", t.source, "-o", t.name
    end

---

# 19 Julia

    !julia
    u = [1 1]
    m = [1 1; 1 0]

    for i=1:40
      result = (u * (m ^ (i-1)))[2]
      println("fib($i) = $result")
    end

---

# 22 XSLT

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

# 23 Ruby Z3

    !ruby
    sudoku = %w[
      _6_5_9_4_
      92_____76
      __1___9__
      7__6_3__9
      _________
      3__4_1__7
      __6___7__
      24_____65
      _9_1_8_3_
    ]
    solver = Z3::Solver.new
    vars = (0..8).map{|y|
      (0..8).map{|x| Z3.Int("cell[#{x},#{y}]") }
    }
    vars.flatten.each do |var|
      solver.assert var >= 1
      solver.assert var <= 9
    end

---

# 24 Postscript

    %!PS
    /Helvetica 14 selectfont

    /fizzbuzz {
      dup 15 mod 0 eq { pop (FizzBuzz) }
      { dup 5 mod 0 eq { pop (Buzz) }
        { dup 3 mod 0 eq { pop (Fizz) }
          { 20 string cvs } ifelse
        } ifelse } ifelse } def
    /fizzbuzzpage {
      /n exch def
      1 1 50 {
        dup 14 mul 780 exch sub
        50 exch moveto n add fizzbuzz show
      } for showpage } def
    0 fizzbuzzpage
    50 fizzbuzzpage

---

# 25 JQ

    $ curl -s 'https://cat-fact.herokuapp.com/facts' | jq '.[] | .text'
    "Cats make about 100 different sounds. Dogs make only about 10."
    "Domestic cats spend about 70 percent of the day sleeping and 15 percent of the day grooming."
    "I don't know anything about cats."
    "The technical term for a cat’s hairball is a bezoar."
    "Cats are the most popular pet in the United States: There are 88 million pet cats and 74 million dogs."


---

# 31 Fortran

    !fortran
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

---

# 39 SQLite

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

# 41 WebGL Shader Language

    !c++
    mediump vec2 pos = gl_FragCoord.xy / vec2(80, 80);
    mediump vec2 cell = floor(pos);
    mediump float px = fract(pos.x);
    mediump float py = fract(pos.y);
    int n = int(cell.x) + (9 - int(cell.y)) * 10 + 1;
    bool right_half = px > 0.5;
    int tens = n / 10;
    int ones = n - tens * 10;
    mediump float cx, cy;
    cx = gl_FragCoord.x / 800.0;
    if (divisible(n, 15)) { cx = 15.0; }
    else if (divisible(n, 5)) { cx = 13.0; }
    else if (divisible(n, 3)) { cx = 11.0; }
    else if (right_half) { cx = float(ones); }
    else if (tens == 0) { cx = float(tens); }
    else { cx = float(tens) + 1.0; }
    cy = 1.0-fract(pos.y);
    gl_FragColor = texture2D(sampler, vec2((cx + px*2.0)/17.0, cy));

---

# 43 Thue

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

# 49 Crystal

    !ruby
    def add(a, b)
      puts "#{a} + #{b} = #{a + b}"
    end

    add 400, 20
    add 6, 0.9
    add "foo", "bar"

---

# 50 COBOL

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

# 53 QBasic

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

# 60 AsciiDots

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

# 64 ChucK

    !c++
    Sitar sitar => dac;

    while(true) {
      Math.random2(60, 80) => float note;
      Std.mtof(note) => sitar.freq;
      Math.random2f(0.5, 0.1) => sitar.noteOn;

      <<<"Playing note", note>>>;
      0.2::second => now;
    }

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
</style>
