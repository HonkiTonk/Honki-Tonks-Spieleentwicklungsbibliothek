with Ada.Exceptions;
with Ada.Directories;

with FileSystemVariablesHTGDL;
with ReportingSystemHTGDL;
with ConversionSystemHTGDL;

package body FileAccessSystemHTGDL is

   procedure CreateStream
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in String)
   is
      use Ada.Streams.Stream_IO;
      use Ada.Exceptions;
   begin
      
      Create (File => FileTypeExtern,
              Mode => Out_File,
              Name => NameExtern,
              Form => FileSystemVariablesHTGDL.FileFormatQuery);
   
   exception
      when StandardAdaError : others =>
         ReportingSystemHTGDL.Logic (ReportExtern => "FileAccessSystemHTGDL.CreateStream: Stream cannot be created: " & ConversionSystemHTGDL.Decode (TextExtern => NameExtern) & "/"
                                     & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
         
   end CreateStream;
   
   

   procedure OpenStream
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in String)
   is
      use Ada.Streams.Stream_IO;
      use Ada.Exceptions;
   begin
      
      Open (File => FileTypeExtern,
            Mode => In_File,
            Name => NameExtern,
            Form => FileSystemVariablesHTGDL.FileFormatQuery);
   
   exception
      when StandardAdaError : others =>
         ReportingSystemHTGDL.Logic (ReportExtern => "FileAccessSystemHTGDL.OpenStream: Stream cannot be opened: " & ConversionSystemHTGDL.Decode (TextExtern => NameExtern) & "/"
                                     & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
      
   end OpenStream;
   
   
   
   procedure CloseStream
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in String)
   is
      use Ada.Streams.Stream_IO;
   begin
      
      case
        Is_Open (File => FileTypeExtern)
      is
         when True =>
            Close (File => FileTypeExtern);
            
         when False =>
            ReportingSystemHTGDL.Logic (ReportExtern => "FileAccessSystemHTGDL.CloseStream: Unopened stream should be closed: " & ConversionSystemHTGDL.Decode (TextExtern => NameExtern));
      end case;
      
   end CloseStream;
   
   
   
   
   procedure CreateText
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in String)
   is
      use Ada.Wide_Wide_Text_IO;
      use Ada.Exceptions;
   begin
      
      Create (File => FileTypeExtern,
              Mode => Out_File,
              Name => NameExtern,
              Form => FileSystemVariablesHTGDL.FileFormatQuery);
   
   exception
      when StandardAdaError : others =>
         ReportingSystemHTGDL.Logic (ReportExtern => "FileAccessSystemHTGDL.CreateText: Text cannot be created: " & ConversionSystemHTGDL.Decode (TextExtern => NameExtern) & "/"
                                     & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
      
   end CreateText;
   
   

   procedure OpenText
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in String)
   is
      use Ada.Wide_Wide_Text_IO;
      use Ada.Exceptions;
   begin
      
      Open (File => FileTypeExtern,
            Mode => In_File,
            Name => NameExtern,
            Form => FileSystemVariablesHTGDL.FileFormatQuery);
   
   exception
      when StandardAdaError : others =>
         ReportingSystemHTGDL.Logic (ReportExtern => "FileAccessSystemHTGDL.OpenText: Text cannot be opened: " & ConversionSystemHTGDL.Decode (TextExtern => NameExtern) & "/"
                                     & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
      
   end OpenText;
   
   
   
   procedure ExpandText
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in String)
   is
      use Ada.Wide_Wide_Text_IO;
      use Ada.Exceptions;
   begin
      
      Open (File => FileTypeExtern,
            Mode => Append_File,
            Name => NameExtern,
            Form => FileSystemVariablesHTGDL.FileFormatQuery);
   
   exception
      when StandardAdaError : others =>
         ReportingSystemHTGDL.Logic (ReportExtern => "FileAccessSystemHTGDL.ExpandText: Text cannot be opened: " & ConversionSystemHTGDL.Decode (TextExtern => NameExtern) & "/"
                                     & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
      
   end ExpandText;
   
   
   
   procedure CloseText
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in String)
   is
      use Ada.Wide_Wide_Text_IO;
   begin
      
      case
        Is_Open (File => FileTypeExtern)
      is
         when True =>
            Close (File => FileTypeExtern);
            
         when False =>
            ReportingSystemHTGDL.Logic (ReportExtern => "FileAccessSystemHTGDL.CloseText: Unopened text should be closed: " & ConversionSystemHTGDL.Decode (TextExtern => NameExtern));
      end case;
      
   end CloseText;
   
   
   
   procedure CreateStreamWideWide
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Wide_Wide_String)
   is begin
      
      CreateStream (FileTypeExtern => FileTypeExtern,
                    NameExtern     => ConversionSystemHTGDL.Encode (TextExtern => NameExtern));
      
   end CreateStreamWideWide;
   
   

   procedure OpenStreamWideWide
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Wide_Wide_String)
   is begin
      
      OpenStream (FileTypeExtern => FileTypeExtern,
                  NameExtern     => ConversionSystemHTGDL.Encode (TextExtern => NameExtern));
      
   end OpenStreamWideWide;
   
   
   
   procedure CloseStreamWideWide
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Wide_Wide_String)
   is begin
      
      CloseStream (FileTypeExtern => FileTypeExtern,
                   NameExtern     => ConversionSystemHTGDL.Encode (TextExtern => NameExtern));
      
   end CloseStreamWideWide;
   
   
   
   procedure CreateTextWideWide
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Wide_Wide_String)
   is begin
      
      CreateText (FileTypeExtern => FileTypeExtern,
                  NameExtern     => ConversionSystemHTGDL.Encode (TextExtern => NameExtern));
      
   end CreateTextWideWide;
   
   
   
   procedure OpenTextWideWide
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Wide_Wide_String)
   is begin
      
      OpenText (FileTypeExtern => FileTypeExtern,
                NameExtern     => ConversionSystemHTGDL.Encode (TextExtern => NameExtern));
      
   end OpenTextWideWide;
   
   
   
   procedure ErweiternTextWideWide
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Wide_Wide_String)
   is begin
      
      ExpandText (FileTypeExtern => FileTypeExtern,
                  NameExtern     => ConversionSystemHTGDL.Encode (TextExtern => NameExtern));
      
   end ErweiternTextWideWide;
   
   
   
   procedure CloseTextWideWide
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Wide_Wide_String)
   is begin
      
      CloseText (FileTypeExtern => FileTypeExtern,
                 NameExtern     => ConversionSystemHTGDL.Encode (TextExtern => NameExtern));
      
   end CloseTextWideWide;
   
   
   
   procedure CreateStreamUnbounded
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
   is begin
      
      CreateStream (FileTypeExtern => FileTypeExtern,
                    NameExtern     => ConversionSystemHTGDL.EncodeUnbounded (TextExtern => NameExtern));
         
   end CreateStreamUnbounded;
   
   

   procedure OpenStreamUnbounded
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
   is begin
      
      OpenStream (FileTypeExtern => FileTypeExtern,
                  NameExtern     => ConversionSystemHTGDL.EncodeUnbounded (TextExtern => NameExtern));
      
   end OpenStreamUnbounded;
   
   
   
   procedure CloseStreamUnbounded
     (FileTypeExtern : in out Ada.Streams.Stream_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
   is begin
      
      CloseStream (FileTypeExtern => FileTypeExtern,
                   NameExtern     => ConversionSystemHTGDL.EncodeUnbounded (TextExtern => NameExtern));
      
   end CloseStreamUnbounded;
   
   
   
   procedure CreateTextUnbounded
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
   is begin
      
      CreateText (FileTypeExtern => FileTypeExtern,
                  NameExtern     => ConversionSystemHTGDL.EncodeUnbounded (TextExtern => NameExtern));
      
   end CreateTextUnbounded;
   
   
   
   procedure OpenTextUnbounded
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
   is begin
      
      OpenText (FileTypeExtern => FileTypeExtern,
                NameExtern     => ConversionSystemHTGDL.EncodeUnbounded (TextExtern => NameExtern));
      
   end OpenTextUnbounded;
   
   
   
   procedure ErweiternTextUnbounded
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
   is begin
      
      ExpandText (FileTypeExtern => FileTypeExtern,
                  NameExtern     => ConversionSystemHTGDL.EncodeUnbounded (TextExtern => NameExtern));
      
   end ErweiternTextUnbounded;
   
   
   
   procedure CloseTextUnbounded
     (FileTypeExtern : in out Ada.Wide_Wide_Text_IO.File_Type;
      NameExtern : in Unbounded_Wide_Wide_String)
   is begin
      
      CloseText (FileTypeExtern => FileTypeExtern,
                 NameExtern     => ConversionSystemHTGDL.EncodeUnbounded (TextExtern => NameExtern));
      
   end CloseTextUnbounded;
   
   
   
   procedure Delete
     (NameExtern : in String)
   is
      use Ada.Directories;
   begin
      
      case
        Exists (Name => NameExtern)
      is
         when True =>
            Delete_File (Name => NameExtern);
            
         when False =>
            ReportingSystemHTGDL.Logic (ReportExtern => "FileAccessSystemHTGDL.Delete: Non-existent file should be deleted: " & ConversionSystemHTGDL.Decode (TextExtern => NameExtern));
      end case;
      
   end Delete;
   
   
   
   procedure DeleteWideWide
     (NameExtern : in Wide_Wide_String)
   is begin
      
      Delete (NameExtern => ConversionSystemHTGDL.Encode (TextExtern => NameExtern));
      
   end DeleteWideWide;
   
   
   
   procedure DeleteUnbounded
     (NameExtern : in Unbounded_Wide_Wide_String)
   is begin
      
      Delete (NameExtern => ConversionSystemHTGDL.EncodeUnbounded (TextExtern => NameExtern));
      
   end DeleteUnbounded;

end FileAccessSystemHTGDL;
