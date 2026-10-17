private with Ada.Numerics.Discrete_Random;

with SystemDataTypesHTGDL;

private with RandomGeneratorsDataTypeHTGDL;

package RandomGeneratorsHTGDL is
   pragma Elaborate_Body;

   function CoinToss
     return Boolean;
   
   function PredefinedNumberRange
     (BeginningExtern : in Integer;
      EndingExtern : in Integer)
      return Integer;
   
   generic type WholeNumber is range <>;
   
   function AchievedSuccesses
     (DicePoolExtern : in WholeNumber)
      return Natural;

   function HundredRange
     return SystemDataTypesHTGDL.ZeroToHundred;
   
private
   
   EmptySuccesses : constant Natural := 0;
   
   NumberSuccesses : Integer;
   Beginning : Integer;
   Ending : Integer;
   
   package Coin is new Ada.Numerics.Discrete_Random (Result_Subtype => Boolean);
   
   package Dice is new Ada.Numerics.Discrete_Random (Result_Subtype => RandomGeneratorsDataTypeHTGDL.Valuation_Enum);
   
   package Hundred is new Ada.Numerics.Discrete_Random (Result_Subtype => SystemDataTypesHTGDL.ZeroToHundred);

   package NumberRange is new Ada.Numerics.Discrete_Random (Result_Subtype => Integer);
   
   TossedCoin : Coin.Generator;
   
   DiceRoll : Dice.Generator;
   
   HundredNumber : Hundred.Generator;
   
   SelectedNumber : NumberRange.Generator;

end RandomGeneratorsHTGDL;
