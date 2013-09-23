library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity msi74x682_testbench is
end msi74x682_testbench;

architecture msi74x682_testbench_arch of msi74x682_testbench is
    component msi74x682 port (P: in std_logic_vector(7 downto 0);
                              Q: in std_logic_vector(7 downto 0);
                              PEQQ_L: out std_logic;
                              PGTQ_L: out std_logic); end component;
    signal P_T: std_logic_vector(7 downto 0);
    signal Q_T: std_logic_vector(7 downto 0);
    signal PEQQ_L: std_logic;
    signal PGTQ_L: std_logic;
begin
    U1: msi74x682 port map (P_T, Q_T, PEQQ_L, PGTQ_L);
    process
    begin
        assert false report "Starting 74x682 test." severity NOTE;
        P_T <= "00000000";
        Q_T <= "00000000";
        wait for 10 ns;
        assert(PEQQ_L = '0' and PGTQ_L = '1') report "Failed for input P=00000000 and Q=00000000. Expected: PEQQ_L='0', PGTQ_L='1'. Actual: PEQQ_L=" & std_logic'image(PEQQ_L) & " PGTQ_L=" & std_logic'image(PGTQ_L) & "." severity error;

        P_T <= "00000001";
        Q_T <= "00000000";
        wait for 10 ns;
        assert(PEQQ_L = '1' and PGTQ_L = '0') report "Failed for input P=00000001 and Q=00000000. Expected: PEQQ_L='1', PGTQ_L='0'. Actual: PEQQ_L=" & std_logic'image(PEQQ_L) & " PGTQ_L=" & std_logic'image(PGTQ_L) & "." severity error;

        P_T <= "11111011";
        Q_T <= "11111011";
        wait for 10 ns;
        assert(PEQQ_L = '0' and PGTQ_L = '1') report "Failed for input P=11111011 and Q=11111011. Expected: PEQQ_L='0', PGTQ_L='1'. Actual: PEQQ_L=" & std_logic'image(PEQQ_L) & " PGTQ_L=" & std_logic'image(PGTQ_L) & "." severity error;

        P_T <= "00000000";
        Q_T <= "00010000";
        wait for 10 ns;
        assert(PEQQ_L = '1' and PGTQ_L = '1') report "Failed for input P=00000000 and Q=00010000. Expected: PEQQ_L='1', PGTQ_L='1'. Actual: PEQQ_L=" & std_logic'image(PEQQ_L) & " PGTQ_L=" & std_logic'image(PGTQ_L) & "." severity error;

        assert false report "Ending 74x682 test." severity NOTE;
        wait;
    end process;
end msi74x682_testbench_arch;
