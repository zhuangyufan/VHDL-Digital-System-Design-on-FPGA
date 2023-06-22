library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pr_encoder_4 is
    Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
           r : out STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (1 downto 0));
end pr_encoder_4;

architecture Behavioral of pr_encoder_4 is

begin
Z <= "11" when S(3) = '1' else
"10" when S(2) = '1' else
"01" when S(1) = '1' else
"00" when S(0) = '1' else
"00";
r <= S(3) or S(2) or S(1) or S(0);

end Behavioral;
