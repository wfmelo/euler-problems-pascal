(* Problem 03
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * What is the largest prime factor of the number 600851475143 ?
*)

(* Solution *)

program p3;

var
   n   : qword   = 600851475143;
   p   : integer = 2;
   max : integer = 1;
begin
   while n > 1 do
   begin
      if n mod p = 0 then
      begin
         n   := n div p;
         max := p;
      end
      else
         p += 1;
   end;
   writeln('Answer is: ', max);
end.
