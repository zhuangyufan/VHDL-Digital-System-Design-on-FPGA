library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_adder is
 
end entity tb_adder;

architecture Behavioral of tb_adder is
    component full_adder is 
        port (A, B, Cin : in std_logic; Sum, Cout : out std_logic ); 
    end component full_adder;
    
-- Stimulus signals – to connect test bench to UUT input ports
signal x_tb, y_tb, c_tb: std_logic;
-- Observed signals - to connect testbench to OUT output ports
signal sum_tb, carry_tb: std_logic;


begin
-- Create an instance of the full_adder circuit

UUT:full_adder port map (A => x_tb, B => y_tb, Cin => c_tb, sum => sum_tb, cout => carry_tb);

--signal assignment statements generating stimulus values
x_tb <= '1', '0' after 10ns,  '1' after 20ns, '0' after 30ns, '1' after 40ns, '0' after 50ns, '1' after 60ns, '0' after 70ns;
y_tb <= '0', '0' after 10ns,  '1' after 20ns, '1' after 30ns, '0' after 40ns, '0' after 50ns, '1' after 60ns, '1' after 70ns;
c_tb <= '0', '1' after 10ns,  '0' after 20ns, '0' after 30ns, '0' after 40ns, '1' after 50ns, '0' after 60ns, '0' after 70ns;

end Behavioral;
