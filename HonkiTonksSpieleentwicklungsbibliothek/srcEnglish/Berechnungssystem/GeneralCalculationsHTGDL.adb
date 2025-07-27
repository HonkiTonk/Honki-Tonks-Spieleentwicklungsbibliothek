with SystemConstantsHTGDL;

package body GeneralCalculationsHTGDL is

   function BaseTimeValue
     (AddedValueExtern : in WholeNumber;
      DivisorExtern : in WholeNumber)
      return WholeNumber
   is begin
      
      return (AddedValueExtern + (DivisorExtern - 1)) / DivisorExtern;
      
   end BaseTimeValue;
   
   
   
   function ZeroCheckDecimalNumber
     (DecimalNumberExtern : in Float)
      return Float
   is begin
      
      if
        DecimalNumberExtern = SystemConstantsHTGDL.DecimalNumberZeroValue
      then
         return SystemConstantsHTGDL.DecimalNumberOneValue;
         
      else
         return DecimalNumberExtern;
      end if;
      
   end ZeroCheckDecimalNumber;
   
   
   
   function ZeroCheck
     (NumberExtern : in Integer)
      return Integer
   is begin
      
      if
        NumberExtern = SystemConstantsHTGDL.ZeroValue
      then
         return SystemConstantsHTGDL.OneValue;
         
      else
         return NumberExtern;
      end if;
      
   end ZeroCheck;
   
end GeneralCalculationsHTGDL;
