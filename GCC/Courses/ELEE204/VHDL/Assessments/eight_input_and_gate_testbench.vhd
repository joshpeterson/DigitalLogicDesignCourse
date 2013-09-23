library ieee;
use ieee.std_logic_1164.all;

entity eight_input_and_gate_testbench is
end eight_input_and_gate_testbench;

architecture eight_input_and_gate_testbench_arch of eight_input_and_gate_testbench is
    component eight_input_and_gate port (X: in std_logic_vector(7 downto 0); F: out std_logic); end component;
    signal X_T: std_logic_vector(7 downto 0);
    signal F_T: std_logic;
begin
    U1: eight_input_and_gate port map (X_T, F_T);
    process
    begin
        assert false report "Starting test of eight input and gate." severity note;

        X_T <= "00000000";
        wait for 10 ns;
        assert(F_T = '0') report "Failed for input 00000000.";

        X_T <= "10000100";
        wait for 10 ns;
        assert(F_T = '0') report "Failed for input 10000100.";

        X_T <= "00010000";
        wait for 10 ns;
        assert(F_T = '0') report "Failed for input 00010000.";

        X_T <= "11111111";
        wait for 10 ns;
        assert(F_T = '1') report "Failed for input 11111111.";

        assert false report "Ending test of eight input and gate." severity note;
        wait;
    end process;
end eight_input_and_gate_testbench_arch;
