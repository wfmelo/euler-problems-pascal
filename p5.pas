(* Problem 05
 * 2520 is the smallest number that can be divided by each of the numbers from 1 to 10
 * without any remainder.
 * What is the smallest positive number that is evenly divisible by all of the numbers
 * from 1 to 20?
*)

(* Solution *)

program p5;

const n = 20;

function DetermineGcd (a : qword; b : integer) : integer;
var
   t :  integer;
begin
   while (a > 0) do begin
      if (a < b) then begin t := a; a := b; b := t; end;
      a := a mod b;
   end;
   DetermineGcd := b;
end;

var
   i   : integer;
   gcd : integer;
   lcm : qword = 1;
begin
   for i := 1 to n - 1 do begin
      gcd := DetermineGcd(lcm, i + 1);
      lcm := (lcm * (i + 1)) div gcd;
   end;
   writeln('Answer is: ', lcm);
end.
