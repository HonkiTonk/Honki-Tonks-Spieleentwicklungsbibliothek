with Ada.Wide_Wide_Text_IO; use Ada.Wide_Wide_Text_IO;

with ReportWritingHTGDL;
with ReportVariablesHTGDL;

package body ReportingSystemHTGDL is

   procedure Logic
     (ReportExtern : in Wide_Wide_String)
   is begin
      
      ReportWritingHTGDL.ReportUTF (ReportExtern => LogicError & ReportExtern);
      
      case
        ReportVariablesHTGDL.ErrorMessageQuery
      is
         when True =>
            Put_Line (Item => LogicError & ReportExtern);
            raise LogicStop;
            
         when False =>
            null;
      end case;
      
   end Logic;
   
   
   
   procedure Graphic
     (ReportExtern : in Wide_Wide_String)
   is begin
         
      ReportWritingHTGDL.ReportUTF (ReportExtern => GraphicError & ReportExtern);
      
      case
        ReportVariablesHTGDL.ErrorMessageQuery
      is
         when True =>
            Put_Line (Item => GraphicError & ReportExtern);
            raise GraphicStop;
            
         when False =>
            null;
      end case;
      
   end Graphic;
   
   
   
   procedure Music
     (ReportExtern : in Wide_Wide_String)
   is begin
      
      ReportWritingHTGDL.ReportUTF (ReportExtern => MusicError & ReportExtern);
      
      case
        ReportVariablesHTGDL.ErrorMessageQuery
      is
         when True =>
            Put_Line (Item => MusicError & ReportExtern);
            raise MusicStop;
            
         when False =>
            null;
      end case;
      
   end Music;
   
   
   
   procedure Sound
     (ReportExtern : in Wide_Wide_String)
   is begin
      
      ReportWritingHTGDL.ReportUTF (ReportExtern => SoundError & ReportExtern);
      
      case
        ReportVariablesHTGDL.ErrorMessageQuery
      is
         when True =>
            Put_Line (Item => SoundError & ReportExtern);
            raise SoundStop;
            
         when False =>
            null;
      end case;
      
   end Sound;
   
   
   
   procedure Other
     (ReportExtern : in Wide_Wide_String)
   is begin
      
      ReportWritingHTGDL.ReportUTF (ReportExtern => OtherError & ReportExtern);
      
      case
        ReportVariablesHTGDL.ErrorMessageQuery
      is
         when True =>
            Put_Line (Item => OtherError & ReportExtern);
            raise OtherStop;
            
         when False =>
            null;
      end case;
      
   end Other;

end ReportingSystemHTGDL;
