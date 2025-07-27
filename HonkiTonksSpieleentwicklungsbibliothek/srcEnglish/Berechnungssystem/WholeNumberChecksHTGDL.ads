package WholeNumberChecksHTGDL is
   pragma Pure;

   generic type WholeNumber is range <>;
   
   function AdditionSubtraction
     (BaseValueExtern : in WholeNumber;
      AddedValueExtern : in WholeNumber)
      return WholeNumber;

   generic type WholeNumber is range <>;
   
   function AdditionSubtractionNatural
     (BaseValueExtern : in WholeNumber;
      AddedValueExtern : in WholeNumber)
      return WholeNumber;

   generic type WholeNumber is range <>;
   
   function AdditionSubtractionPositive
     (BaseValueExtern : in WholeNumber;
      AddedValueExtern : in WholeNumber)
      return WholeNumber;

   generic type WholeNumber is range <>;
   
   function Multiplication
     (BaseValueExtern : in WholeNumber;
      MultiplierExtern : in WholeNumber)
      return WholeNumber;

end WholeNumberChecksHTGDL;
