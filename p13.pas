(* Problem 13 
 * Work out the first ten digits of the sum of the following one-hundred
 * 50-digit numbers.
*)

(* Solution *)

program p13;

uses sysutils;

const
   C_FNAME = 'data/p13.txt';
   size    = 50;

var
   tfIn     : TextFile;
   line     : string;
   i        : integer;
   j        : integer;
   temp     : integer;
   result   : array of integer;
   lenl     : integer = size;
   lenr     : integer = size;
begin
   if not FileExists(C_FNAME) then exit;
   assign(tfIn, C_FNAME);
   reset(tfIn);

   setLength(result, lenr);
   while not eof(tfIn) do
   begin
      readln(tfIn, line);
      i := 0; j := 1;
      while (j <= lenl) and (i < lenr) do begin
         temp := result[i] + ord(line[lenl + 1 - j]) - ord('0');
         if temp >= 10 then begin
            result[i] := temp mod 10;
            if i + 1 = lenr then begin
               lenr := lenr + 1;
               setLength(result, lenr);
            end;
            result[i+1] := result[i+1] + 1;
         end
         else begin
            result[i] := temp;
         end;

         i := i + 1;
         j := j + 1;
      end;
   end;

   close(tfIn);

   write('Answer is: ');
   for j := lenr - 1 downto lenr - 9 do
      write(result[j]);
end.
