package GeneralCalculationsHTGDL is
   pragma Pure;

   generic type WholeNumber is range <>;

   function BaseTimeValue
     (AddedValueExtern : in WholeNumber;
      DivisorExtern : in WholeNumber)
      return WholeNumber
     with
       Pre => (
                 AddedValueExtern > 0
               and
                 DivisorExtern > 0
              ),

       Post => (
                  BaseTimeValue'Result > 0
               );
   
   function ZeroCheckDecimalNumber
     (DecimalNumberExtern : in Float)
      return Float
     with
       Post => (
                  ZeroCheckDecimalNumber'Result /= 0.00
               );
   
   function ZeroCheck
     (NumberExtern : in Integer)
      return Integer
     with
       Post => (
                  ZeroCheck'Result /= 0
               );

end GeneralCalculationsHTGDL;
