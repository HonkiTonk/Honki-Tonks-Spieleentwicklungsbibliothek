package ReportingSystemHTGDL is
   pragma Elaborate_Body;
   
   procedure Logic
     (ReportExtern : in Wide_Wide_String)
     with
       Pre => (
                 ReportExtern'Length > 0
              );
            
   procedure Graphic
     (ReportExtern : in Wide_Wide_String)
     with
       Pre => (
                 ReportExtern'Length > 0
              );
   
   procedure Music
     (ReportExtern : in Wide_Wide_String)
     with
       Pre => (
                 ReportExtern'Length > 0
              );
   
   procedure Sound
     (ReportExtern : in Wide_Wide_String)
     with
       Pre => (
                 ReportExtern'Length > 0
              );
   
   procedure Other
     (ReportExtern : in Wide_Wide_String)
     with
       Pre => (
                 ReportExtern'Length > 0
              );
   
private
   
   LogicError : constant Wide_Wide_String (1 .. 13) := "Logic error: ";
   GraphicError : constant Wide_Wide_String (1 .. 15) := "Graphic error: ";
   MusicError : constant Wide_Wide_String (1 .. 13) := "Music error: ";
   SoundError : constant Wide_Wide_String (1 .. 13) := "Sound error: ";
   OtherError : constant Wide_Wide_String (1 .. 13) := "Other error: ";
   
   LogicStop : exception;
   GraphicStop : exception;
   MusicStop : exception;
   SoundStop : exception;
   OtherStop : exception;

end ReportingSystemHTGDL;
