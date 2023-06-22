library ieee;
use ieee.std_logic_1164.all;

entity mux8x1 is
    Port ( I : in  std_logic_vector(31 downto 0);
           S  : in  std_logic_vector(2 downto 0);
           O : out std_logic_vector(3 downto 0));
end mux8x1;

architecture Behavioral of mux8x1 is
begin

    process(S, I)
    begin
        case S is
            when "000" =>
                O <= I(31 downto 28);
            when "001" =>
                O <= I(27 downto 24);
            when "010" =>
                O <= I(23 downto 20);
            when "011" =>
                O <= I(19 downto 16);
            when "100" =>
                O <= I(15 downto 12);
            when "101" =>
                O <= I(11 downto 8);
            when "110" =>
                O <= I(7 downto 4);
            when "111" =>
                O <= I(3 downto 0);
            when others => 
                O <= "0000";             
        end case;
    end process;

end Behavioral;
