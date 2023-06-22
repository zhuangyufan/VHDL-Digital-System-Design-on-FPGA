library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (4 downto 0); -- 5 whitches
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end main;

architecture STRUCTURE of main is
    component hex7seg is
    port (
        x : in std_logic_vector(3 downto 0);
        LED : out std_logic_vector(7 downto 0)
    );
    end component hex7seg;
    
    component compute_current_anode is
        Port ( CLK : in STD_LOGIC;
           ENB : in STD_LOGIC;
           RST : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
    end component compute_current_anode;
    
    component decoder3x8 is
    port (
    I    : in  std_logic_vector(2 downto 0);
    AN   : out std_logic_vector(7 downto 0)
    );
    end component decoder3x8;
    
    component freqDivider is
        Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           ENABLE : out STD_LOGIC);
    end component freqDivider;
    
    component mux8x1 is
        Port ( I : in  std_logic_vector(31 downto 0);
           S  : in  std_logic_vector(2 downto 0);
           O : out std_logic_vector(3 downto 0));
    end component mux8x1;
    
    component fib is
    Port ( CLK: in STD_LOGIC;
           RST: in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (4 downto 0);   -- 5bits
           output : out STD_LOGIC_VECTOR (31 downto 0));   -- 32bits
    end component fib;
    
    signal fib_output: std_logic_vector(31 downto 0);
    signal en: std_logic;
    signal b: std_logic_vector(2 downto 0);
    signal a: std_logic_vector(3 downto 0);
    
    
begin

-- Frequency Divider
F: freqDivider port map (CLK => CLK, RESET => RESET, ENABLE => en);
-- Compute current anode (3-bit)
C: compute_current_anode port map (CLK => CLK, ENB => en, RST => RESET,O => b);
-- Set Anodes (3x8 decoder)
D: decoder3x8 port map (I => b, AN => AN);
-- 8x1 MUX
M: mux8x1 port map (
    I => fib_output,
    S => b,
    O => a);
-- Hex to 7 decoder
H: hex7seg port map (x => a, LED => LED);
-- Fibonacci Calculator
FB: fib port map (CLK => CLK, RST => RESET, input => input, output => fib_output);
    
    
end STRUCTURE;

