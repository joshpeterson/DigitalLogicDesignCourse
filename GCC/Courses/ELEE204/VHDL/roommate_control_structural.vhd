library ieee;
use ieee.std_logic_1164.all;

entity NOT1 is
  port (X: in STD_ULOGIC;
        F: out STD_ULOGIC);
end NOT1;

architecture NOT1_arch of NOT1 is
begin
    F <= not X;
end NOT1_arch;

library ieee;
use ieee.std_logic_1164.all;

entity OR2 is
  port (X: in STD_ULOGIC;
        Y: in STD_ULOGIC;
        F: out STD_ULOGIC);
end OR2;

architecture OR2_arch of OR2 is
begin
  F <= X or Y;
end OR2_arch;

library ieee;
use ieee.std_logic_1164.all;

entity AND3 is
  port (X: in STD_ULOGIC;
        Y: in STD_ULOGIC;
        Z: in STD_ULOGIC;
        F: out STD_ULOGIC);
end AND3;

architecture AND3_arch of AND3 is
begin
  F <= X and Y and Z;
end AND3_arch;

library ieee;
use ieee.std_logic_1164.all;

entity roommate_control_structural is
  port (SNORING: in STD_ULOGIC;
        STUDYING: in STD_ULOGIC;
        MAVERICK: in STD_ULOGIC;
        TEST: in STD_ULOGIC;
        SHOE: out STD_ULOGIC);
end roommate_control_structural ;

architecture roommate_control_structural_arch of roommate_control_structural is
  signal IM_BUSY, ROOMMATE_TEST: STD_ULOGIC;
  component NOT1 port (X: in STD_ULOGIC; F: out STD_ULOGIC); end component;
  component OR2 port (X: in STD_ULOGIC; Y: in STD_ULOGIC; F: out STD_ULOGIC); end component;
  component AND3 port (X: in STD_ULOGIC; Y: in STD_ULOGIC; Z: in STD_ULOGIC; F: out STD_ULOGIC); end component;
begin
  U3: AND3 port map (SNORING, IM_BUSY, ROOMMATE_TEST, SHOE);
  U1: OR2 port map (STUDYING, MAVERICK, IM_BUSY);
  U2: NOT1 port map (TEST, ROOMMATE_TEST);
end roommate_control_structural_arch;
