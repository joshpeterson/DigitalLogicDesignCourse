library ieee;
use ieee.std_logic_1164.all;

entity and_gate_function_ieee_1164 is
  port (X,Y: in STD_ULOGIC; Z: out STD_ULOGIC);
end and_gate_function_ieee_1164;

architecture and_gate_function_ieee_1164_arch of and_gate_function_ieee_1164 is
function ANDGate(A,B: STD_ULOGIC) return STD_ULOGIC is
begin
  if A='1' and B='1' then return '1';
  else return '0';
  end if;
end ANDGate;

begin
  Z <= ANDGate(X,Y);
end and_gate_function_ieee_1164_arch;
