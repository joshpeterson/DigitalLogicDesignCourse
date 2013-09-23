library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity seven_segment_decoder_testbench is
end seven_segment_decoder_testbench;

architecture seven_segment_decoder_testbench_arch of seven_segment_decoder_testbench is

    function to_string(vector: std_logic_vector) return string is
        variable display_string: string(1 to vector'length);
        variable r: integer;
    begin
        r := 1;
        for i in vector'range loop
            case vector(i) is
                when 'U' => display_string(r) := 'U';
                when 'X' => display_string(r) := 'X';
                when '0' => display_string(r) := '0';
                when '1' => display_string(r) := '1';
                when 'Z' => display_string(r) := 'Z';
                when 'W' => display_string(r) := 'W';
                when 'L' => display_string(r) := 'L';
                when 'H' => display_string(r) := 'H';
                when '-' => display_string(r) := '-';
            end case;
            r := r + 1;
        end loop;
        return display_string;
    end to_string;

    type std_logic_vector_table3 is array(0 to 7) of std_logic_vector(2 downto 0);
    type std_logic_vector_table7 is array(0 to 7) of std_logic_vector(6 downto 0);

    constant seven_segment_decoder_input_table : std_logic_vector_table3 := 
        ("000",
         "001",
         "010",
         "011",
         "100",
         "101",
         "110",
         "111");

    constant seven_segment_decoder_output_table : std_logic_vector_table7 := 
        ("1111110",
         "0110000",
         "1101101",
         "1111001",
         "0110011",
         "1011011",
         "1011111",
         "1100100");

    component seven_segment_decoder port (X: in std_logic_vector(2 downto 0);
                                          F: out std_logic_vector(6 downto 0)); end component;
    signal X_T: std_logic_vector(2 downto 0);
    signal F_T: std_logic_vector(6 downto 0);
begin
    U1: seven_segment_decoder port map (X_T, F_T);
    process
    begin
        assert false report "Starting seven segment decoder test." severity NOTE;
        for row in 0 to 7 loop
            X_T <= seven_segment_decoder_input_table(row);
            wait for 10 ns;
            assert(F_T = seven_segment_decoder_output_table(row)) 
                report "Failed for input: " & to_string(seven_segment_decoder_input_table(row)) & 
                " expected: " & to_string(seven_segment_decoder_output_table(row)) & 
                " actual: " & to_string(F_T);
        end loop;
        assert false report "Ending seven segment decoder test." severity NOTE;
        wait;
    end process;
end seven_segment_decoder_testbench_arch;
