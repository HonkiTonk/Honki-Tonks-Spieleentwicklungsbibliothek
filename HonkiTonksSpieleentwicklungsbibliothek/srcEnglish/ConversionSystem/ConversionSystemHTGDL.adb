with Ada.Strings.UTF_Encoding.Wide_Wide_Strings; use Ada.Strings.UTF_Encoding.Wide_Wide_Strings;

with Ada.Float_Text_IO;
with Ada.Strings.Wide_Wide_Fixed;

with ConversionVariablesHTGDL;

package body ConversionSystemHTGDL is
   
   function NumberString
     (NumberExtern : in WholeNumber)
      return Wide_Wide_String
   is
      use Ada.Strings.Wide_Wide_Fixed;
   begin
      
      if
        NumberExtern >= 0
      then
         return Trim (Source => NumberExtern'Wide_Wide_Image,
                      Side   => Ada.Strings.Left);
         
      else
         return NumberExtern'Wide_Wide_Image;
      end if;
      
   end NumberString;
   
   
   
      -- Due to the string length, this only works for values between -9_999_999_999,99 .. 9_999_999_999,99.
   function DecimalNumberString
     (DecimalNumberExtern : in DecimalNumber)
      return Wide_Wide_String
   is
      use Ada.Float_Text_IO;
      use Ada.Strings.Wide_Wide_Fixed;
   begin
      
      Put (To   => TemporaryStorageDecimalNumberString,
           Item => Float (DecimalNumberExtern),
           Aft  => 2,
           Exp  => 0);
      
      return Trim (Source => DecimalSeperator (NumberStringExtern => Decode (TextExtern => TemporaryStorageDecimalNumberString)),
                   Side   => Ada.Strings.Left);
      
   end DecimalNumberString;
   
   
   
   function DecimalSeperator
     (NumberStringExtern : in Wide_Wide_String)
      return Wide_Wide_String
   is begin
      
      case
        ConversionVariablesHTGDL.SeparatorQuery
      is
         when StandardSeperator =>
            return NumberStringExtern;
            
         when others =>
            TemporaryStorage := NumberStringExtern;
      end case;
      
      NumberLoop:
      for NumberLoopValue in TemporaryStorage'Range loop
         
         case
           TemporaryStorage (NumberLoopValue)
         is
            when StandardSeperator =>
               TemporaryStorage (NumberLoopValue) := ConversionVariablesHTGDL.SeparatorQuery;
               exit NumberLoop;
               
            when others =>
               null;
         end case;
         
      end loop NumberLoop;
      
      return TemporaryStorage;
      
   end DecimalSeperator;
   
   
   
   function Decode
     (TextExtern : in String)
      return Wide_Wide_String
   is begin
      
      case
        ConversionVariablesHTGDL.EncodingQuery
      is
         when Ada.Strings.UTF_Encoding.UTF_8 =>
            return Decode (Item         => TextExtern,
                           Input_Scheme => Ada.Strings.UTF_Encoding.UTF_8);
            
         when Ada.Strings.UTF_Encoding.UTF_16BE =>
            return Decode (Item         => TextExtern,
                           Input_Scheme => Ada.Strings.UTF_Encoding.UTF_16BE);
            
            
         when Ada.Strings.UTF_Encoding.UTF_16LE =>
            return Decode (Item         => TextExtern,
                           Input_Scheme => Ada.Strings.UTF_Encoding.UTF_16LE);
      end case;
      
   end Decode;
   
   
   
   function DecodeUnbounded
     (TextExtern : in String)
      return Unbounded_Wide_Wide_String
   is begin
      
      return To_Unbounded_Wide_Wide_String (Source => Decode (TextExtern => TextExtern));
      
   end DecodeUnbounded;
   
   
   
   function Encode
     (TextExtern : in Wide_Wide_String)
      return String
   is begin
      
      case
        ConversionVariablesHTGDL.EncodingQuery
      is
         when Ada.Strings.UTF_Encoding.UTF_8 =>
            return Encode (Item          => TextExtern,
                           Output_Scheme => Ada.Strings.UTF_Encoding.UTF_8,
                           Output_BOM    => False);
            
         when Ada.Strings.UTF_Encoding.UTF_16BE =>
            return Encode (Item          => TextExtern,
                           Output_Scheme => Ada.Strings.UTF_Encoding.UTF_16BE,
                           Output_BOM    => False);
            
         when Ada.Strings.UTF_Encoding.UTF_16LE =>
            return Encode (Item          => TextExtern,
                           Output_Scheme => Ada.Strings.UTF_Encoding.UTF_16LE,
                           Output_BOM    => False);
      end case;
      
   end Encode;
   
   
   
   function EncodeUnbounded
     (TextExtern : in Unbounded_Wide_Wide_String)
      return String
   is begin
      
      return Encode (TextExtern => To_Wide_Wide_String (Source => TextExtern));
      
   end EncodeUnbounded;

end ConversionSystemHTGDL;
