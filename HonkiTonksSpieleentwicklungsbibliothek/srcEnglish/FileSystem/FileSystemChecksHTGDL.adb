with Ada.Wide_Wide_Characters.Handling;

with OperatingSystemConstantsHTGDL;
with OperatingSystemDataTypesHTGDL;
with SystemRecordsConstantsHTGDL;

with ReportingSystemHTGDL;
with ConversionSystemHTGDL;
with FileSystemVariablesHTGDL;

package body FileSystemChecksHTGDL is

   -- For Linux, only pass the file name. For Windows, also pass the entire path of the subdirectories.
   function ValidCharacterLength
     (LinuxTextExtern : in Unbounded_Wide_Wide_String;
      WindowsTextExtern : in Unbounded_Wide_Wide_String)
      return Boolean
   is begin
      
      case
        FileSystemVariablesHTGDL.OperatingSystemQuery
      is
         when OperatingSystemDataTypesHTGDL.Linux_Enum =>
            if
              To_Wide_Wide_String (Source => LinuxTextExtern)'Length <= OperatingSystemConstantsHTGDL.MaximaleZeichenlängeDateisystem
            then
               return True;
               
            else
               ReportingSystemHTGDL.Logic (ReportExtern => "FileSystemChecksHTGDL.ValidCharacterLength: Valid character length exceeded: " & To_Wide_Wide_String (Source => WindowsTextExtern));
               return False;
            end if;
            
         when OperatingSystemDataTypesHTGDL.Windows_Enum =>
            if
              To_Wide_Wide_String (Source => WindowsTextExtern)'Length <= OperatingSystemConstantsHTGDL.MaximaleZeichenlängeDateisystem - LengthCurrentDirectory
            then
               return True;
               
            else
               ReportingSystemHTGDL.Logic (ReportExtern => "FileSystemChecksHTGDL.ValidCharacterLength: Valid character length exceeded: " & To_Wide_Wide_String (Source => WindowsTextExtern));
               return False;
            end if;
      end case;
      
   end ValidCharacterLength;
   
   
   
   function StandardChecksReport
     (LinuxTextExtern : in Wide_Wide_String;
      WindowsTextExtern : in Wide_Wide_String)
      return Boolean
   is begin
      
      if
        False = ValidCharacterLength (LinuxTextExtern   => To_Unbounded_Wide_Wide_String (Source => LinuxTextExtern),
                                      WindowsTextExtern => To_Unbounded_Wide_Wide_String (Source => WindowsTextExtern))
      then
         return False;
         
      elsif
        Exists (Name => ConversionSystemHTGDL.Encode (TextExtern => WindowsTextExtern)) = False
      then
         ReportingSystemHTGDL.Logic (ReportExtern => "FileSystemChecksHTGDL.StandardChecksReport: Missing: " & WindowsTextExtern);
         return False;
            
      else
         return True;
      end if;
      
   end StandardChecksReport;
   
   
   
   function StandardChecks
     (LinuxTextExtern : in Wide_Wide_String;
      WindowsTextExtern : in Wide_Wide_String)
      return Boolean
   is begin
      
      if
        False = ValidCharacterLength (LinuxTextExtern   => To_Unbounded_Wide_Wide_String (Source => LinuxTextExtern),
                                      WindowsTextExtern => To_Unbounded_Wide_Wide_String (Source => WindowsTextExtern))
      then
         return False;
            
      elsif
        Exists (Name => ConversionSystemHTGDL.Encode (TextExtern => WindowsTextExtern)) = False
      then
         return False;
            
      else
         return True;
      end if;
      
   end StandardChecks;
   
   
   
   function ValidCharacter
     (CharacterExtern : in Wide_Wide_Character)
      return Boolean
   is begin
      
      case
        FileSystemVariablesHTGDL.OperatingSystemQuery
      is
         when OperatingSystemDataTypesHTGDL.Linux_Enum =>
            case
              CharacterExtern
            is
               when '/' | OperatingSystemConstantsHTGDL.NUL =>
                  return False;
            
               when others =>
                  return True;
            end case;
            
         when OperatingSystemDataTypesHTGDL.Windows_Enum =>
            case
              CharacterExtern
            is
               when '\' | '/' | ':' | '*' | '?' | '"' | '<' | '>' | '|' | OperatingSystemConstantsHTGDL.NUL .. OperatingSystemConstantsHTGDL.US =>
                  return False;
            
               when 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | OperatingSystemConstantsHTGDL.Space | OperatingSystemConstantsHTGDL.Hyphen
                  | OperatingSystemConstantsHTGDL.Underscore | OperatingSystemConstantsHTGDL.Point =>
                  return True;
            
               when others =>
                  return False;
            end case;
      end case;
      
   end ValidCharacter;
   
   
   
   function ValidName
     (NameExtern : in Wide_Wide_String)
      return Boolean
   is begin
      
      GeneralLoop:
      for GeneralLoopValue in OperatingSystemConstantsHTGDL.ForbiddenNames'Range loop
        
         if
           NameExtern = OperatingSystemConstantsHTGDL.ForbiddenNames (GeneralLoopValue)
         then
            return False;
            
         else
            null;
         end if;
        
      end loop GeneralLoop;
      
      case
        FileSystemVariablesHTGDL.OperatingSystemQuery
      is
         when OperatingSystemDataTypesHTGDL.Linux_Enum =>
            LinuxChecksLoop:
            for LinuxChecksLoopValue in NameExtern'Range loop
         
               case
                 NameExtern (LinuxChecksLoopValue)
               is
                  when '/' | OperatingSystemConstantsHTGDL.NUL =>
                     return False;
               
                  when others =>
                     null;
               end case;
         
            end loop LinuxChecksLoop;
            
         when OperatingSystemDataTypesHTGDL.Windows_Enum =>
            WindowsChecksLoop:
            for WindowsChecksLoopValue in NameExtern'Range loop
         
               case
                 NameExtern (WindowsChecksLoopValue)
               is
                  when 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | OperatingSystemConstantsHTGDL.Space | OperatingSystemConstantsHTGDL.Hyphen
                     | OperatingSystemConstantsHTGDL.Underscore | OperatingSystemConstantsHTGDL.Point =>
                     null;
                     
                  when '\' | '/' | ':' | '*' | '?' | '"' | '<' | '>' | '|' | OperatingSystemConstantsHTGDL.NUL .. OperatingSystemConstantsHTGDL.US =>
                     return False;
               
                  when others =>
                     return False;
               end case;
         
            end loop WindowsChecksLoop;
      end case;
      
      return True;
      
   end ValidName;
   
   
   
   function NameChecks
     (TextExtern : in Unbounded_Wide_Wide_String)
      return SystemRecordsHTGDL.TextEntryRecord
   is begin
      
      ForbiddenNamesLoop:
      for ForbiddenNamesLoopValue in OperatingSystemConstantsHTGDL.ForbiddenNames'Range loop
         
         if
           TextExtern = OperatingSystemConstantsHTGDL.ForbiddenNames (ForbiddenNamesLoopValue)
         then
            return SystemRecordsConstantsHTGDL.EmptyTextEntry;
         
         else
            null;
         end if;
         
      end loop ForbiddenNamesLoop;
      
      case
        FileSystemVariablesHTGDL.OperatingSystemQuery
      is
         when OperatingSystemDataTypesHTGDL.Linux_Enum =>
            return (True, TextExtern);
            
         when OperatingSystemDataTypesHTGDL.Windows_Enum =>
            return NameChecksWindows (TextExtern => TextExtern);
      end case;
      
   end NameChecks;
   
   
   
   function NameChecksWindows
     (TextExtern : in Unbounded_Wide_Wide_String)
      return SystemRecordsHTGDL.TextEntryRecord
   is
      use Ada.Wide_Wide_Characters.Handling;
   begin
      
      Text := TextExtern;
      
      PointSpaceLoop:
      loop
                  
         if
           To_Wide_Wide_String (Source => Text)'Length = 0
         then
            return SystemRecordsConstantsHTGDL.EmptyTextEntry;
            
         elsif
           -- Full_Stop: Not allowed at the end under Windows!
           OperatingSystemConstantsHTGDL.Point = Element (Source => Text,
                                                          Index  => To_Wide_Wide_String (Source => Text)'Last)
         then
            Text := Ada.Strings.Wide_Wide_Unbounded.Delete (Source  => Text,
                                                            From    => To_Wide_Wide_String (Source => Text)'Last,
                                                            Through => To_Wide_Wide_String (Source => Text)'Last);
            
         elsif
           -- Space: Not allowed at the beginning under Windows!
           OperatingSystemConstantsHTGDL.Space = Element (Source => Text,
                                                                Index  => To_Wide_Wide_String (Source => Text)'First)
         then
            Text := Ada.Strings.Wide_Wide_Unbounded.Delete (Source  => Text,
                                                            From    => To_Wide_Wide_String (Source => Text)'First,
                                                            Through => To_Wide_Wide_String (Source => Text)'First);
            
         elsif
           -- Space: Not allowed at the end under Windows!
           OperatingSystemConstantsHTGDL.Space = Element (Source => Text,
                                                                Index  => To_Wide_Wide_String (Source => Text)'Last)
         then
            Text := Ada.Strings.Wide_Wide_Unbounded.Delete (Source  => Text,
                                                            From    => To_Wide_Wide_String (Source => Text)'Last,
                                                            Through => To_Wide_Wide_String (Source => Text)'Last);
            
         else
            exit PointSpaceLoop;
         end if;
         
      end loop PointSpaceLoop;
      
      
      
      -- At the beginning, every letter is capitalised.
      ForbiddenNamesThreeLoop:
      for ForbiddenNamesThreeLoopValue in OperatingSystemConstantsHTGDL.ForbiddenWindowsNamesThree'Range loop
                                    
         case
           CheckThree (TextExtern          => To_Wide_Wide_String (Source => Text),
                       ForbiddenTextExtern => To_Wide_Wide_String (Source => OperatingSystemConstantsHTGDL.ForbiddenWindowsNamesThree (ForbiddenNamesThreeLoopValue)))
         is
            when False =>
               return SystemRecordsConstantsHTGDL.EmptyTextEntry;
               
            when True =>
               null;
         end case;
         
      end loop ForbiddenNamesThreeLoop;
      
      
      
      -- At the beginning, every letter is capitalised.
      ForbiddenNamesFourLoop:
      for ForbiddenNamesFourLoopValue in OperatingSystemConstantsHTGDL.ForbiddenWindowsNamesFour'Range loop
         
         case
           CheckThree (TextExtern          => To_Wide_Wide_String (Source => Text),
                       ForbiddenTextExtern => To_Wide_Wide_String (Source => OperatingSystemConstantsHTGDL.ForbiddenWindowsNamesFour (ForbiddenNamesFourLoopValue)))
         is
            when False =>
               return SystemRecordsConstantsHTGDL.EmptyTextEntry;
               
            when True =>
               null;
         end case;
         
      end loop ForbiddenNamesFourLoop;
      
      
      
      -- At the beginning, every letter is capitalised.
      ForbiddenNamesFiveLoop:
      for ForbiddenNamesFiveLoopValue in OperatingSystemConstantsHTGDL.ForbiddenWindowsNamesFive'Range loop
         FourLoop:
         for FourLoopValue in Boolean'Range loop
            FiveLoop:
            for FiveLoopValue in Boolean'Range loop
                                    
               FiveText := To_Wide_Wide_String (Source => OperatingSystemConstantsHTGDL.ForbiddenWindowsNamesFive (ForbiddenNamesFiveLoopValue));
               
               case
                 FourLoopValue
               is
                  when True =>
                     FiveText (4) := To_Lower (Item => FiveText) (4);
                        
                  when False =>
                     null;
               end case;
                  
               case
                 FiveLoopValue
               is
                  when True =>
                     FiveText (5) := To_Lower (Item => FiveText) (5);
                        
                  when False =>
                     null;
               end case;
               
               case
                 CheckThree (TextExtern          => To_Wide_Wide_String (Source => Text),
                             ForbiddenTextExtern => FiveText)
               is
                  when False =>
                     return SystemRecordsConstantsHTGDL.EmptyTextEntry;
               
                  when True =>
                     null;
               end case;
                  
            end loop FiveLoop;
         end loop FourLoop;
      end loop ForbiddenNamesFiveLoop;
      
      return (True, Text);
         
   end NameChecksWindows;
   
   
   
   function CheckThree
     (TextExtern : in Wide_Wide_String;
      ForbiddenTextExtern : in Wide_Wide_String)
      return Boolean
   is
      use Ada.Wide_Wide_Characters.Handling;
   begin
      
      TemporaryStorage := ForbiddenTextExtern (ForbiddenTextExtern'First .. ForbiddenTextExtern'First + 2);
      
      OneLoop:
      for OneLoopValue in Boolean'Range loop
         TwoLoop:
         for TwoLoopValue in Boolean'Range loop
            ThreeLoop:
            for ThreeLoopValue in Boolean'Range loop
               
               case
                 OneLoopValue
               is
                  when True =>
                     TemporaryStorage (1) := To_Lower (Item => TemporaryStorage) (1);
                        
                  when False =>
                     null;
               end case;
                  
               case
                 TwoLoopValue
               is
                  when True =>
                     TemporaryStorage (2) := To_Lower (Item => TemporaryStorage) (2);
                        
                  when False =>
                     null;
               end case;
                  
               case
                 ThreeLoopValue
               is
                  when True =>
                     TemporaryStorage (3) := To_Lower (Item => TemporaryStorage) (3);
                        
                  when False =>
                     null;
               end case;
               
               case
                 ForbiddenTextExtern'Length
               is
                  when 3 =>
                     if
                       TextExtern = TemporaryStorage
                     then
                        return False;
            
                     elsif
                       TextExtern'Length > ForbiddenTextExtern'Length
                       and then
                         TextExtern (TextExtern'First .. TextExtern'First - 1 + ForbiddenTextExtern'Length + 1) = TemporaryStorage & "."
                     then
                        return False;
            
                     else
                        null;
                     end if;
                     
                  when 4 =>
                     if
                       TextExtern = TemporaryStorage & ForbiddenTextExtern (ForbiddenTextExtern'Last)
                     then
                        return False;
            
                     elsif
                       TextExtern'Length > ForbiddenTextExtern'Length
                       and then
                         TextExtern (TextExtern'First .. TextExtern'First - 1 + ForbiddenTextExtern'Length + 1) = TemporaryStorage & ForbiddenTextExtern (ForbiddenTextExtern'Last) & "."
                     then
                        return False;
            
                     else
                        null;
                     end if;
                     
                  when 5 =>
                     if
                       TextExtern = TemporaryStorage & ForbiddenTextExtern (ForbiddenTextExtern'Last - 1 .. ForbiddenTextExtern'Last)
                     then
                        return False;
            
                     elsif
                       TextExtern'Length > ForbiddenTextExtern'Length
                       and then
                         TextExtern (TextExtern'First .. TextExtern'First - 1 + ForbiddenTextExtern'Length + 1)
                       = TemporaryStorage & ForbiddenTextExtern (ForbiddenTextExtern'Last - 1 .. ForbiddenTextExtern'Last) & "."
                     then
                        return False;
                                                                                                                                                            
                     else
                        null;
                     end if;
                     
                  when others =>
                     return False;
               end case;
                  
            end loop ThreeLoop;
         end loop TwoLoop;
      end loop OneLoop;
      
      return True;
      
   end CheckThree;

end FileSystemChecksHTGDL;
