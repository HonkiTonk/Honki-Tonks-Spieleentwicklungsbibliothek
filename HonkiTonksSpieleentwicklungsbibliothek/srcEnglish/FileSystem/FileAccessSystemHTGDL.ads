with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;
with Ada.Wide_Wide_Text_IO;
with Ada.Streams.Stream_IO;

package FileAccessSystemHTGDL is
   pragma Elaborate_Body;

   procedure CreateStream
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in String)
     with
       Pre => (
                 NameExtern'Length > 0
              );

   procedure OpenStream
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure CloseStream
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure CreateText
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure OpenText
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure ExpandText
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure CloseText
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure CreateStreamWideWide
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Wide_Wide_String)
     with
       Pre => (
                 NameExtern'Length > 0
              );

   procedure OpenStreamWideWide
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Wide_Wide_String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure CloseStreamWideWide
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Wide_Wide_String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure CreateTextWideWide
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Wide_Wide_String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure OpenTextWideWide
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Wide_Wide_String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure ErweiternTextWideWide
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Wide_Wide_String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure CloseTextWideWide
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Wide_Wide_String)
     with
       Pre => (
                 NameExtern'Length > 0
              );

   procedure CreateStreamUnbounded
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => NameExtern)'Length > 0
              );

   procedure OpenStreamUnbounded
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => NameExtern)'Length > 0
              );
   
   procedure CloseStreamUnbounded
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => NameExtern)'Length > 0
              );
   
   procedure CreateTextUnbounded
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => NameExtern)'Length > 0
              );
   
   procedure OpenTextUnbounded
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => NameExtern)'Length > 0
              );
   
   procedure ErweiternTextUnbounded
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => NameExtern)'Length > 0
              );
   
   procedure CloseTextUnbounded
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => NameExtern)'Length > 0
              );
   
   procedure Delete
     (NameExtern : in String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure DeleteWideWide
     (NameExtern : in Wide_Wide_String)
     with
       Pre => (
                 NameExtern'Length > 0
              );
   
   procedure DeleteUnbounded
     (NameExtern : in Unbounded_Wide_Wide_String)
     with
       Pre => (
                 To_Wide_Wide_String (Source => NameExtern)'Length > 0
              );

end FileAccessSystemHTGDL;
