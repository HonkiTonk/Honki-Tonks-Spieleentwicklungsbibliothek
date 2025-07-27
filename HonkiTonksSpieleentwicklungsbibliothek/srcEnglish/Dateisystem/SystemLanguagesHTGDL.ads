with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

private with Ada.Locales;

private with OperatingSystemDataTypesHTGDL;

package SystemLanguagesHTGDL is
   pragma Elaborate_Body;
   
   function SystemLanguage
     return Unbounded_Wide_Wide_String;
   
private

   LocalLanguage : Ada.Locales.Language_Code;

   type Languagenecord is record

      ISONumber : Ada.Locales.Language_Code;

      Language : Unbounded_Wide_Wide_String;

   end record;

   type StandardLanguagesArray is array (OperatingSystemDataTypesHTGDL.Standard_Languages_Enum'Range) of Languagenecord;
   StandardLanguages : constant StandardLanguagesArray := (
                                                           OperatingSystemDataTypesHTGDL.Arabic_Enum =>
                                                             (
                                                              ISONumber => "aao",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Arabic")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Chinese_Simplified_Enum =>
                                                             (
                                                              ISONumber => "cmn",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Chinese_Simplified")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Danish_Enum =>
                                                             (
                                                              ISONumber => "dan",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Dansk")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.German_Enum =>
                                                             (
                                                              ISONumber => "deu",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Deutsch")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.English_Enum =>
                                                             (
                                                              ISONumber => "eng",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "English")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Spanish_Enum =>
                                                             (
                                                              ISONumber => "spa",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Espanol")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.French_Enum =>
                                                             (
                                                              ISONumber => "fra",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Francais")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Greek_Enum =>
                                                             (
                                                              ISONumber => "gmy",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Greek")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Indonesian_Enum =>
                                                             (
                                                              ISONumber => "ind",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Indonesia")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Italian_Enum =>
                                                             (
                                                              ISONumber => "ita",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Italiano")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Japanese_Enum =>
                                                             (
                                                              ISONumber => "jpn",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Japanese")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Korean_Enum =>
                                                             (
                                                              ISONumber => "kor",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Korean")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Dutch_Enum =>
                                                             (
                                                              ISONumber => "nld",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Nederlands")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Norwegian_Enum =>
                                                             (
                                                              ISONumber => "nor",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Norsk")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Polish_Enum =>
                                                             (
                                                              ISONumber => "pol",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Polska")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Portuguese_Enum =>
                                                             (
                                                              ISONumber => "por",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Portugues")
                                                             ),

                                                           OperatingSystemDataTypesHTGDL.Ukrainian_Enum =>
                                                             (
                                                              ISONumber => "ukr",
                                                              Language   => To_Unbounded_Wide_Wide_String (Source => "Ukrainian")
                                                             ));
   
   
   
   function ExistenceCheck
     (FolderNameExtern : in Unbounded_Wide_Wide_String)
      return Unbounded_Wide_Wide_String
     with
       Pre => (
                 To_Wide_Wide_String (Source => FolderNameExtern)'Length > 0
              );

end SystemLanguagesHTGDL;
