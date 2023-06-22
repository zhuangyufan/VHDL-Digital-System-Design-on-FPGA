-- tb_comb_mult.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.ALL; 
entity tb_comb_mult is
-- Port ( );
end tb_comb_mult;
architecture Behavioral of tb_comb_mult is
component comb_mult is
 port (a, b : in std_logic_vector(15 downto 0);
 y: out std_logic_vector(31 downto 0));
end component comb_mult;
signal a,b: std_logic_vector(15 downto 0);
signal y: std_logic_vector(31 downto 0);
begin
UUT: comb_mult port map(a => a, b => b, y => y);
a <= std_logic_vector(to_unsigned(5,16)), 
 std_logic_vector(to_unsigned(65535,16)) after 50ns, 
 std_logic_vector(to_unsigned(16,16)) after 100ns;
b <= std_logic_vector(to_unsigned(5,16)), 
 std_logic_vector(to_unsigned(65535,16)) after 50ns, 
 std_logic_vector(to_unsigned(64,16)) after 100ns;
end Behavioral;
