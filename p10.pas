(* Problem 10
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * 
 * Find the sum of all the primes below two million.
*)

(* Solution *)

program p10;
{$modeswitch result+}

uses math;

const n = 2000000;

type
   TPrime = record
       value : longint;
       state : boolean;
end;

var a: array [2..n] of TPrime;


procedure init_array();
var
   i : longint;
begin
   for i := 2 to n do
   begin
      a[i].value := i;
      a[i].state := true;
   end;
end;

function sum_of_primes() : qword;
var
   i : longint;
begin
   result := 0;
   for i := 2 to n do
      if (a[i].state) then
         result += a[i].value;
end;
    
var
   i   : longint;
   j   : qword;
   sum : qword;
begin
   init_array();
   for i := 2 to n do
      if (a[i].state) then
      begin
         j := round(power(i, 2));
         while (j <= n) do
         begin
            a[j].state := false;
            j += i;
         end;
      end;
   sum := sum_of_primes();
   
   writeln('Answer is: ', sum);
end.
