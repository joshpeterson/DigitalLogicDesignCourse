library ieee;
use ieee.std_logic_1164.all;

entity counter_testbench is
end counter_testbench;

architecture counter_testbench_arch of counter_testbench is
signal CLOCKT, AT, ZT, RESETT: std_logic;
component counter port (clock, A, reset: in std_logic; Z: out std_logic); end component;

begin
    U1: counter port map (CLOCKT, AT, RESETT, ZT);

    process
    variable num_ticks: integer := 0;
    begin
        CLOCKT <= '1';
        wait for 5 ns;
        CLOCKT <= '0';
        wait for 5 ns;
        if num_ticks > 7 then
            wait;
        end if;
        num_ticks := num_ticks + 1;
    end process;

    process
    begin
        assert(false) report "Starting counter test." severity note;
	RESETT <= '1'; wait for 10 ns;
        RESETT <= '0';
        AT <= '1'; wait for 10 ns;
        assert(ZT = '0') report "Counter failed after one clock tick, Z is asserted too early." severity error;
        AT <= '1'; wait for 10 ns;
        assert(ZT = '0') report "Counter failed after two clock ticks, Z is asserted too early." severity error;
        AT <= '1'; wait for 10 ns;
        assert(ZT = '0') report "Counter failed after three clock ticks, Z is asserted too early." severity error;
        AT <= '1'; wait for 10 ns;
        assert(ZT = '1') report "Counter failed after four clock ticks, Z is not asserted." severity error;
        AT <= '1'; wait for 10 ns;
        assert(ZT = '0') report "Counter failed after five clock ticks, Z is still asserted." severity error;
        AT <= '1'; wait for 10 ns;
        assert(ZT = '0') report "Counter failed after six clock tick, Z is asserted too early." severity error;
        AT <= '1'; wait for 10 ns;
        assert(ZT = '0') report "Counter failed after seven clock ticks, Z is asserted too early." severity error;
        AT <= '0'; wait for 10 ns;
        assert(ZT = '0') report "Counter failed after A=0, Z is asserted." severity error;
        assert(false) report "Ending counter test." severity note;
        wait;
    end process;
end counter_testbench_arch;
