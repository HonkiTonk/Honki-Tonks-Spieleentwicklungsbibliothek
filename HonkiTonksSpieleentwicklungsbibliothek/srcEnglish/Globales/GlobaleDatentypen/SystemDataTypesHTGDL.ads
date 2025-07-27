package SystemDataTypesHTGDL is
   pragma Pure;

   type Player_Enum is (
                        Empty_Player_Enum,
                         
                        Human_Player_Enum,
                        AI_Player_Enum
                       );
   pragma Ordered (Player_Enum);
   
   subtype Player_Occupied_Enum is Player_Enum range Player_Enum'Succ (Player_Enum'First) .. Player_Enum'Last;
   
   
   
   type Start_End_Enum is (
                           Start_Enum, End_Enum
                          );
   
   
   
   type Extended_Boolean_Enum is (
                                  True_Enum, Neutral_Enum, False_Enum
                                 );
   
   
   
   type Save_File_Enum is (
                           Manual_Save_File_Enum,
                           Automatic_Save_File_Enum
                          );
   
   
      
   type ZeroToHundred is range 0 .. 100;
   subtype OneToHundred is ZeroToHundred range 1 .. ZeroToHundred'Last;
   
   subtype LoadingTime is Float range 0.00 .. 100.00;
   subtype LoadingTimeExisting is LoadingTime range 1.00 .. LoadingTime'Last;
   
   
   
   subtype OwnInteger is Integer range -1_000_000_000 .. 1_000_000_000;
   subtype OwnNatural is OwnInteger range 0 .. OwnInteger'Last;
   subtype OwnPositive is OwnNatural range 1 .. OwnNatural'Last;
   subtype OwnNegative is OwnInteger range OwnInteger'First .. -1;
   
   
   
   type OneByte is mod 2**8;
   type TwoByte is mod 2**16;
   type FourByte is mod 2**32;
   
   type OneByteSign is range -128 .. 127;
   type TwoByteSign is range -32_768 .. 32_767;

end SystemDataTypesHTGDL;
