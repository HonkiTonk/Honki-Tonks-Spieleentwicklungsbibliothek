package body FileSystemVariablesHTGDL is

   procedure ChangeFileFormat
     (FileFormatExtern : in Character)
   is begin
      
      case
        FileFormatExtern
      is
         when 'h' | 'u' | 's' | 'e' | '8' | 'b' =>
            FileFormat (6) := FileFormatExtern;
            
         when others =>
            null;
      end case;
      
   end ChangeFileFormat;
   
   
   
   procedure ChangeOperatingSystem
     (OperatingSystemExtern : in OperatingSystemDataTypesHTGDL.Operating_System_Enum)
   is begin
      
      OperatingSystem := OperatingSystemExtern;
      
   end ChangeOperatingSystem;
   
   
   
   function FileFormatQuery
     return String
   is begin
      
      return FileFormat;
      
   end FileFormatQuery;
   
   
   
   function OperatingSystemQuery
     return OperatingSystemDataTypesHTGDL.Operating_System_Enum
   is begin
      
      return OperatingSystem;
      
   end OperatingSystemQuery;

end FileSystemVariablesHTGDL;
