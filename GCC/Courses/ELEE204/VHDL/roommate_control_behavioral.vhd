library ieee;
use ieee.std_logic_1164.all;

entity roommate_control_behavioral is
  port (SNORING: in STD_ULOGIC;
        STUDYING: in STD_ULOGIC;
        MAVERICK: in STD_ULOGIC;
        TEST: in STD_ULOGIC;
        SHOE: out STD_ULOGIC);
end roommate_control_behavioral;

architecture roommate_control_behavioral_arch of roommate_control_behavioral is
begin
    process(SNORING, STUDYING, MAVERICK, TEST)
    begin
        if SNORING='1' and (STUDYING='1' or MAVERICK='1') then
            SHOE <= '1';
        else
            SHOE <= '0';
        end if;
    end process;
end roommate_control_behavioral_arch;
