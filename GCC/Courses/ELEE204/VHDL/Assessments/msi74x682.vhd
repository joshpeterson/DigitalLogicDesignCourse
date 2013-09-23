library ieee;
use ieee.std_logic_1164.all;

entity msi74x682 is
    port (P: in std_logic_vector(7 downto 0);
          Q: in std_logic_vector(7 downto 0);
          PEQQ_L: out std_logic;
          PGTQ_L: out std_logic);
end msi74x682;

architecture msi74x682_arch of msi74x682 is
    signal PEQQ: std_logic;
    signal PGTQ: std_logic;
begin
    process (P, Q)
    begin
        if (P = Q) then
            PEQQ <= '1';
        else
            PEQQ <= '0';
        end if;

        if (P > Q) then
            PGTQ <= '1';
        else
            PGTQ <= '0';
        end if;
    end process;
    PEQQ_L <= not PEQQ;
    PGTQ_L <= not PGTQ;
end msi74x682_arch;
