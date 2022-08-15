(* Problem 04
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 * 
 * Find the largest palindrome made from the product of two 3-digit numbers.
*)

(* Solution *)

program p4;

uses math;

const n    = 2;
const base = 10;

function isPalindrome(n : qword) : boolean;
var
   k      : integer = 0;
   p      : qword   = 0;
   v      : qword   = 0;
begin
   p := n;
   k := floor(log10(n));
   while p > 0 do
   begin
      v := v + (p mod 10) * round(power(10, k));
      k := k - 1;
      p := p div 10;
   end;
   
   if (n = v) then isPalindrome := true else isPalindrome := false;
end;
   
var
   i      : integer;
   j      : integer;
   a      : integer = 0;
   b      : integer = 0;
   min    : integer;
   max    : integer;
   result : qword = 0;
begin
   max := round(power(base, n)) - 1;
   min := round(power(base, n - 1));
   i   := max;
   while (i > min) do
   begin
      j := max;
      while (j > min) do
      begin
         if (isPalindrome(i * j)) and (i * j > result) then
         begin
            result := i * j;
            a      := i;
            b      := j;
            break;
         end;
         j := j - 1;
      end;
      i := i - 1;
   end;
   writeln('Answer is: ', result, ' a: ', a, ' b:', b);
end.
