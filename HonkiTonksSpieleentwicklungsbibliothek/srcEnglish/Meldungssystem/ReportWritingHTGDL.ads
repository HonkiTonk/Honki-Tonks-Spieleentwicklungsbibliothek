private with Ada.Wide_Wide_Text_IO;

package ReportWritingHTGDL is
   pragma Elaborate_Body;

   procedure Report
     (ReportExtern : in Wide_Wide_String)
     with
       Pre => (
                 ReportExtern'Length > 0
              );
   
   procedure ReportASCII
     (ReportExtern : in String)
     with
       Pre => (
                 ReportExtern'Length > 0
              );
   
private
   use Ada.Wide_Wide_Text_IO;
   
   Reports : constant String (1 .. 7) := "Reports";
   
   WaitingTime : constant Duration := 0.002;
         
   FileReport : File_Type;

end ReportWritingHTGDL;
