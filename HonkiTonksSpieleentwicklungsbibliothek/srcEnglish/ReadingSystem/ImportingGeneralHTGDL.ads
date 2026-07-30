with Ada.Wide_Wide_Text_IO; use Ada.Wide_Wide_Text_IO;
with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

package ImportingGeneralHTGDL is
   pragma Elaborate_Body;

   function EndOfFile
     (CurrentFileExtern : in File_Type;
      CurrentLineExtern : in Positive;
      FileNameExtern : in Wide_Wide_String)
      return Boolean
     with
       Pre => (
                 FileNameExtern'Length > 0
              );

   function TextImport
     (FileExtern : in File_Type;
      CurrentLineExtern : in Positive;
      FileNameExtern : in Wide_Wide_String)
      return Wide_Wide_String
     with
       Pre => (
                 FileNameExtern'Length > 0
              );

   function UnboundedTextImport
     (FileExtern : in File_Type;
      CurrentLineExtern : in Positive;
      FileNameExtern : in Wide_Wide_String)
      return Unbounded_Wide_Wide_String
     with
       Pre => (
                 FileNameExtern'Length > 0
              );

   function UnboundedFileNameImport
     (FileExtern : in File_Type;
      CurrentLineExtern : in Positive;
      FileNameExtern : in Wide_Wide_String)
      return Unbounded_Wide_Wide_String
     with
       Pre => (
                 FileNameExtern'Length > 0
              );

   function UseLine
     (FileNameExtern : in Unbounded_Wide_Wide_String)
      return Boolean;

end ImportingGeneralHTGDL;
