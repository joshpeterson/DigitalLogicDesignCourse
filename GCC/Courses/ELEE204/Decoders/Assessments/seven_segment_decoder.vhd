library ieee;
use ieee.std_logic_1164.all;

entity seven_segment_decoder is
    port (X: in std_logic_vector(2 downto 0);
          F: out std_logic_vector(6 downto 0));
end entity;

architecture seven_segment_decoder_arch of seven_segment_decoder is
begin
    process(X)
    begin
        case X is
            -- Segments:        abcdefg
            when "000" => F <= "1111110";
            when "001" => F <= "0110000";
            when "010" => F <= "1101101";
            when "011" => F <= "1111001";
            when "100" => F <= "0110011";
            when "101" => F <= "1011011";
            when "110" => F <= "1011111";
            when "111" => F <= "1100100";
            when others => F <= "0000000";
        end case;
    end process;
end seven_segment_decoder_arch;
