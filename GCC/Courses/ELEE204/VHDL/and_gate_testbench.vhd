library ieee;
use ieee.std_logic_1164.all;

entity and_gate_testbench is
end and_gate_testbench;

architecture and_gate_testbench_arch of and_gate_testbench is
component and_gate_function_ieee_1164 port (X,Y: in STD_ULOGIC; Z: out STD_ULOGIC); end component;
signal XT, YT, FT: STD_ULOGIC;
begin
    U1: and_gate_function_ieee_1164 port map (XT, YT, FT);
    process
    begin
        assert false report "Starting and_gate test." severity NOTE;
        XT<='0'; YT<='0';
        wait for 25 ns;
        assert(FT='0') report "Failed for 0,0" severity ERROR;
        XT<='0'; YT<='1';
        wait for 25 ns;
        assert(FT='0') report "Failed for 0,1" severity ERROR;
        XT<='1'; YT<='0';
        wait for 25 ns;
        assert(FT='0') report "Failed for 1,0" severity ERROR;
        XT<='1'; YT<='1';
        wait for 25 ns;
        assert(FT='1') report "Failed for 1,1" severity ERROR;
        assert false report "Ending and_gate test." severity NOTE;
        wait;
    end process;
end and_gate_testbench_arch;
