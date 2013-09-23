library ieee;
use ieee.std_logic_1164.all;

package my_conversion is
    function CONV_INTEGER (X: STD_LOGIC_VECTOR) return INTEGER;
    function CONV_STD_LOGIC_VECTOR(ARG: INTEGER; SIZE: INTEGER) return STD_LOGIC_VECTOR;
    function to_string(vector: std_logic_vector) return string;
end my_conversion;

package body my_conversion is

function CONV_INTEGER (X: STD_LOGIC_VECTOR) return INTEGER is
    variable RESULT: INTEGER;
begin
    RESULT := 0;
    for i in X'range loop
        RESULT := RESULT * 2;
        case X(i) is
            when '0' | 'L'  => null;
            when '1' | 'H'  => RESULT := RESULT + 1;
            when others     => null;
        end case;
    end loop;
    return RESULT;
end CONV_INTEGER;

function CONV_STD_LOGIC_VECTOR(ARG: INTEGER; SIZE: INTEGER) return STD_LOGIC_VECTOR is   
    variable result: STD_LOGIC_VECTOR (SIZE-1 downto 0);
    variable temp: integer;
begin
    temp := ARG;
    for i in 0 to SIZE-1 loop
        if (temp mod 2) = 1 then result(i) := '1';
        else result(i) := '0';
        end if;
        temp := temp / 2;
    end loop;
    return result;
end CONV_STD_LOGIC_VECTOR;

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
end my_conversion;
