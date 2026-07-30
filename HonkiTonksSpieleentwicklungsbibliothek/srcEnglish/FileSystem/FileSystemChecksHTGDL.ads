with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

private with Ada.Directories;

with SystemRecordsHTGDL;

package FileSystemChecksHTGDL is
   pragma Elaborate_Body;

   function ValidCharacterLength
     (LinuxTextExtern : in Unbounded_Wide_Wide_String;
      WindowsTextExtern : in Unbounded_Wide_Wide_String)
      return Boolean
     with
       Pre => (
                 To_Wide_Wide_String (Source => WindowsTextExtern)'Length >= To_Wide_Wide_String (Source => LinuxTextExtern)'Length
              );

   function StandardChecksReport
     (LinuxTextExtern : in Wide_Wide_String;
      WindowsTextExtern : in Wide_Wide_String)
      return Boolean
     with
       Pre => (
                 WindowsTextExtern'Length >= LinuxTextExtern'Length
              );

   function StandardChecks
     (LinuxTextExtern : in Wide_Wide_String;
      WindowsTextExtern : in Wide_Wide_String)
      return Boolean
     with
       Pre => (
                 WindowsTextExtern'Length >= LinuxTextExtern'Length
              );

   function ValidCharacter
     (CharacterExtern : in Wide_Wide_Character)
      return Boolean;

   function ValidName
     (NameExtern : in Wide_Wide_String)
      return Boolean
     with
       Pre => (
                 NameExtern'Length > 0
              );

   function NameChecks
     (TextExtern : in Unbounded_Wide_Wide_String)
      return SystemRecordsHTGDL.TextEntryRecord
     with
       Post => (
                  if NameChecks'Result.SuccessfulAbortion = True then To_Wide_Wide_String (Source => NameChecks'Result.TextEntry)'Length > 0
               );

private
   use Ada.Directories;

   LengthCurrentDirectory : constant Positive := Current_Directory'Length;

   TemporaryStorage : Wide_Wide_String (1 .. 3);

   FiveText : Wide_Wide_String (1 .. 5);

   Text : Unbounded_Wide_Wide_String;



   function NameChecksWindows
     (TextExtern : in Unbounded_Wide_Wide_String)
      return SystemRecordsHTGDL.TextEntryRecord
     with
       Pre => (
                 To_Wide_Wide_String (Source => TextExtern)'Length > 0
              ),

       Post => (
                  if NameChecksWindows'Result.SuccessfulAbortion = True then To_Wide_Wide_String (Source => NameChecksWindows'Result.TextEntry)'Length > 0
               );

   function CheckThree
     (TextExtern : in Wide_Wide_String;
      ForbiddenTextExtern : in Wide_Wide_String)
      return Boolean
     with
       Pre => (
                 ForbiddenTextExtern'Length in 3 .. 5
              );

end FileSystemChecksHTGDL;
