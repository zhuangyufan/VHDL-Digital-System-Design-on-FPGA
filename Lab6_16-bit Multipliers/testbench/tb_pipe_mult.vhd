-- tb_pipe_mult.vhd
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.ALL; 
ENTITY tb_pipe_mult IS
END tb_pipe_mult; 
ARCHITECTURE behavior OF tb_pipe_mult IS
-- Component Declaration for the Unit Under Test (UUT) 
component pipe_mult is
 port (CLK, RESET: in std_logic;
 a, b: in std_logic_vector(15 downto 0);
 y: out std_logic_vector(31 downto 0));
end component pipe_mult;
--Inputs 
signal CLK : std_logic := '0'; 
signal RST : std_logic := '0'; 
signal a : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(5,16));
signal b : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(5,16));
--Outputs 
signal y : STD_LOGIC_VECTOR(31 downto 0);
-- Clock period definitions 
constant CLOCK_period : time := 10ns; -- 100MHz
BEGIN
-- Instantiate the Unit Under Test (UUT) 
UUT: pipe_mult PORT MAP ( 
CLK => CLK, 
RESET => RST,
y => y,
a => a,
b => b);
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
a <= std_logic_vector(to_unsigned(5,16)), 
 std_logic_vector(to_unsigned(16,16)) after 150ns,
 std_logic_vector(to_unsigned(17,16)) after 160ns,
 std_logic_vector(to_unsigned(18,16)) after 170ns,
 std_logic_vector(to_unsigned(19,16)) after 180ns,
 std_logic_vector(to_unsigned(20,16)) after 190ns,
 std_logic_vector(to_unsigned(1,16)) after 200ns, 
 std_logic_vector(to_unsigned(2,16)) after 210ns,
 std_logic_vector(to_unsigned(3,16)) after 220ns,
 std_logic_vector(to_unsigned(4,16)) after 230ns,
 std_logic_vector(to_unsigned(5,16)) after 240ns,
 std_logic_vector(to_unsigned(6,16)) after 250ns,
 std_logic_vector(to_unsigned(7,16)) after 260ns,
 std_logic_vector(to_unsigned(8,16)) after 270ns,
 std_logic_vector(to_unsigned(9,16)) after 280ns,
 std_logic_vector(to_unsigned(10,16)) after 290ns,
 std_logic_vector(to_unsigned(11,16)) after 300ns,
 std_logic_vector(to_unsigned(12,16)) after 310ns,
 std_logic_vector(to_unsigned(13,16)) after 320ns,
 std_logic_vector(to_unsigned(14,16)) after 330ns,
 std_logic_vector(to_unsigned(15,16)) after 340ns,
 std_logic_vector(to_unsigned(16,16)) after 350ns,
 std_logic_vector(to_unsigned(17,16)) after 360ns,
 std_logic_vector(to_unsigned(18,16)) after 370ns,
 std_logic_vector(to_unsigned(19,16)) after 380ns,
 std_logic_vector(to_unsigned(20,16)) after 390ns;
 
b <= std_logic_vector(to_unsigned(5,16)),
 std_logic_vector(to_unsigned(16,16)) after 150ns,
 std_logic_vector(to_unsigned(17,16)) after 160ns,
 std_logic_vector(to_unsigned(18,16)) after 170ns,
 std_logic_vector(to_unsigned(19,16)) after 180ns,
 std_logic_vector(to_unsigned(20,16)) after 190ns,
 std_logic_vector(to_unsigned(1,16)) after 200ns, 
 std_logic_vector(to_unsigned(2,16)) after 210ns,
 std_logic_vector(to_unsigned(3,16)) after 220ns,
 std_logic_vector(to_unsigned(4,16)) after 230ns,
 std_logic_vector(to_unsigned(5,16)) after 240ns,
 std_logic_vector(to_unsigned(6,16)) after 250ns,
 std_logic_vector(to_unsigned(7,16)) after 260ns,
 std_logic_vector(to_unsigned(8,16)) after 270ns,
 std_logic_vector(to_unsigned(9,16)) after 280ns,
 std_logic_vector(to_unsigned(10,16)) after 290ns,
 std_logic_vector(to_unsigned(11,16)) after 300ns,
 std_logic_vector(to_unsigned(12,16)) after 310ns,
 std_logic_vector(to_unsigned(13,16)) after 320ns,
 std_logic_vector(to_unsigned(14,16)) after 330ns,
 std_logic_vector(to_unsigned(15,16)) after 340ns,
 std_logic_vector(to_unsigned(16,16)) after 350ns,
 std_logic_vector(to_unsigned(17,16)) after 360ns,
 std_logic_vector(to_unsigned(18,16)) after 370ns,
 std_logic_vector(to_unsigned(19,16)) after 380ns,
 std_logic_vector(to_unsigned(20,16)) after 390ns;
 
end;
