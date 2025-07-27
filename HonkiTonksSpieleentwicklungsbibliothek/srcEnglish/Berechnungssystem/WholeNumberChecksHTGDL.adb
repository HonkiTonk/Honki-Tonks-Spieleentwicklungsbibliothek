package body WholeNumberChecksHTGDL is

   function AdditionSubtraction
     (BaseValueExtern : in WholeNumber;
      AddedValueExtern : in WholeNumber)
      return WholeNumber
   is begin
      
      if
        AddedValueExtern > 0
        and then
          BaseValueExtern > WholeNumber'Last - AddedValueExtern
      then
         return WholeNumber'Last;
         
      elsif
        AddedValueExtern < 0
        and then
          BaseValueExtern < WholeNumber'First - AddedValueExtern
      then
         return WholeNumber'First;
         
      else
         return BaseValueExtern + AddedValueExtern;
      end if;
            
   end AdditionSubtraction;
   
   
   
   function AdditionSubtractionNatural
     (BaseValueExtern : in WholeNumber;
      AddedValueExtern : in WholeNumber)
      return WholeNumber
   is begin
      
      if
        AddedValueExtern > 0
      then
         if
           BaseValueExtern > WholeNumber'Last - AddedValueExtern
         then
            return WholeNumber'Last;
         
         elsif
           BaseValueExtern + AddedValueExtern < 0
         then
            return 0;
            
         else
            null;
         end if;
         
      elsif
        AddedValueExtern < 0
        and then
          BaseValueExtern < 0 - AddedValueExtern
      then
         return 0;
      
      else
         null;
      end if;
      
      return BaseValueExtern + AddedValueExtern;
      
   end AdditionSubtractionNatural;
   
   
   
   function AdditionSubtractionPositive
     (BaseValueExtern : in WholeNumber;
      AddedValueExtern : in WholeNumber)
      return WholeNumber
   is begin
      
      if
        AddedValueExtern > 0
      then
         if
           BaseValueExtern > WholeNumber'Last - AddedValueExtern
         then
            return WholeNumber'Last;
         
         elsif
           BaseValueExtern + AddedValueExtern < 1
         then
            return 1;
            
         else
            null;
         end if;
         
      elsif
        AddedValueExtern < 0
        and then
          BaseValueExtern < 1 - AddedValueExtern
      then
         return 1;
         
      else
         null;
      end if;
      
      return BaseValueExtern + AddedValueExtern;
      
   end AdditionSubtractionPositive;
   
   
   
   function Multiplication
     (BaseValueExtern : in WholeNumber;
      MultiplierExtern : in WholeNumber)
      return WholeNumber
   is begin
      
      case
        MultiplierExtern
      is
         when 0 =>
            null;
            
         when others =>
            if
              BaseValueExtern > WholeNumber'Last / MultiplierExtern
            then
               return WholeNumber'Last;
            
            elsif
              BaseValueExtern < WholeNumber'First / MultiplierExtern
            then
               return WholeNumber'First;
         
            else
               null;
            end if;
      end case;
      
      return BaseValueExtern * MultiplierExtern;
      
   end Multiplication;

end WholeNumberChecksHTGDL;
