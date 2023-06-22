library ieee;
use ieee.std_logic_1164.all;

entity hex7seg is
    port (
        x : in std_logic_vector(3 downto 0);
        LED : out std_logic_vector(7 downto 0)
    );
end entity;

architecture Behavioral of hex7seg is
begin
    process(x)
    begin
        case x is
        -- LED(7:0) <=> CA CB CC CD CE CF CG DP
            when "0000" => LED <= "00000011"; -- 0
            when "0001" => LED <= "10011111"; -- 1
            when "0010" => LED <= "00100101"; -- 2
            when "0011" => LED <= "00001101"; -- 3
            when "0100" => LED <= "10011001"; -- 4
            when "0101" => LED <= "01001001"; -- 5
            when "0110" => LED <= "01000001"; -- 6
            when "0111" => LED <= "00011111"; -- 7
            when "1000" => LED <= "00000001"; -- 8
            when "1001" => LED <= "00001001"; -- 9
            when "1010" => LED <= "00010001"; -- A
            when "1011" => LED <= "11000001"; -- B
            when "1100" => LED <= "01100011"; -- C
            when "1101" => LED <= "10000101"; -- D
            when "1110" => LED <= "01100001"; -- E
            when "1111" => LED <= "01110001"; -- F
            when others  => LED <= "11111111"; -- Not Display
        end case;
    end process;
    
end architecture;

