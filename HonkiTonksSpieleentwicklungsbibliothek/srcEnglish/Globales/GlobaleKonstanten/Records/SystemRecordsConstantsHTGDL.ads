with SystemRecordsHTGDL;
with TextConstantsHTGDL;

package SystemRecordsConstantsHTGDL is
   pragma Elaborate_Body;

   EmptyTextEntry : constant SystemRecordsHTGDL.TextEntryRecord := (
                                                                      SuccessfulAbortion => False,
                                                                      TextEntry          => TextConstantsHTGDL.EmptyUnboundedString
                                                                     );

   EmptyNumberEntry : constant SystemRecordsHTGDL.NumberEntryRecord := (
                                                                          SuccessfulAbortion => False,
                                                                          NumberEntry        => 0
                                                                         );

end SystemRecordsConstantsHTGDL;
