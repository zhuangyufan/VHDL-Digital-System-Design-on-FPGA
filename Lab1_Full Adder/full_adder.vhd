library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
port (A, B, Cin : in std_logic;
      Sum, Cout: out std_logic);
end entity full_adder;

architecture dataflow of full_adder is
signal s1, s2, s3 : std_logic;
constant gate_delay : time := 10 ns;
begin
L1: s1 <= (A xor B) after gate_delay;
L2: s2 <= (Cin and s1) after gate_delay;
L3: s3 <= (A and B) after gate_delay;
L4: sum <= (s1 xor Cin) after gate_delay;
L5: cout <= (s2 or s3) after gate_delay;
end architecture dataflow;
