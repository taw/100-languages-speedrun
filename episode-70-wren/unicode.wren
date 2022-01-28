#!/usr/bin/env wren_cli

var name = "Alice"
System.print("Hello, %(name)")

System.print("Lengths are codePoints by default:")
System.print("Żółw".count)
System.print("🍰".count)

var s = "Żółw"
System.print("Bytes vs codePoints counts:")
System.print("%(s) - %(s.bytes.count) bytes")
System.print("%(s) - %(s.codePoints.count) code points")

for (i in 0..6) {
  System.print("s[%(i)] = %(s[i])")
  System.print("s[%(i)] byte = %(s.bytes[i])")
  System.print("s[%(i)] code point = %(s.codePoints[i])")
}
