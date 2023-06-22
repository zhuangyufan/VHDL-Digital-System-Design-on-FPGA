library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity freqDivider is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           speed : in std_logic_vector(26 downto 0);
           ENABLE : out STD_LOGIC);
end freqDivider;

architecture Behavioral of freqDivider is
signal delay, delay_next: std_logic_vector(26 downto 0); 

begin
process (RESET, CLK) 
begin 
    if RESET = '1' then 
        delay <= (others => '0');  
    elsif CLK='1' and CLK'event then 
        delay <= delay_next; 
end if; 
end process;

process (delay, speed)
begin
    -- default value
    delay_next <= delay;
    if delay = speed or delay = speed + 500000 then
        delay_next <= (others => '0');
        enable <= '1';
    else 
        delay_next <= delay + 1;
        enable <= '0';
    end if;
end process;

end Behavioral;
