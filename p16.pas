(* Problem 16
 * 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 * 
 * What is the sum of the digits of the number 21000?
*)

(* Solution *)

program p16;

uses math, strutils;

const n = 1000;

type IntegerArray = record data   : array of Integer;
                           length : integer;
                    end;
                       
procedure print_array(arr : IntegerArray);
var
   i : integer;
begin
   for i := arr.length - 1 downto 0 do
      write(arr.data[i]);
end;

function multiply(arr : IntegerArray; x : integer) : integer;
var
   i     : integer;
   prod  : integer;
   carry : integer;
begin
   i := 0; carry := 0;
   for i := 0 to arr.length - 1 do begin
      prod := arr.data[i] * x + carry;
      arr.data[i] := prod mod 10;
      carry := prod div 10;
   end;

   while (carry > 0) do begin
      arr.data[arr.length] := carry mod 10;
      carry := carry div 10;
      arr.length += 1;
   end;
   
   exit(arr.length);
end;

function to_array(x : integer) : IntegerArray;
var
   arr  : IntegerArray;
   val     : integer;
begin
   setlength(arr.data, n);
   arr.length := 0; val := x;
   while (val <> 0) do begin
      arr.data[arr.length] := val mod 10;
      arr.length := arr.length + 1;
      val := val div 10;
   end;
   
   exit(arr);
end;

function power_digit_sum(x : integer; k: integer) : integer;
var
   i   : integer;
   arr : IntegerArray;
   sum : longint = 0;
begin
   if k = 0 then exit(1);

   arr := to_array(x);
   for i := 2 to k do arr.length := multiply(arr, x);
   for i := 0 to arr.length do sum += arr.data[i];
   
   exit(sum);
end;

begin
   write('Answer is: ', power_digit_sum(2, 1000));
end.
