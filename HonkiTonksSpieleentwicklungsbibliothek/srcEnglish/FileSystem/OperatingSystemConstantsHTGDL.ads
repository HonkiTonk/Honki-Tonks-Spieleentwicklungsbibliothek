with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;

with ArraysHTGDL;

package OperatingSystemConstantsHTGDL is
   pragma Elaborate_Body;
   
   -- General
   MaximaleZeichenlängeDateisystem : constant Positive := 255;
   
   -- The following characters are copies from Ada.Characters.Wide_Wide_Latin_1 and are required to use the local pragma "pragma Restrictions (No_Implementation_Units)"!
   NUL : constant Wide_Wide_Character := Wide_Wide_Character'Val (0);
   SOH : constant Wide_Wide_Character := Wide_Wide_Character'Val (1);
   STX : constant Wide_Wide_Character := Wide_Wide_Character'Val (2);
   ETX : constant Wide_Wide_Character := Wide_Wide_Character'Val (3);
   EOT : constant Wide_Wide_Character := Wide_Wide_Character'Val (4);
   ENQ : constant Wide_Wide_Character := Wide_Wide_Character'Val (5);
   ACK : constant Wide_Wide_Character := Wide_Wide_Character'Val (6);
   BEL : constant Wide_Wide_Character := Wide_Wide_Character'Val (7);
   BS : constant Wide_Wide_Character := Wide_Wide_Character'Val (8);
   HT : constant Wide_Wide_Character := Wide_Wide_Character'Val (9);
   LF : constant Wide_Wide_Character := Wide_Wide_Character'Val (10);
   VT : constant Wide_Wide_Character := Wide_Wide_Character'Val (11);
   FF : constant Wide_Wide_Character := Wide_Wide_Character'Val (12);
   CR : constant Wide_Wide_Character := Wide_Wide_Character'Val (13);
   SO : constant Wide_Wide_Character := Wide_Wide_Character'Val (14);
   SI : constant Wide_Wide_Character := Wide_Wide_Character'Val (15);

   DLE : constant Wide_Wide_Character := Wide_Wide_Character'Val (16);
   DC1 : constant Wide_Wide_Character := Wide_Wide_Character'Val (17);
   DC2 : constant Wide_Wide_Character := Wide_Wide_Character'Val (18);
   DC3 : constant Wide_Wide_Character := Wide_Wide_Character'Val (19);
   DC4 : constant Wide_Wide_Character := Wide_Wide_Character'Val (20);
   NAK : constant Wide_Wide_Character := Wide_Wide_Character'Val (21);
   SYN : constant Wide_Wide_Character := Wide_Wide_Character'Val (22);
   ETB : constant Wide_Wide_Character := Wide_Wide_Character'Val (23);
   CAN : constant Wide_Wide_Character := Wide_Wide_Character'Val (24);
   EM : constant Wide_Wide_Character := Wide_Wide_Character'Val (25);
   SUB : constant Wide_Wide_Character := Wide_Wide_Character'Val (26);
   ESC : constant Wide_Wide_Character := Wide_Wide_Character'Val (27);
   FS : constant Wide_Wide_Character := Wide_Wide_Character'Val (28);
   GS : constant Wide_Wide_Character := Wide_Wide_Character'Val (29);
   RS : constant Wide_Wide_Character := Wide_Wide_Character'Val (30);
   US : constant Wide_Wide_Character := Wide_Wide_Character'Val (31);
   DEL : constant Wide_Wide_Character := Wide_Wide_Character'Val (127);
   
   Space : constant Wide_Wide_Character := ' ';
   Hyphen : constant Wide_Wide_Character := '-';
   Underscore : constant Wide_Wide_Character := '_';
   Point : constant Wide_Wide_Character := '.';
   
   ForbiddenNames : constant ArraysHTGDL.GeneralTextArray (1 .. 2) := (
                                                                       1 => To_Unbounded_Wide_Wide_String (Source => "."),
                                                                       2 => To_Unbounded_Wide_Wide_String (Source => "..")
                                                                      );
   -- Allgemein
   
   
   
   -- Linux
   
   -- Linux
   
   
   
   -- Windows
   -- Also prohibited with file extension!
   ForbiddenWindowsNamesThree : constant ArraysHTGDL.GeneralTextArray (1 .. 4) := (
                                                                                  1 => To_Unbounded_Wide_Wide_String (Source => "AUX"),
                                                                                  2 => To_Unbounded_Wide_Wide_String (Source => "CON"),
                                                                                  3 => To_Unbounded_Wide_Wide_String (Source => "PRN"),
                                                                                  4 => To_Unbounded_Wide_Wide_String (Source => "NUL")
                                                                                 );
   
   ForbiddenWindowsNamesFour : constant ArraysHTGDL.GeneralTextArray (1 .. 20) := (
                                                                                   1 => To_Unbounded_Wide_Wide_String (Source => "COM0"),
                                                                                   2 => To_Unbounded_Wide_Wide_String (Source => "COM1"),
                                                                                   3 => To_Unbounded_Wide_Wide_String (Source => "COM2"),
                                                                                   4 => To_Unbounded_Wide_Wide_String (Source => "COM3"),
                                                                                   5 => To_Unbounded_Wide_Wide_String (Source => "COM4"),
                                                                                   6 => To_Unbounded_Wide_Wide_String (Source => "COM5"),
                                                                                   7 => To_Unbounded_Wide_Wide_String (Source => "COM6"),
                                                                                   8 => To_Unbounded_Wide_Wide_String (Source => "COM7"),
                                                                                   9 => To_Unbounded_Wide_Wide_String (Source => "COM8"),
                                                                                   10 => To_Unbounded_Wide_Wide_String (Source => "COM9"),
                                                                                   11 => To_Unbounded_Wide_Wide_String (Source => "LPT0"),
                                                                                   12 => To_Unbounded_Wide_Wide_String (Source => "LPT1"),
                                                                                   13 => To_Unbounded_Wide_Wide_String (Source => "LPT2"),
                                                                                   14 => To_Unbounded_Wide_Wide_String (Source => "LPT3"),
                                                                                   15 => To_Unbounded_Wide_Wide_String (Source => "LPT4"),
                                                                                   16 => To_Unbounded_Wide_Wide_String (Source => "LPT5"),
                                                                                   17 => To_Unbounded_Wide_Wide_String (Source => "LPT6"),
                                                                                   18 => To_Unbounded_Wide_Wide_String (Source => "LPT7"),
                                                                                   19 => To_Unbounded_Wide_Wide_String (Source => "LPT8"),
                                                                                   20 => To_Unbounded_Wide_Wide_String (Source => "LPT9")
                                                                                  );
   
   ForbiddenWindowsNamesFive : constant ArraysHTGDL.GeneralTextArray (1 .. 1) := (
                                                                                   1 => To_Unbounded_Wide_Wide_String (Source => "CLOCK$")
                                                                                  );
   -- Windows

end OperatingSystemConstantsHTGDL;
