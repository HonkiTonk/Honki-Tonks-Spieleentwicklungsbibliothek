with SystemDataTypesHTGDL;

package NumberRecordsHTSEB is
   pragma Pure;

   type ProbabilityRangeRecord is record
      
      StartProbability : SystemDataTypesHTGDL.ZeroToHundred;
      EndProbability : SystemDataTypesHTGDL.ZeroToHundred;
      
   end record;

end NumberRecordsHTSEB;
