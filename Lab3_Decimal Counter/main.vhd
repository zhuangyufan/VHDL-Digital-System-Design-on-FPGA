--main.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           s : in STD_LOGIC_VECTOR (11 downto 0);
           d100 : out STD_LOGIC_VECTOR (3 downto 0);
           d10 : out STD_LOGIC_VECTOR (3 downto 0);
           d1 : out STD_LOGIC_VECTOR (3 downto 0));
end main;

architecture STRUCTURE of main is
    component decimal_counter is
        port (ENABLE, RESET, LOAD, CLK: in std_logic;
                d1, d10, d100: out std_logic_vector(3 downto 0);
                s: in std_logic_vector(11 downto 0));
    end component decimal_counter;
    
    component divider is
        Port ( CLK : in STD_LOGIC;
             RESET : in STD_LOGIC;
             ENABLE : out STD_LOGIC);
    end component divider;
    
    signal e: STD_LOGIC ;
    

begin
--  Frenquency Divider
    D: divider port map (CLK => CLK, RESET => RESET, ENABLE => e);

-- Decimal Counter 
    C: decimal_counter port map (CLK => CLK, ENABLE => e, RESET => RESET, LOAD => LOAD, s => s, d100 => d100, d10 => d10, d1 => d1);
end STRUCTURE;
