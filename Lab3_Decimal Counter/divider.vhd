library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divider is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           ENABLE : out STD_LOGIC);
end divider;

architecture Behavioral of divider is
signal delay, delay_next: std_logic_vector(26 downto 0); 
--signal delay, delay_next: integer range 0 to 99999999;

begin
process (RESET, CLK) 
begin 
    if RESET = '1' then 
        delay <= (others => '0'); 
--        delay <= 0; 
    elsif CLK='1' and CLK'event then 
        delay <= delay_next; 
end if; 
end process;

delay_next <= (others => '0') when delay = 99999999 else delay+1;
ENABLE <= '1' when delay = 99999999 else '0';

--ENABLE <= '1' when delay = 99999999 else '0';
--delay_next <= delay + 1;

    
end Behavioral;
