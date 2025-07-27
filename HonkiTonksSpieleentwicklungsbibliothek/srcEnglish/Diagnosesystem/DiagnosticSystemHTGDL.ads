with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

private with Ada.Streams.Stream_IO;
private with Ada.Strings.Unbounded;
private with System;

package DiagnosticSystemHTGDL is
   pragma Elaborate_Body;

   procedure SizeCheck
     (DataTypeSizeExtern : in Positive);
   
   procedure LineSpacing;
   
   procedure WholeNumber
     (NumberExtern : in Integer);
   
   procedure DecimalNumber
     (NumberExtern : in Float);
   
   procedure WideWideCharacter
     (CharacterExtern : in Wide_Wide_Character);
   
   procedure ShortCharacter
     (CharacterExtern : in Character);
   
   procedure Text
     (TextExtern : in Wide_Wide_String)
     with
       Pre => (
                 TextExtern'Length > 0
              );
   
   procedure UnboundedText
     (TextExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => TextExtern)'Length > 0
              );
   
   procedure ShortText
     (TextExtern : in String)
     with
       Pre => (
                 TextExtern'Length > 0
              );
   
   procedure DirectoryName;
      
   procedure MaximumFileNameLength;
   
private
   use System;
   use Ada.Strings.Unbounded;
   use Ada.Streams.Stream_IO;
   
   ByteDivisor : constant Positive := Storage_Unit;
   KilobyteDivisor : constant Positive := ByteDivisor * 1_024;
   MegabyteDivisor : constant Positive := KilobyteDivisor * 1_024;
   MaximumNameLength : constant Positive := 255;
            
   FileSave : File_Type;
   
   TemporaryStorage : Unbounded_String;

end DiagnosticSystemHTGDL;
