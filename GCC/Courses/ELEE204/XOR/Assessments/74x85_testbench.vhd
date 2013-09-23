library ieee;
use ieee.std_logic_1164.all;

entity msi74x85_testbench is
end msi74x85_testbench;

architecture msi74x85_testbench_arch of msi74x85_testbench is
    component msi74x85 port (A: in STD_LOGIC_VECTOR(3 downto 0);
                             B: in STD_LOGIC_VECTOR(3 downto 0);
                             ALTBIN: in STD_LOGIC;
                             AEQBIN: in STD_LOGIC;
                             AGTBIN: in STD_LOGIC;
                             ALTBOUT: out STD_LOGIC;
                             AEQBOUT: out STD_LOGIC;
                             AGTBOUT: out STD_LOGIC); end component;
    signal A_T, B_T: STD_LOGIC_VECTOR(3 downto 0);
    signal ALTBIN_T, AEQBIN_T, AGTBIN_T: STD_LOGIC;
    signal ALTBOUT_T, AEQBOUT_T, AGTBOUT_T: STD_LOGIC;
begin
        U1: msi74x85 port map (A_T, B_T, ALTBIN_T, AEQBIN_T, AGTBIN_T, ALTBOUT_T, AEQBOUT_T, AGTBOUT_T);
    process
    begin
        assert false report "Starting test of 74x85." severity note;
        A_T <= "0010";
        B_T <= "0100";

        ALTBIN_T <= '1';
        AEQBIN_T <= '0';
        AGTBIN_T <= '0';
        wait for 10 ns;
        assert(ALTBOUT_T = '1') report "Failed for ALTBIN." severity error;

        ALTBIN_T <= '0';
        AEQBIN_T <= '1';
        AGTBIN_T <= '0';
        wait for 10 ns;
        assert(AEQBOUT_T = '0') report "Failed for AEQBIN." severity error;

        ALTBIN_T <= '0';
        AEQBIN_T <= '0';
        AGTBIN_T <= '1';
        wait for 10 ns;
        assert(AGTBOUT_T = '0') report "Failed for AGTBIN." severity error;
        assert false report "Ending test of 74x85." severity note;
        wait;
    end process;
end msi74x85_testbench_arch;
