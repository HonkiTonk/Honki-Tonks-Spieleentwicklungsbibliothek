with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

package ArraysHTGDL is
   pragma Preelaborate;

   type GeneralTextArray is array (Positive range <>) of Unbounded_Wide_Wide_String;

   type SetsArray is array (1 .. 11) of Unbounded_Wide_Wide_String;

   ImportSets : ArraysHTGDL.GeneralTextArray (1 .. 100);

end ArraysHTGDL;
