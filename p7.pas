(* Problem 07
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
 * that the 6th prime is 13.
 *
 * What is the 10 001st prime number?
*)

(* Solution *)

program p7;

const n = 10001;

function is_prime(v : longint) : boolean;
var
   i : longint;
begin
   is_prime := true;
   for i := 2 to v - 1 do
      if (v mod i = 0) then
      begin
         is_prime := false;
         break;
      end;
end;

var
   p : longint = 1;
   c : longint = 0;
begin
   while (c < n) do
   begin
      p := p + 1;
      if is_prime(p) then c := c + 1;
   end;
   writeln('Answer is: ', p);
end.
