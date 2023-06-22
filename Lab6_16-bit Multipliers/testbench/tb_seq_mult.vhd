-- tb_seq_mult.vhd
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.ALL; 
ENTITY tb_main IS
END tb_main; 
ARCHITECTURE behavior OF tb_main IS
-- Component Declaration for the Unit Under Test (UUT) 
component seq_mult is
 port (CLK, RESET, start: in std_logic;
 a_in, b_in: in std_logic_vector(15 downto 0);
 ready: out std_logic;
 r: out std_logic_vector(31 downto 0));
end component seq_mult;
--Inputs 
signal CLK : std_logic := '0'; 
signal RST : std_logic := '0'; 
signal a_in : std_logic_vector(15 downto 0);
signal b_in : std_logic_vector(15 downto 0);
signal start : std_logic;
--Outputs 
signal r : STD_LOGIC_VECTOR(31 downto 0);
signal ready : std_logic;
-- Clock period definitions 
constant CLOCK_period : time := 10ns; -- 100MHz
BEGIN
-- Instantiate the Unit Under Test (UUT) 
UUT: seq_mult PORT MAP ( 
CLK => CLK, 
RESET => RST,
r => r,
a_in => a_in,
b_in => b_in,
ready => ready,
start => start);
-- Clock process definitions 
CLOCK_process :process
begin
CLK <= '0'; 
wait for CLOCK_period/2; 
CLK <= '1'; 
wait for CLOCK_period/2; 
end process; 
-- reset process definitions 
reset_process:process
begin
RST <= '1'; 
for i in 1 to 2 loop
wait until CLK='1'; 
end loop; 
RST <='0'; 
wait; 
end process; 
a_in <= std_logic_vector(to_unsigned(5,16)), std_logic_vector(to_unsigned(64,16))
after 200ns, std_logic_vector(to_unsigned(4,16)) after 400ns;
b_in <= std_logic_vector(to_unsigned(5,16)), std_logic_vector(to_unsigned(4,16))
after 200ns, std_logic_vector(to_unsigned(64,16)) after 400ns;
start <= '1', '0' after 150ns, '1' after 200ns, '0' after 210 ns, '1' after 400ns,
'0' after 410 ns;
end; 
