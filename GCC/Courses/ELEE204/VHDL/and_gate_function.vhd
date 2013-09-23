entity and_gate_function is
  port (X,Y: in BIT; Z: out BIT);
end and_gate_function;

architecture and_gate_function_arch of and_gate_function is
function ANDGate(A,B: BIT) return BIT is
begin
  if A='1' and B='1' then return '1';
  else return '0';
  end if;
end ANDGate;

begin
  Z <= ANDGate(X,Y);
end and_gate_function_arch;
