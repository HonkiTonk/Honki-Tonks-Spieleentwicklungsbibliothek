with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

package ConversionSystemHTGDL is
   pragma Elaborate_Body;
   
   generic type WholeNumber is range <>;
      
   function NumberString
     (NumberExtern : in WholeNumber)
      return Wide_Wide_String
     with
       Post => (
                  NumberString'Result'Length > 0
               );
   
   generic type DecimalNumber is digits <>;
      
      -- Due to the string length, this only works for values between -9_999_999_999,99 .. 9_999_999_999,99.
   function DecimalNumberString
     (DecimalNumberExtern : in DecimalNumber)
      return Wide_Wide_String
     with
       Post => (
                  DecimalNumberString'Result'Length > 0
               );
   
   function Decode
     (TextExtern : in String)
      return Wide_Wide_String;
            
   function DecodeUnbounded
     (TextExtern : in String)
      return Unbounded_Wide_Wide_String;
   
   function Encode
     (TextExtern : in Wide_Wide_String)
      return String;
   
   function EncodeUnbounded
     (TextExtern : in Unbounded_Wide_Wide_String)
      return String;
   
private
   
   StandardSeperator : constant Wide_Wide_Character := '.';
      
   -- The length comes from "-1_000_000_000.00".
   TemporaryStorageDecimalNumberString : String (1 .. 14);
   
   TemporaryStorage : Wide_Wide_String (TemporaryStorageDecimalNumberString'Range);
      
   function DecimalSeperator
     (NumberStringExtern : in Wide_Wide_String)
      return Wide_Wide_String
     with
       Post => (
                  DecimalSeperator'Result'Length > 0
               );

end ConversionSystemHTGDL;
