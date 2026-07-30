package ReportVariablesHTGDL is
   pragma Preelaborate;

   procedure ChangeErrorMessage
     (ErrorMessageExtern : in Boolean);
   pragma Inline (ChangeErrorMessage);
   
   procedure ChangeVersionNumber
     (VersionNumberExtern : in Wide_Wide_String)
     with
       Pre => (
                 VersionNumberExtern'Length = 9
              );
   pragma Inline (ChangeVersionNumber);
   
   
   
   function ErrorMessageQuery
     return Boolean;
   pragma Inline (ErrorMessageQuery);
   
   function VersionNumberQuery
     return Wide_Wide_String
     with
       Post => (
                  VersionNumberQuery'Result'Length = 9
               );
   pragma Inline (VersionNumberQuery);
   
private
   
   ErrorMessage : Boolean := True;
   
   VersionNumber : Wide_Wide_String (1 .. 9) := "0.00.0000";

end ReportVariablesHTGDL;
