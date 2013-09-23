entity and_gate is
	port (X,Y: in BIT;
	      Z:   out BIT);
end and_gate;


architecture and_gate_arch of and_gate is
begin
	Z<='0' when X='1' and Y='1' else '0';
end and_gate_arch;

