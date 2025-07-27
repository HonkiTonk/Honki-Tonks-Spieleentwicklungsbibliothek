package OperatingSystemDataTypesHTGDL is
   pragma Pure;

   type Operating_System_Enum is (
                                 Linux_Enum,
                                
                                 Windows_Enum
                                );

   type Encoding_Enum is (
                           UTF8_Enum, UTF16BE_Enum, UTF16LE_Enum
                          );
   
   type Standard_Languages_Enum is (
                                    Arabic_Enum, Chinese_Simplified_Enum, Danish_Enum, German_Enum, English_Enum, Spanish_Enum, French_Enum, Greek_Enum, Indonesian_Enum, Italian_Enum,
                                    Japanese_Enum, Korean_Enum, Dutch_Enum, Norwegian_Enum, Polish_Enum, Portuguese_Enum, Ukrainian_Enum
                                   );

end OperatingSystemDataTypesHTGDL;
