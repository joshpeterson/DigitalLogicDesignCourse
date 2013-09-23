entity and_gate_operator is
  port (X,Y: in BIT; Z: out BIT);
end and_gate_operator;

architecture and_gate_operator_arch of and_gate_operator is
function "*"(A,B: BIT) return BIT is
begin
  if A='1' and B='1' then return '1';
  else return '0';
  end if;
end "*";

begin
  Z <= X * Y;
end and_gate_operator_arch;
