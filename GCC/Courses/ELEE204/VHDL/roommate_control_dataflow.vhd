library ieee;
use ieee.std_logic_1164.all;

entity roommate_control_dataflow is
  port (SNORING: in STD_ULOGIC;
        STUDYING: in STD_ULOGIC;
        MAVERICK: in STD_ULOGIC;
        TEST: in STD_ULOGIC;
        SHOE: out STD_ULOGIC);
end roommate_control_dataflow;

architecture roommate_control_dataflow_arch of roommate_control_dataflow is
begin
    SHOE <= SNORING and (STUDYING OR MAVERICK) and not TEST;
end roommate_control_dataflow_arch;
