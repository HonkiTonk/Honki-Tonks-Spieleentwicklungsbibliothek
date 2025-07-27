package body RandomGeneratorsHTGDL is

  function CoinToss
     return Boolean
   is begin
      
      Coin.Reset (Gen => TossedCoin);
      return Coin.Random (Gen => TossedCoin);
      
   end CoinToss;
   
   
   
   function PredefinedNumberRange
     (BeginningExtern : in Integer;
      EndingExtern : in Integer)
      return Integer
   is begin
      
      if
        BeginningExtern > EndingExtern
      then
         Beginning := EndingExtern;
         Ending := BeginningExtern;
         
      else
         Beginning := BeginningExtern;
         Ending := EndingExtern;
      end if;
      
      NumberRange.Reset (Gen => SelectedNumber);
      
      return NumberRange.Random (Gen   => SelectedNumber,
                                 First => Beginning,
                                 Last  => Ending);
      
   end PredefinedNumberRange;
   
   
   
   function AchievedSuccesses
     (DicePoolExtern : in WholeNumber)
      return Natural
   is begin
      
      NumberSuccesses := EmptySuccesses;
      Dice.Reset (Gen => DiceRoll);
      
      DiceLoop:
      for DiceLoopValue in 1 .. DicePoolExtern loop
         
         case
           Dice.Random (Gen => DiceRoll)
         is
            when RandomGeneratorsDataTypeHTGDL.CriticalFailure'Range =>
               NumberSuccesses := NumberSuccesses - 1;
               
            when RandomGeneratorsDataTypeHTGDL.NormalFailure =>
               null;
               
            when RandomGeneratorsDataTypeHTGDL.NormalSuccess =>
               NumberSuccesses := NumberSuccesses + 1;
               
            when RandomGeneratorsDataTypeHTGDL.CriticalSuccess =>
               NumberSuccesses := NumberSuccesses + 2;
         end case;
         
      end loop DiceLoop;
      
      if
        NumberSuccesses < EmptySuccesses
      then
         return EmptySuccesses;
         
      else
         return NumberSuccesses;
      end if;
      
   end AchievedSuccesses;

end RandomGeneratorsHTGDL;
