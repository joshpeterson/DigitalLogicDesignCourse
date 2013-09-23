library ieee;
use ieee.std_logic_1164.all;
use work.my_conversion.all;

entity msi74x85 is
    port (A: in STD_LOGIC_VECTOR(3 downto 0);
          B: in STD_LOGIC_VECTOR(3 downto 0);
          ALTBIN: in STD_LOGIC;
          AEQBIN: in STD_LOGIC;
          AGTBIN: in STD_LOGIC;
          ALTBOUT: out STD_LOGIC;
          AEQBOUT: out STD_LOGIC;
          AGTBOUT: out STD_LOGIC);
end msi74x85;

architecture msi74x85_arch of msi74x85 is
begin
    process(A, B, ALTBIN, AEQBIN, AGTBIN)
        variable AI, BI: integer;
    begin
        AI := CONV_INTEGER(A);
        BI := CONV_INTEGER(B);
        ALTBOUT <= '0';
        AEQBOUT <= '0';
        AGTBOUT <= '0';
        if (ALTBIN = '1') then
            if (AI < BI) then ALTBOUT <= '1'; end if;
        elsif (AEQBIN = '1') then
            if (AI = BI) then AEQBOUT <= '1'; end if;
        elsif (AGTBIN = '1') then
            if (AI > BI) then AGTBOUT <= '1'; end if;
        end if;
    end process;
end msi74x85_arch;
