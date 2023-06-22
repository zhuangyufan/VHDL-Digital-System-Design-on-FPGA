library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compute_current_anode is
    Port ( CLK : in STD_LOGIC;
           ENB : in STD_LOGIC;
           RST : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
end compute_current_anode;


architecture Behavioral of compute_current_anode is
    signal O_reg, O_next: std_logic_vector(2 downto 0); 
begin

process (RST, CLK) 
begin 
    if RST = '1' then 
        O_reg <= (others => '0'); 
    elsif CLK='1' and CLK'event then 
        O_reg <= O_next; 
    end if; 
end process;

-- next state logic
O_next <= O_reg + 1 when ENB = '1' else O_reg;

-- output logic
O <= O_reg;

end Behavioral;
