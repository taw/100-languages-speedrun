import std.stdio;
import std.string;
import std.utf;

void main() {
  int[] arr1 = [1,2,3];
  int[] arr2 = [1,2,3];
  int[] arr3 = [4,5,6];
  string s1 = "hello";
  string s2 = "hello";
  string s3 = "Żółw";
  string s4 = "💩";

  writefln("Printing arrays: %s", arr1);
  writefln("Array equality: %s %s", arr1 == arr2, arr1 == arr3);
  writefln("String equality: %s %s", s1 == s2, s1 == s3);
  writefln("Unicode length: %s %s %s", s1.length, s3.length, s4.length);
  writefln("Unicode length: %s %s %s", std.utf.count(s1), std.utf.count(s3), std.utf.count(s4));
  writefln("Unicode upcase %s", toUpper(s3));
}
