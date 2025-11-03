(* Problem 17
 * If the numbers 1 to 5 are written out in words: one, two, three, four, five,
 * then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 * 
 * If all the numbers from 1 to 1000 (one thousand) inclusive were written out
 * in words, how many letters would be used?
 * 
 * NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
 * forty-two) contains 23 letters and 115 (one hundred and fifteen) contains
 * 20 letters. The use of "and" when writing out numbers is in compliance
 * with British usage.
*)

(* Solution *)

program p17;

uses fgl, SysUtils;

type
  TNumbers = (one, two, three, four, five, six, seven, eight, nine,
              ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen,
              seventeen, eighteen, nineteen, twenty, thirty, forty, fifty,
              sixty, seventy, eighty, ninety, hundred, thousand);

const
  NumberValues: array[TNumbers] of Integer = (
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16,
    17, 18, 19, 20, 30, 40, 50,
    60, 70, 80, 90, 100, 1000
  );


type
   TMap = specialize TFPGMap<Integer, Integer>;

type
   TMapS = specialize TFPGMap<Integer, String>;

var
   i     : Integer;
   res   : Integer;
   map   : TMap;
   map_s : TmapS;
   s     : String;
   n     : TNumbers;
   val   : Integer;
begin
   map := Tmap.Create();
   map_s := TmapS.Create();
   
   for n := low(TNumbers) to high(TNumbers) do
   begin
      str(n, s);
      writeln(ord(n):2, ' -> ', NumberValues[n]:4, ' -> ', s:9, ' -> ', length(s));
      { map.Add(NumberValues[n], length(s)); }
      map_s.Add(NumberValues[n], s);
   end;

   writeln('----------------------------------------------');
   
   res := 0;
   for i := 1 to 1000 do
   begin
      s := '';
      write('i -> ', i, '; ');
      val := i div 1000;
      if val <> 0 then
      begin
         res += length(map_s[val]) + length(map_s[1000]);
         s += map_s[val] + ' ' + map_s[1000];
      end;

      val := i div 100;
      if (val <> 0) and (val < 10) then
      begin
         res += length(map_s[val]) + length(map_s[100]);
         s += map_s[val] + ' ' + map_s[100];
         
         if (i mod 100 div 10 * 10 <> 0) or (i mod 10 <> 0) then
         begin
            res += 3;
            s += ' and ';
         end;
      end;

      val := i mod 100 div 10 * 10;
      if val <> 0 then
      begin
         if (i mod 100 > 10) and (i mod 100 < 20) then
            val := i mod 100;
         
         res += length(map_s[val]);
         s += map_s[val] + ' ';
      end;

      if (i mod 10 <> 0) and ((val >= 20) or (val < 10)) then
      begin
         val := i mod 10;
         res += length(map_s[val]);
         s += map_s[val];
      end;

      writeln(' -> ',  s);
   end;
   
   writeln('Answer is: ', res); // answer is 21124
   
   map.free();
   map_s.free();
end.

one two three four five six seven eight nine ten
eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty

twenty
thirty
fourty
fifty
sixty
seventy
eighty
ninity
one hundred
