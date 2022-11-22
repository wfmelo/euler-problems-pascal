(* Problem 14
 * The following iterative sequence is defined for the set of positive integers:
 * 
 * n ¡ú n/2 (n is even)
 * n ¡ú 3n + 1 (n is odd)
 * 
 * Using the rule above and starting with 13, we generate the following sequence:
 * 13 ¡ú 40 ¡ú 20 ¡ú 10 ¡ú 5 ¡ú 16 ¡ú 8 ¡ú 4 ¡ú 2 ¡ú 1
 * 
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains
 * 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
 * that all starting numbers finish at 1.
 * 
 * Which starting number, under one million, produces the longest chain?
 * 
 * NOTE: Once the chain starts the terms are allowed to go above one million.
*)

(* Solution *)

program p14;

const n = 1000000;

var
   val : qword;
   max : qword;
   t   : qword;
   i   : longint;
   ans : longint;
begin
   max := 0; ans := 0;
   for i := 1 to n do
   begin
      val := i; t := 0;
      while (val <> 1) do
      begin
         t += 1;
         if val mod 2 = 0 then begin
            val := val div 2;
         end
         else begin
            val := 3 * val + 1;
         end;
      end;
      if (t >= max) then begin max := t; ans := i; end;
   end;
   writeln('Answer is: ', ans);
end.
