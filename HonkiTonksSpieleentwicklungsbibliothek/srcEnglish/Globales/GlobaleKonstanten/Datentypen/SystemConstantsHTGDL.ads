with SystemDataTypesHTGDL;

package SystemConstantsHTGDL is
   pragma Pure;
   
   ZeroValue : constant SystemDataTypesHTGDL.OwnNatural := SystemDataTypesHTGDL.OwnNatural'First;
   OneValue : constant SystemDataTypesHTGDL.OwnPositive := SystemDataTypesHTGDL.OwnPositive'First;
   
   DecimalNumberZeroValue : constant Float := 0.00;
   DecimalNumberOneValue : constant Float := 1.00;
   
   EmptyOneByte : constant SystemDataTypesHTGDL.OneByte := 0;
   EmptyTwoByte : constant SystemDataTypesHTGDL.TwoByte := 0;
   EmptyFourByte : constant SystemDataTypesHTGDL.FourByte := 0;
   
   EmptyOneByteSign : constant SystemDataTypesHTGDL.OneByteSign := 0;
   EmptyTwoByteSign : constant SystemDataTypesHTGDL.TwoByteSign := 0;

end SystemConstantsHTGDL;
