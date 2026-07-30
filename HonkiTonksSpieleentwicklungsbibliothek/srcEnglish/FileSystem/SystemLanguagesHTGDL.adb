with Ada.Directories;

with TextConstantsHTGDL;

with ConversionSystemHTGDL;

package body SystemLanguagesHTGDL is

   function SystemLanguage
     return Unbounded_Wide_Wide_String
   is
      use Ada.Locales;
   begin
      
      LocalLanguage := Ada.Locales.Language;
      
      if
        LocalLanguage = Ada.Locales.Language_Unknown
      then
         return TextConstantsHTGDL.EmptyUnboundedString;
         
      else
         null;
      end if;
      
      LanguagesLoop:
      for LanguagesLoopValue in StandardLanguagesArray'Range loop
         
         if
           LocalLanguage = StandardLanguages (LanguagesLoopValue).ISONumber
         then
            return ExistenceCheck (FolderNameExtern => StandardLanguages (LanguagesLoopValue).Language);
            
         else
            null;
         end if;
         
      end loop LanguagesLoop;
            
      return TextConstantsHTGDL.EmptyUnboundedString;
      
   end SystemLanguage;
   
   
   
   function ExistenceCheck
     (FolderNameExtern : in Unbounded_Wide_Wide_String)
     return Unbounded_Wide_Wide_String
   is
      use Ada.Directories;
   begin
      
      case
        Exists (Name => "Languages/" & ConversionSystemHTGDL.EncodeUnbounded (TextExtern => FolderNameExtern))
      is
         when True =>
            return FolderNameExtern;
            
         when False =>
            return TextConstantsHTGDL.EmptyUnboundedString;
      end case;
      
   end ExistenceCheck;

end SystemLanguagesHTGDL;
