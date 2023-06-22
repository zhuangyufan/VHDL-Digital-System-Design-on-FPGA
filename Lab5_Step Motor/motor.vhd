library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity motor is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           ENB: in STD_LOGIC;
           direct: in STD_LOGIC;
           stop : in STD_LOGIC;
           output: out STD_LOGIC_VECTOR (3 downto 0));    -- A, B, C, D
end motor;

architecture Behavioral of motor is
signal output_reg, output_next : STD_LOGIC_VECTOR (3 downto 0);
signal st_reg, st_next:  STD_LOGIC;

begin
clk_proc: process (CLK, RST) is
    begin
        if (RST = '1') then
            output_reg <= "0000";
            st_reg <= '0';
        elsif (CLK'event and CLK = '1') then
            output_reg <= output_next;
            st_reg <= st_next;
        end if;
    end process clk_proc;

process (stop) is
begin 
    if stop'event and stop = '1' then
        st_next <= not st_reg;
    end if;
end process;

-- next state logic
-- clockwise: 1001, 1100, 0110, 0011
-- anti-clockwise: 1001,0011,0110,1100
output_next <= "0000" when st_reg = '1'

    -- clockwise
    else "1100" when (output_reg = "1001" and ENB = '1' and direct = '1')
    else "0110" when (output_reg = "1100" and ENB = '1' and direct = '1')
    else "0011" when (output_reg = "0110" and ENB = '1' and direct = '1')
    
    -- anti-clockwise
    else "0011" when (output_reg = "1001" and ENB = '1' and direct = '0')
    else "0110" when (output_reg = "0011" and ENB = '1' and direct = '0')
    else "1100" when (output_reg = "0110" and ENB = '1' and direct = '0')
    
    else "1001" when ENB = '1'
    else output_reg;

-- output logic
output <= output_reg;

end Behavioral;
