package body DecimalNumberChecksHTGDL is
   
   function AdditionSubtraction
     (BaseValueExtern : in DecimalNumber;
      AddedValueExtern : in DecimalNumber)
      return DecimalNumber
   is begin
      
      if
        AddedValueExtern > 0.00
        and then
          BaseValueExtern > DecimalNumber'Last - AddedValueExtern
      then
         return DecimalNumber'Last;
         
      elsif
        AddedValueExtern < 0.00
        and then
          BaseValueExtern < DecimalNumber'First - AddedValueExtern
      then
         return DecimalNumber'First;
         
      else
         return BaseValueExtern + AddedValueExtern;
      end if;
      
   end AdditionSubtraction;
   
   
   
   function AdditionSubtractionNatural
     (BaseValueExtern : in DecimalNumber;
      AddedValueExtern : in DecimalNumber)
      return DecimalNumber
   is begin
      
      if
        AddedValueExtern > 0.00
      then
         if
           BaseValueExtern > DecimalNumber'Last - AddedValueExtern
         then
            return DecimalNumber'Last;
         
         elsif
           BaseValueExtern + AddedValueExtern < 0.00
         then
            return 0.00;
            
         else
            null;
         end if;
         
      elsif
        AddedValueExtern < 0.00
        and then
          BaseValueExtern < 0.00 - AddedValueExtern
      then
         return 0.00;
      
      else
         null;
      end if;
      
      return BaseValueExtern + AddedValueExtern;
      
   end AdditionSubtractionNatural;
   
   
   
   function AdditionSubtractionPositive
     (BaseValueExtern : in DecimalNumber;
      AddedValueExtern : in DecimalNumber)
      return DecimalNumber
   is begin
      
      if
        AddedValueExtern > 0.00
      then
         if
           BaseValueExtern > DecimalNumber'Last - AddedValueExtern
         then
            return DecimalNumber'Last;
         
         elsif
           BaseValueExtern + AddedValueExtern < 1.00
         then
            return 1.00;
            
         else
            null;
         end if;
         
      elsif
        AddedValueExtern < 0.00
        and then
          BaseValueExtern < 1.00 - AddedValueExtern
      then
         return 1.00;
         
      else
         null;
      end if;
      
      return BaseValueExtern + AddedValueExtern;
      
   end AdditionSubtractionPositive;
   
   

   function Multiplication
     (BaseValueExtern : in DecimalNumber;
      MultiplierExtern : in DecimalNumber)
      return DecimalNumber
   is begin
      
      if
        MultiplierExtern /= 0.00
      then
         if
           BaseValueExtern > DecimalNumber'Last / MultiplierExtern
         then
            return DecimalNumber'Last;
            
         elsif
           BaseValueExtern < DecimalNumber'First / MultiplierExtern
         then
            return DecimalNumber'First;
         
         else
            null;
         end if;
         
      else
         null;
      end if;
      
      return BaseValueExtern * MultiplierExtern;
      
   end Multiplication;

end DecimalNumberChecksHTGDL;
