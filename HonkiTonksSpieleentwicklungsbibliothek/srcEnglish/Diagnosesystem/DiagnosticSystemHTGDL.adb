with Ada.Wide_Wide_Text_IO;
with Ada.Directories;
with Ada.Float_Text_IO;
with Ada.Text_IO;

with FileAccessSystemHTGDL;

package body DiagnosticSystemHTGDL is
   
   procedure SizeCheck
     (DataTypeSizeExtern : in Positive)
   is
      use Ada.Wide_Wide_Text_IO;
   begin
      
      Put_Line (Item => "Bits:" & DataTypeSizeExtern'Wide_Wide_Image);
      Put_Line (Item => "Bytes:" & Integer (DataTypeSizeExtern / ByteDivisor)'Wide_Wide_Image);
      Put_Line (Item => "Kilobytes:" & Integer (DataTypeSizeExtern / KilobyteDivisor)'Wide_Wide_Image);
      Put_Line (Item => "Megabytes:" & Integer (DataTypeSizeExtern / MegabyteDivisor)'Wide_Wide_Image);
      
   end SizeCheck;
   
   
   
   procedure LineSpacing
   is
      use Ada.Wide_Wide_Text_IO;
   begin
      
      New_Line;
      
   end LineSpacing;
   
   
   
   procedure WholeNumber
     (NumberExtern : in Integer)
   is
      use Ada.Wide_Wide_Text_IO;
   begin
      
      Put_Line (NumberExtern'Wide_Wide_Image);
      
   end WholeNumber;
   
   
   procedure DecimalNumber
     (NumberExtern : in Float)
   is
      use Ada.Wide_Wide_Text_IO;
      use Ada.Float_Text_IO;
   begin
      
      Put (Item => NumberExtern,
           Exp  => 0);
      
      New_Line;
      
   end DecimalNumber;
   
   
   
   procedure WideWideCharacter
     (CharacterExtern : in Wide_Wide_Character)
   is
      use Ada.Wide_Wide_Text_IO;
   begin
      
      Put_Line (Item => CharacterExtern'Wide_Wide_Image);
      
   end WideWideCharacter;
   
   
   
   procedure ShortCharacter
     (CharacterExtern : in Character)
   is
      use Ada.Text_IO;
   begin
      
      Put_Line (Item => CharacterExtern'Image);
      
   end ShortCharacter;
   
   
   
   procedure Text
     (TextExtern : in Wide_Wide_String)
   is
      use Ada.Wide_Wide_Text_IO;
   begin
      
      Put_Line (Item => TextExtern);
      
   end Text;
   
   
   
   procedure UnboundedText
     (TextExtern : in Unbounded_Wide_Wide_String)
   is
      use Ada.Wide_Wide_Text_IO;
   begin
      
      Put_Line (Item => To_Wide_Wide_String (Source => TextExtern));
      
   end UnboundedText;
   
   
   
   procedure ShortText
     (TextExtern : in String)
   is
      use Ada.Text_IO;
   begin
      
      Put_Line (Item => TextExtern);
      
   end ShortText;
   
   
   
   procedure DirectoryName
   is
      use Ada.Text_IO;
      use Ada.Directories;
   begin
      
      Put_Line (Item => Current_Directory);
      
   end DirectoryName;
   
   
   
   procedure MaximumFileNameLength
   is
      use Ada.Wide_Wide_Text_IO;
      use Ada.Directories;
   begin
      
      TemporaryStorage := To_Unbounded_String (Source => "");
      
      FileLengthLoop:
      for FileLengthLoopValue in 1 .. MaximumNameLength loop
         
         Put_Line (Item => FileLengthLoopValue'Wide_Wide_Image);
         
         TemporaryStorage := TemporaryStorage & "a";
         
         FileAccessSystemHTGDL.CreateStream (FileTypeExtern => FileSave,
                                             NameExtern     => To_String (Source => TemporaryStorage));
         
         Close (File => FileSave);
         
         Delete_File (Name => To_String (Source => TemporaryStorage));
         
      end loop FileLengthLoop;
      
   end MaximumFileNameLength;

end DiagnosticSystemHTGDL;
