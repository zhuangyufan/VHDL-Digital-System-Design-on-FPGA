library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity speedControler is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           up : in STD_LOGIC;
           down : in std_logic;
           speed_out : out std_logic_vector(26 downto 0));
end speedControler;

architecture Behavioral of speedControler is
signal speed_reg, speed_next: std_logic_vector(26 downto 0);
signal a_reg, a_next, b_reg, b_next: std_logic; 

begin

process (RESET, CLK) 
begin 
    if RESET = '1' then 
        speed_reg <= std_logic_vector(to_unsigned(1464843,27));    -- 1464843
        a_reg <= '0';
        b_reg <= '0';
    elsif CLK='1' and CLK'event then 
        speed_reg <= speed_next;
        a_reg <= a_next;
        b_reg <= b_next;
end if; 
end process;  

process(up, a_reg)
begin
    a_next <= '0';
    if a_reg = '1' then
        a_next <= '0';
    elsif up'event and up = '1' then
        a_next <= '1';
    end if;   
end process;

process(down, b_reg)
begin
    b_next <= '0';
    if b_reg = '1' then
        b_next <= '0';
    elsif down'event and down = '1' then
        b_next <= '1';
    end if;   
end process;

speed_next <= speed_reg - 500000 when a_reg = '1' else
              speed_reg + 500000 when b_reg = '1' else
              speed_reg;

speed_out <= speed_reg;

end Behavioral;
