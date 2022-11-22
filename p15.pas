(* Problem 15
 * Starting in the top left corner of a 2×2 grid, and only being able to move
 * to the right and down, there are exactly 6 routes to the bottom right corner.
 * How many such routes are there through a 20×20 grid?
*)

(* Solution *)

program p15;

const n = 20;
   
var  
   i   : integer;
   j   : integer;
   ans : qword;
   a   : array [0..n, 0..n] of qword;
begin
   for i := 0 to n do begin
      a[i][0] := 1;
      a[0][i] := 1;
   end;
   
   for i := 1 to n do
      for j := 1 to n do
         a[i][j] := a[i-1][j] + a[i][j-1];
   ans := a[n][n];
   writeln('Answer is: ', ans);
end.




