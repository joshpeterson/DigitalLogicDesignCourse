library ieee;
use ieee.std_logic_1164.all;
use work.my_conversion.all;

entity add is
    port (X: in STD_LOGIC_VECTOR (7 downto 0);
          Y: in STD_LOGIC_VECTOR (7 downto 0);
          F: out STD_LOGIC_VECTOR (7 downto 0));
end add;

architecture add_arch of add is
begin
    process (X, Y)
        variable XI, YI, FI : INTEGER;
    begin
        XI := CONV_INTEGER(X);
        YI := CONV_INTEGER(Y);
        FI := XI + YI;
        F <= CONV_STD_LOGIC_VECTOR(FI, 8);
    end process;
end add_arch;

library ieee;
use ieee.std_logic_1164.all;
use work.my_conversion.all;

entity sub is
    port (X: in STD_LOGIC_VECTOR (7 downto 0);
          Y: in STD_LOGIC_VECTOR (7 downto 0);
          F: out STD_LOGIC_VECTOR (7 downto 0));
end sub;

architecture sub_arch of sub is
begin
    process (X, Y)
        variable XI, YI, FI : INTEGER;
    begin
        XI := CONV_INTEGER(X);
        YI := CONV_INTEGER(Y);
        FI := XI - YI;
        F <= CONV_STD_LOGIC_VECTOR(FI, 8);
    end process;
end sub_arch;

library ieee;
use ieee.std_logic_1164.all;
use work.my_conversion.all;

entity mul is
    port (X: in STD_LOGIC_VECTOR (7 downto 0);
          Y: in STD_LOGIC_VECTOR (7 downto 0);
          F: out STD_LOGIC_VECTOR (7 downto 0));
end mul;

architecture mul_arch of mul is
begin
    process (X, Y)
        variable XI, YI, FI : INTEGER;
    begin
        XI := CONV_INTEGER(X);
        YI := CONV_INTEGER(Y);
        FI := XI * YI;
        F <= CONV_STD_LOGIC_VECTOR(FI, 8);
    end process;
end mul_arch;

library ieee;
use ieee.std_logic_1164.all;
use work.my_conversion.all;

entity div is
    port (X: in STD_LOGIC_VECTOR (7 downto 0);
          Y: in STD_LOGIC_VECTOR (7 downto 0);
          F: out STD_LOGIC_VECTOR (7 downto 0));
end div;

architecture div_arch of div is
begin
    process (X, Y)
        variable XI, YI, FI : INTEGER;
    begin
        XI := CONV_INTEGER(X);
        YI := CONV_INTEGER(Y);
        if YI = 0 then
            F <= "UUUUUUUU";
        else
            FI := XI / YI;
            F <= CONV_STD_LOGIC_VECTOR(FI, 8);
        end if;
    end process;
end div_arch;

library ieee;
use ieee.std_logic_1164.all;
use work.my_conversion.all;

entity calculator_testbench is
end calculator_testbench;

architecture calculator_testbench_arch of calculator_testbench is
    type std_logic_vector_table is array(0 to 2, 0 to 2) of std_logic_vector(7 downto 0);
    constant add_table : std_logic_vector_table := (
        ("00000000", "00000000", "00000000"),
        ("01000000", "00111111", "01111111"),
        ("00010000", "00000100", "00010100"));
    constant sub_table : std_logic_vector_table := (
        ("00000000", "00000000", "00000000"),
        ("01000000", "00111111", "00000001"),
        ("00010000", "00000100", "00001100"));
    constant mul_table : std_logic_vector_table := (
        ("00000001", "00000000", "00000000"),
        ("00001000", "00001000", "01000000"),
        ("00000111", "00000100", "00011100"));
    constant div_table : std_logic_vector_table := (
        ("01000000", "00000001", "01000000"),
        ("00010000", "00001000", "00000010"),
        ("00100000", "00000100", "00001000"));
    component add port (X, Y: in STD_LOGIC_VECTOR (7 downto 0); F: out STD_LOGIC_VECTOR (7 downto 0)); end component;
    component sub port (X, Y: in STD_LOGIC_VECTOR (7 downto 0); F: out STD_LOGIC_VECTOR (7 downto 0)); end component;
    component mul port (X, Y: in STD_LOGIC_VECTOR (7 downto 0); F: out STD_LOGIC_VECTOR (7 downto 0)); end component;
    component div port (X, Y: in STD_LOGIC_VECTOR (7 downto 0); F: out STD_LOGIC_VECTOR (7 downto 0)); end component;
    signal X_ADD_T, Y_ADD_T, F_ADD_T: STD_LOGIC_VECTOR(7 downto 0);
    signal X_SUB_T, Y_SUB_T, F_SUB_T: STD_LOGIC_VECTOR(7 downto 0);
    signal X_MUL_T, Y_MUL_T, F_MUL_T: STD_LOGIC_VECTOR(7 downto 0);
    signal X_DIV_T, Y_DIV_T, F_DIV_T: STD_LOGIC_VECTOR(7 downto 0);
begin
    U1: add port map (X_ADD_T, Y_ADD_T, F_ADD_T);
    U2: sub port map (X_SUB_T, Y_SUB_T, F_SUB_T);
    U3: mul port map (X_MUL_T, Y_MUL_T, F_MUL_T);
    U4: div port map (X_DIV_T, Y_DIV_T, F_DIV_T);
    process
    begin
        assert false report "Starting calculator test." severity NOTE;
        for row in 0 to 2 loop
            X_ADD_T <= add_table(row, 0);
            Y_ADD_T <= add_table(row, 1);

            X_SUB_T <= sub_table(row, 0);
            Y_SUB_T <= sub_table(row, 1);

            X_MUL_T <= mul_table(row, 0);
            Y_MUL_T <= mul_table(row, 1);

            X_DIV_T <= div_table(row, 0);
            Y_DIV_T <= div_table(row, 1);

            wait for 10 ns;

            assert(F_ADD_T = add_table(row, 2)) report "Addition failed for X=" & to_string(X_ADD_T) & " and Y=" & to_string(Y_ADD_T) & ". Expected: " & to_string(add_table(row, 2)) & " received: " & to_string(F_ADD_T);
            assert(F_SUB_T = sub_table(row, 2)) report "Subtraction failed for X=" & to_string(X_SUB_T) & " and Y=" & to_string(Y_SUB_T) & ". Expected: " & to_string(sub_table(row, 2)) & " received: " & to_string(F_SUB_T);
            assert(F_MUL_T = mul_table(row, 2)) report "Multiplication failed for X=" & to_string(X_MUL_T) & " and Y=" & to_string(Y_MUL_T) & ". Expected: " & to_string(mul_table(row, 2)) & " received: " & to_string(F_MUL_T);
            assert(F_DIV_T = div_table(row, 2)) report "Divison failed for X=" & to_string(X_DIV_T) & " and Y=" & to_string(Y_DIV_T) & ". Expected: " & to_string(div_table(row, 2)) & " received: " & to_string(F_DIV_T);
        end loop;
        assert false report "Ending calculator test." severity NOTE;
        wait;
    end process;
end calculator_testbench_arch;
