package DirectoryConstantsHTGDL is
   pragma Pure;
   
   Save : constant Wide_Wide_String (1 .. 4) := "Save";
   SaveDirectory : constant Wide_Wide_String (1 .. 5) := Save & "/";
   SavePlayer : constant Wide_Wide_String (1 .. 7) := "Manuell";
   SaveAuto : constant Wide_Wide_String (1 .. 4) := "Auto";
   SavePlayerDirectory : constant Wide_Wide_String (1 .. 8) := SavePlayer & "/";
   SaveAutoDirectory : constant Wide_Wide_String (1 .. 5) := SaveAuto & "/";
   
   EmergencySave : constant Wide_Wide_String (1 .. 13) := "EmergencySave";
   
   -- Is here for windows, because windows can have a 255 character limit for paths/filenames.
   DirectorySave : constant Wide_Wide_String (1 .. 1 + SaveDirectory'Length + SavePlayerDirectory'Length) := "/" & SaveDirectory & SavePlayerDirectory;
   
   
   
   Databases : constant Wide_Wide_String (1 .. 9) := "Databases";
   DatenbankenDirectory : constant Wide_Wide_String (1 .. 10) := Databases & "/";
   
   
   
   Settings : constant Wide_Wide_String (1 .. 8) := "Settings";
   SettingsDirectory : constant Wide_Wide_String (1 .. 9) := Settings & "/";
   
   GameSettings : constant Wide_Wide_String (1 .. 21) := SettingsDirectory & "GameSettings";
   GraphicSettings : constant Wide_Wide_String (1 .. 24) := SettingsDirectory & "GraphicSettings";
   SoundSettings : constant Wide_Wide_String (1 .. 22) := SettingsDirectory & "SoundSettings";
   KeyboardSettings : constant Wide_Wide_String (1 .. 25) := SettingsDirectory & "KeyboardSettings";
   EndingSettings : constant Wide_Wide_String (1 .. 23) := SettingsDirectory & "EndingSettings";
      
   
   
   ZeroFile : constant Wide_Wide_String (1 .. 2) := "/0";
   FontFile : constant Wide_Wide_String (ZeroFile'Range) := "/1";
   
   
   
   Graphic : constant Wide_Wide_String (1 .. 7) := "Graphic";
   GraphicDirectory : constant Wide_Wide_String (1 .. 8) := Graphic & "/";
   
   Music : constant Wide_Wide_String (1 .. 5) := "Music";
   MusicDirectory : constant Wide_Wide_String (1 .. 6) := Music & "/";
   
   Sound : constant Wide_Wide_String (1 .. 5) := "Sound";
   SoundDirectory : constant Wide_Wide_String (1 .. 6) := Sound & "/";
   
      
   
   Language : constant Wide_Wide_String (1 .. 8) := "Language";
   LanguageDirectory : constant Wide_Wide_String (1 .. 9) := Language & "/";
   Fonts : constant Wide_Wide_String (1 .. 5) := "Fonts";
   FontsDirectory : constant Wide_Wide_String (1 .. 6) := Fonts & "/";
   
   Microhei : constant Wide_Wide_String (1 .. 16) := "wqy-microhei.ttc";
   Unifont : constant Wide_Wide_String (1 .. 11) := "unifont.otf";
         
end DirectoryConstantsHTGDL;
