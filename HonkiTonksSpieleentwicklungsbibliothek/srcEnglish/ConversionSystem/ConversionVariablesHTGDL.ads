with Ada.Strings.UTF_Encoding.Wide_Wide_Strings; use Ada.Strings.UTF_Encoding.Wide_Wide_Strings;

with OperatingSystemDataTypesHTGDL;

package ConversionVariablesHTGDL is
   pragma Elaborate_Body;

   procedure ChangeEncoding
     (EncodingExtern : in OperatingSystemDataTypesHTGDL.Encoding_Enum);
   pragma Inline (ChangeEncoding);
   
   procedure ChangeSeparator
     (SeparatorExtern : in Wide_Wide_Character);
   pragma Inline (ChangeSeparator);
   
   
   
   function EncodingQuery
     return Ada.Strings.UTF_Encoding.Encoding_Scheme;
   pragma Inline (EncodingQuery);
   
   function SeparatorQuery
     return Wide_Wide_Character;
   pragma Inline (SeparatorQuery);
   
private
   
   Separator : Wide_Wide_Character := ',';
   
   Encoding : Ada.Strings.UTF_Encoding.Encoding_Scheme := Ada.Strings.UTF_Encoding.UTF_8;
   
   -- This is only here so that "pragma Restrictions (No_Implementation_Units)" can be used in "Local Pragmas".
   Test : constant Wide_Wide_String (1 .. 1) := Decode (Item         => "1",
                                                        Input_Scheme => Ada.Strings.UTF_Encoding.UTF_8);

end ConversionVariablesHTGDL;
