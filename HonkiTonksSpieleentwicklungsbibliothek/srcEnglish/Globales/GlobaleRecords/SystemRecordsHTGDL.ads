with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

with SystemDataTypesHTGDL;

package SystemRecordsHTGDL is
   pragma Preelaborate;
   
   type NumberEntryRecord is record
      
      SuccessfulAbortion : Boolean;
      NumberEntry : SystemDataTypesHTGDL.OwnInteger;
      
   end record;
   
   

   type TextEntryRecord is record
      
      SuccessfulAbortion : Boolean;
      TextEntry : Unbounded_Wide_Wide_String;
      
   end record;

end SystemRecordsHTGDL;
