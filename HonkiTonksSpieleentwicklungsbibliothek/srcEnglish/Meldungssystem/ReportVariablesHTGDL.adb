package body ReportVariablesHTGDL is

   procedure ChangeErrorMessage
     (ErrorMessageExtern : in Boolean)
   is begin
      
      ErrorMessage := ErrorMessageExtern;
      
   end ChangeErrorMessage;
   
   
   
   procedure ChangeVersionNumber
     (VersionNumberExtern : in Wide_Wide_String)
   is begin
      
      VersionNumber := VersionNumberExtern;
      
   end ChangeVersionNumber;
   
   
   
   function ErrorMessageQuery
     return Boolean
   is begin
      
      return ErrorMessage;
      
   end ErrorMessageQuery;
   
   
   
   function VersionNumberQuery
     return Wide_Wide_String
   is begin
      
      return VersionNumber;
      
   end VersionNumberQuery;

end ReportVariablesHTGDL;
