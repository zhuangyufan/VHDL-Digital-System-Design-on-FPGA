library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           up : in STD_LOGIC;
           down: in STD_LOGIC;
           direct: in STD_LOGIC;
           stop : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end main;

architecture structure of main is
component motor is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           ENB: in STD_LOGIC;
           direct: in STD_LOGIC;
           stop : in STD_LOGIC;
           output: out STD_LOGIC_VECTOR (3 downto 0));    -- A, B, C, D
end component motor;

component freqDivider is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           speed : in std_logic_vector(26 downto 0); 
           ENABLE : out STD_LOGIC);
end component freqDivider;

component speedControler is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           up : in STD_LOGIC;
           down : in std_logic;
           speed_out : out std_logic_vector(26 downto 0));
end component speedControler;

signal en: STD_LOGIC;
signal sp: std_logic_vector(26 downto 0);

begin
F: freqDivider port map (CLK => CLK, RESET => RST, ENABLE => en, speed => sp);
M: motor port map (CLK => CLK, RST => RST, ENB => en, output => output, direct => direct, stop => stop);
S: speedControler port map (CLK => CLK, RESET => RST, up => up, down => down, speed_out => sp);

end structure;
