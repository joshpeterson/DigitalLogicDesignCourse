library ieee;
use ieee.std_logic_1164.all;

entity roommate_control_testbench is
end roommate_control_testbench;

architecture roommate_control_testbench_arch of roommate_control_testbench is
    type std_ulogic_table is array(0 to 15, 0 to 4) of std_ulogic;
    constant roommate_control_truth_table : std_ulogic_table := (
        ('0', '0', '0', '0', '0'),
        ('0', '0', '0', '1', '0'),
        ('0', '0', '1', '0', '0'),
        ('0', '0', '1', '1', '0'),
        ('0', '1', '0', '0', '0'),
        ('0', '1', '0', '1', '0'),
        ('0', '1', '1', '0', '0'),
        ('0', '1', '1', '1', '0'),
        ('1', '0', '0', '0', '0'),
        ('1', '0', '0', '1', '0'),
        ('1', '0', '1', '0', '1'),
        ('1', '0', '1', '1', '1'),
        ('1', '1', '0', '0', '1'),
        ('1', '1', '0', '1', '1'),
        ('1', '1', '1', '0', '1'),
        ('1', '1', '1', '1', '1'));
    component roommate_control_behavioral port (SNORING: in STD_ULOGIC;
                                                STUDYING: in STD_ULOGIC; 
                                                MAVERICK: in STD_ULOGIC;
                                                TEST: in STD_ULOGIC; 
                                                SHOE: out STD_ULOGIC); end component;
    signal SNORING_T, STUDYING_T, MAVERICK_T, TEST_T, SHOE_T: STD_ULOGIC;
begin
    U1: roommate_control_behavioral port map (SNORING_T, STUDYING_T, MAVERICK_T, TEST_T, SHOE_T);
    process
    begin
        assert false report "Starting roommate control test." severity NOTE;
        for row in 0 to 15 loop
            SNORING_T <= roommate_control_truth_table(row, 0);
            STUDYING_T <= roommate_control_truth_table(row, 1);
            MAVERICK_T <= roommate_control_truth_table(row, 2);
            TEST_T <= roommate_control_truth_table(row, 3);
            wait for 10 ns;
            assert(SHOE_T = roommate_control_truth_table(row, 4)) report "Failed for row: " & integer'image(row) & " SHOE_T is: " & std_ulogic'image(SHOE_T)  severity error;
        end loop;
        assert false report "Ending roommate control test." severity NOTE;
        wait;
    end process;
end roommate_control_testbench_arch;
