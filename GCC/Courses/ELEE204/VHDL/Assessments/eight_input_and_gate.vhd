library ieee;
use ieee.std_logic_1164.all;

entity eight_input_and_gate is
    port (X: in std_logic_vector(7 downto 0);
          F: out std_logic);
end eight_input_and_gate;

architecture eight_input_and_gate_arch of eight_input_and_gate is
begin
    process(X)
        variable and_output: std_logic;
    begin
        and_output := '1';
        for i in X'range loop
            and_output := and_output and X(i);
        end loop;
        F <= and_output;
    end process;
end eight_input_and_gate_arch;

