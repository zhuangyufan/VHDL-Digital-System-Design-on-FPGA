library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pr_encoder_16 is
    Port ( S : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC_VECTOR (3 downto 0);
           r : out STD_LOGIC);
end pr_encoder_16;

architecture STRUCTURE of pr_encoder_16 is
    component pr_encoder_4 is
         Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
           r : out STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (1 downto 0));
    end component pr_encoder_4;
    
    component mux is
         Port ( S : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC_VECTOR (1 downto 0));
    end component mux;
    
    signal A: STD_LOGIC_VECTOR (7 downto 0);
    signal B: STD_LOGIC_VECTOR (3 downto 0);
    

begin
--  First layer
    P3: pr_encoder_4 port map (S(3 downto 0) => S(15 downto 12), Z => A(7 downto 6), r => B(3));
    P2: pr_encoder_4 port map (S(3 downto 0) => S(11 downto  8), Z => A(5 downto 4), r => B(2));
    P1: pr_encoder_4 port map (S(3 downto 0) => S( 7 downto  4), Z => A(3 downto 2), r => B(1));
    P0: pr_encoder_4 port map (S(3 downto 0) => S( 3 downto  0), Z => A(1 downto 0), r => B(0));
    
-- Second layer 
    P4: pr_encoder_4 port map (S(3 downto 0) => B, Z => Z(3 downto 2), r => r);
    M: mux port map (S => A, Y => B, Z => Z(1 downto 0));

end STRUCTURE;
