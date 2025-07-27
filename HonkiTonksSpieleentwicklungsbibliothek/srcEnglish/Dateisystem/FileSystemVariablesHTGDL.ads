with OperatingSystemDataTypesHTGDL;

package FileSystemVariablesHTGDL is
   pragma Preelaborate;

   procedure ChangeFileFormat
     (FileFormatExtern : in Character);
   pragma Inline (ChangeFileFormat);
   
   procedure ChangeOperatingSystem
     (OperatingSystemExtern : in OperatingSystemDataTypesHTGDL.Operating_System_Enum);
   pragma Inline (ChangeOperatingSystem);
   
   
   
   function FileFormatQuery
     return String
     with
       Post => (
                  FileFormatQuery'Result'Length = 6
                and
                  FileFormatQuery'Result (1 .. 5) = "WCEM="
               );
   pragma Inline (FileFormatQuery);
   
   function OperatingSystemQuery
     return OperatingSystemDataTypesHTGDL.Operating_System_Enum;
   pragma Inline (OperatingSystemQuery);
   
private
   
   OperatingSystem : OperatingSystemDataTypesHTGDL.Operating_System_Enum := OperatingSystemDataTypesHTGDL.Linux_Enum;
   
   FileFormat : String (1 .. 6) := "WCEM=8";

end FileSystemVariablesHTGDL;
