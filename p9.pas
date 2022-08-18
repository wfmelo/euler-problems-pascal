(* Problem 09
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 * a^2 + b^2 = c^    2
 * 
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.
 * 
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
*)

(* Solution *)

program p9;

uses math;

const n = 1000;

var
   a        : integer;
   b        : integer;
   c        : integer;
   hasFound : boolean;
begin
   hasFound := false;
   for a := 1 to n do begin
      for b := 1 to n do begin
         if (a + b + sqrt(a*a + b*b) = n) then hasFound := true;
         if hasFound then break;
      end;
      if hasFound then break;
   end;
   c := 1000 - a - b;
   
   writeln('Answer is: ', a * b * c);
end.
