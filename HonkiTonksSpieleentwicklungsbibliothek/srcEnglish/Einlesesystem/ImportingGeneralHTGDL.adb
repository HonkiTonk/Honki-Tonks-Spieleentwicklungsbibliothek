with Ada.Exceptions;

with ReportingSystemHTGDL;
with ConversionSystemHTGDL;
with TextConstantsHTGDL;

package body ImportingGeneralHTGDL is

   function EndOfFile
     (CurrentFileExtern : in File_Type;
      CurrentLineExtern : in Positive;
      FileNameExtern : in Wide_Wide_String)
      return Boolean
   is
      use Ada.Exceptions;
   begin
      
      case
        End_Of_File (File => CurrentFileExtern)
      is
         when True =>
            return True;
               
         when False =>
            Set_Line (File => CurrentFileExtern,
                      To   => Ada.Wide_Wide_Text_IO.Count (CurrentLineExtern));
            return False;
      end case;
      
   exception
      when StandardAdaError : others =>
         ReportingSystemHTGDL.Logic (ReportExtern => "ImportingGeneralHTGDL.EndOfFile: " & FileNameExtern & ": Current line:" & CurrentLineExtern'Wide_Wide_Image & " "
                                     & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
         return True;
         
   end EndOfFile;
   
   
   
   function TextImport
     (FileExtern : in File_Type;
      CurrentLineExtern : in Positive;
      FileNameExtern : in Wide_Wide_String)
      return Wide_Wide_String
   is begin
      
      return To_Wide_Wide_String (Source => UnboundedTextImport (FileExtern        => FileExtern,
                                                                 CurrentLineExtern => CurrentLineExtern,
                                                                 FileNameExtern    => FileNameExtern));
      
   end TextImport;
   
   
   
   function UnboundedTextImport
     (FileExtern : in File_Type;
      CurrentLineExtern : in Positive;
      FileNameExtern : in Wide_Wide_String)
      return Unbounded_Wide_Wide_String
   is
      use Ada.Exceptions;
   begin
      
      case
        End_Of_Line (File => FileExtern)
      is
         when True =>
            return To_Unbounded_Wide_Wide_String (Source => (" Blank line in " & FileNameExtern & ", Line:" & CurrentLineExtern'Wide_Wide_Image));
            
         when False =>
            return To_Unbounded_Wide_Wide_String (Source => Get_Line (File => FileExtern));
      end case;
      
   exception
      when StandardAdaError : others =>
         ReportingSystemHTGDL.Logic (ReportExtern => "ImportingGeneralHTGDL.UnboundedTextImport: " & FileNameExtern & ": Current line:" & CurrentLineExtern'Wide_Wide_Image & " "
                                     & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
         return To_Unbounded_Wide_Wide_String (Source => (FileNameExtern & ", Line:" & CurrentLineExtern'Wide_Wide_Image));
         
   end UnboundedTextImport;
   
   
   
   function UnboundedFileNameImport
     (FileExtern : in File_Type;
      CurrentLineExtern : in Positive;
      FileNameExtern : in Wide_Wide_String)
      return Unbounded_Wide_Wide_String
   is
      use Ada.Exceptions;
   begin
      
      case
        End_Of_Line (File => FileExtern)
      is
         when True =>
            return TextConstantsHTGDL.EmptyUnboundedString;
            
         when False =>
            return To_Unbounded_Wide_Wide_String (Source => Get_Line (File => FileExtern));
      end case;
      
   exception
      when StandardAdaError : others =>
         ReportingSystemHTGDL.Logic (ReportExtern => "ImportingGeneralHTGDL.UnboundedFileNameImport: " & FileNameExtern & ": Current line:" & CurrentLineExtern'Wide_Wide_Image & " "
                                     & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
         return TextConstantsHTGDL.EmptyUnboundedString;
         
   end UnboundedFileNameImport;
   
   
   
   function UseLine
     (FileNameExtern : in Unbounded_Wide_Wide_String)
      return Boolean
   is begin
   
      if
        FileNameExtern = TextConstantsHTGDL.EmptyUnboundedString
        or else
          To_Wide_Wide_String (Source => FileNameExtern) (1) = TextConstantsHTGDL.SeparatorTextFile
      then
         return False;
         
      else
         return True;
      end if;
         
   end UseLine;
   
end ImportingGeneralHTGDL;
