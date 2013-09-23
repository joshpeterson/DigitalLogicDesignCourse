library ieee;
use ieee.std_logic_1164.all;

entity counter is
    port (clock, A, reset: in std_logic;
          Z: out std_logic);
end counter;

architecture counter_arch of counter is
type state_type is (init, counting1, counting2, rollover);
signal current_state, next_state: state_type;
begin

process(clock)
begin
    if reset = '1' then
        current_state <= init;
    end if;
    if clock'event and clock = '1' then
	assert(false) report "Clock tick" severity note;
        current_state <= next_state;
    end if;
end process;

process(A, current_state)
begin
    case current_state is
        when init => if A = '1' then
                        next_state <= counting1;
                     else
                        next_state <= init;
                     end if;

        when counting1 => if A = '1' then
			    next_state <= counting2;
                        else
                            next_state <= init;
                        end if;

        when counting2 => if A = '1' then
			    next_state <= rollover;
                        else
                            next_state <= init;
                        end if;

        when rollover => next_state <= init;
        when others => next_state <= init;
    end case;
end process;

    Z <= '1' when current_state = rollover and A = '1' else
         '0';
end counter_arch;

