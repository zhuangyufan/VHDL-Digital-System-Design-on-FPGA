library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_pr_encoder is
 
end entity tb_pr_encoder;


architecture Behavioral of tb_pr_encoder is
    component pr_encoder_16 is 
        port (S: in std_logic_vector; Z : out std_logic_vector; r : out std_logic ); 
    end component pr_encoder_16;
    
signal S_tb: std_logic_vector (15 downto 0);
-- Observed signals - to connect testbench to OUT output ports
signal Z_tb: std_logic_vector (3 downto 0);
signal r_tb: std_logic;


begin

UUT: pr_encoder_16 port map (S => S_tb, Z => Z_tb, r => r_tb);

--signal assignment statements generating stimulus values

S_tb <= "1000000000000000", "0000100000000000" after 10ns, "0000000010000000" after 20ns, "0000000000001000" after 30ns, "0000000000000000" after 40ns;

end Behavioral;
