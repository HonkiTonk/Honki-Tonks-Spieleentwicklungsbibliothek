with Ada.Directories;
with Ada.Exceptions;
with Ada.Calendar;
with Ada.Calendar.Formatting;

with FileSystemVariablesHTGDL;
with ReportVariablesHTGDL;
with ConversionSystemHTGDL;

package body ReportWritingHTGDL is

   procedure Report
     (ReportExtern : in Wide_Wide_String)
   is
      use Ada.Directories;
      use Ada.Exceptions;
      use Ada.Calendar;
      use Ada.Calendar.Formatting;
   begin
      
      WaitingLoop:
      while Is_Open (File => FileReport) loop
                  
         delay until Clock + WaitingTime;
         
      end loop WaitingLoop;
      
      case
        Exists (Name => Reports)
      is
         when True =>
            Open (File => FileReport,
                  Mode => Append_File,
                  Name => Reports,
                  Form => FileSystemVariablesHTGDL.FileFormatQuery);
            
         when False =>
            Create (File => FileReport,
                    Mode => Out_File,
                    Name => Reports,
                    Form => FileSystemVariablesHTGDL.FileFormatQuery);
      end case;
      
      Put (File => FileReport,
           Item => ConversionSystemHTGDL.Decode (TextExtern => Local_Image (Date                  => Clock,
                                                                            Include_Time_Fraction => False))
           & " (Version: " & ReportVariablesHTGDL.VersionNumberQuery & "): " & ReportExtern);
      
      Close (File => FileReport);
      
   exception
      when StandardAdaError : others =>
         Put (Item => "ReportWritingHTGDL.Report - Could not be written: " & ConversionSystemHTGDL.Decode (TextExtern => Exception_Information (X => StandardAdaError)));
         
         case
           Is_Open (File => FileReport)
         is
            when True =>
               Close (File => FileReport);
               
            when False =>
               null;
         end case;
         
   end Report;
   
   
   
   procedure ReportASCII
     (ReportExtern : in String)
   is begin

      Report (ReportExtern => ConversionSystemHTGDL.Decode (TextExtern => ReportExtern));
      
   end ReportASCII;

end ReportWritingHTGDL;
