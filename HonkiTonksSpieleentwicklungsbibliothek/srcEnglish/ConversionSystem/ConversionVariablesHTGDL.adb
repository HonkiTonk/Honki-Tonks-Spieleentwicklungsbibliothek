package body ConversionVariablesHTGDL is

   procedure ChangeEncoding
     (EncodingExtern : in OperatingSystemDataTypesHTGDL.Encoding_Enum)
   is begin
      
      case
        EncodingExtern
      is
         when OperatingSystemDataTypesHTGDL.UTF8_Enum =>
            Encoding := Ada.Strings.UTF_Encoding.UTF_8;
            
         when OperatingSystemDataTypesHTGDL.UTF16BE_Enum =>
            Encoding := Ada.Strings.UTF_Encoding.UTF_16BE;
            
         when OperatingSystemDataTypesHTGDL.UTF16LE_Enum =>
            Encoding := Ada.Strings.UTF_Encoding.UTF_16LE;
      end case;
            
   end ChangeEncoding;
   
   
   
   procedure ChangeSeparator
     (SeparatorExtern : in Wide_Wide_Character)
   is begin
      
      Separator := SeparatorExtern;
      
   end ChangeSeparator;
   
   
   
   function EncodingQuery
     return Ada.Strings.UTF_Encoding.Encoding_Scheme
   is begin
      
      return Encoding;
      
   end EncodingQuery;
   
   
   
   function SeparatorQuery
     return Wide_Wide_Character
   is begin
      
      return Separator;
      
   end SeparatorQuery;

end ConversionVariablesHTGDL;
