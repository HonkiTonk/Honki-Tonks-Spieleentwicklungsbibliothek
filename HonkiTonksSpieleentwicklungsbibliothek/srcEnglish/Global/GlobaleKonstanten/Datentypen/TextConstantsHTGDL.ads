with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

with OperatingSystemConstantsHTGDL;

package TextConstantsHTGDL is
   pragma Elaborate_Body;
   
   SeparatorTextFile : constant Wide_Wide_Character := '#';
   SeparatorDifferent : constant Wide_Wide_Character := '|';
   Separator : constant Wide_Wide_Character := '/';
   
   EmptyString : constant Wide_Wide_String := "";
   BlankSpace : constant Wide_Wide_String (1 .. 1) := " ";
   Hyphen : constant Wide_Wide_String (1 .. 3) := " - ";
   StandardSpacing : constant Wide_Wide_String (1 .. 4) := "    ";
   LongSpacing : constant Wide_Wide_String (1 .. 10) := "          ";
   BreakSpacing : constant Wide_Wide_String (1 .. 5) := OperatingSystemConstantsHTGDL.LF & StandardSpacing;
   InfinitelyBracketed : constant Wide_Wide_String (1 .. 4) := " (∞)";
   InfiniteUnbracketed : constant Wide_Wide_String (1 .. 2) := " ∞";
   CheckMark : constant Wide_Wide_String (1 .. 2) := " ✔";
   XMark : constant Wide_Wide_String (1 .. 2) := " ✘";
   
   MissingText : constant Unbounded_Wide_Wide_String := To_Unbounded_Wide_Wide_String (Source => "ÄÖÜ No text has been imported here ÜÖÄ");
   EmptyUnboundedString : constant Unbounded_Wide_Wide_String := To_Unbounded_Wide_Wide_String (Source => EmptyString);
   BlankSpaceUnboundedString : constant Unbounded_Wide_Wide_String := To_Unbounded_Wide_Wide_String (Source => BlankSpace);
   
   StandardFolder : constant Unbounded_Wide_Wide_String := To_Unbounded_Wide_Wide_String (Source => "Standard");
   StandardDirectory : constant Unbounded_Wide_Wide_String := StandardFolder & "/";

end TextConstantsHTGDL;
