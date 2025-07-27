package DecimalNumberChecksHTGDL is
   pragma Pure;
   
   generic type DecimalNumber is digits <>;
   
   function AdditionSubtraction
     (BaseValueExtern : in DecimalNumber;
      AddedValueExtern : in DecimalNumber)
      return DecimalNumber;

   generic type DecimalNumber is digits <>;
   
   function AdditionSubtractionNatural
     (BaseValueExtern : in DecimalNumber;
      AddedValueExtern : in DecimalNumber)
      return DecimalNumber;

   generic type DecimalNumber is digits <>;
   
   function AdditionSubtractionPositive
     (BaseValueExtern : in DecimalNumber;
      AddedValueExtern : in DecimalNumber)
      return DecimalNumber;

   generic type DecimalNumber is digits <>;

   function Multiplication
     (BaseValueExtern : in DecimalNumber;
      MultiplierExtern : in DecimalNumber)
      return DecimalNumber;

end DecimalNumberChecksHTGDL;
