package RandomGeneratorsDataTypeHTGDL is
   pragma Pure;

   type Valuation_Enum is (
                           Valuation_One_Enum, Valuation_Two_Enum, Valuation_Three_Enum, Valuation_Four_Enum, Valuation_Five_Enum,
                           
                           Valuation_Six_Enum, Valuation_Seven_Enum, Valuation_Eight_Enum, Valuation_Nine_Enum, Valuation_Ten_Enum
                          );
   pragma Ordered (Valuation_Enum);
   
   subtype Failure is Valuation_Enum range Valuation_One_Enum .. Valuation_Five_Enum;
   subtype NormalFailure is Failure range Valuation_Two_Enum .. Valuation_Five_Enum;
   subtype CriticalFailure is Failure range Valuation_One_Enum .. Valuation_One_Enum;
   
   subtype Success is Valuation_Enum range Valuation_Six_Enum .. Valuation_Ten_Enum;
   subtype NormalSuccess is Success range Valuation_Six_Enum .. Valuation_Nine_Enum;
   subtype CriticalSuccess is Success range Valuation_Ten_Enum .. Valuation_Ten_Enum;

end RandomGeneratorsDataTypeHTGDL;
