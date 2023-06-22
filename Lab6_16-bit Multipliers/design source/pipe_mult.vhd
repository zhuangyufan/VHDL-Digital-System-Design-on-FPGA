--pipe_mult.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity pipe_mult is 
 port (a, b : in std_logic_vector(15 downto 0);
 clk, reset : in std_logic;
 y: out std_logic_vector(31 downto 0));
end pipe_mult;
architecture pipe_arch of pipe_mult is
 constant WIDTH: integer := 16;
 signal a1, b1: std_logic_vector (WIDTH-1 downto 0);
 signal a_reg: std_logic_vector (WIDTH*(WIDTH-2)-1 downto 0); 
 signal b_reg: std_logic_vector (WIDTH*(WIDTH-2)-1 downto 0); 
 signal a_next: std_logic_vector (WIDTH*(WIDTH-2)-1 downto 0);
 signal b_next: std_logic_vector (WIDTH*(WIDTH-2)-1 downto 0);
 
 signal bv: std_logic_vector (WIDTH*WIDTH-1 downto 0);
 signal bp: std_logic_vector (2*WIDTH*WIDTH-1 downto 0):=(others => '0');
 signal pp_reg: std_logic_vector (2*WIDTH*(WIDTH-1)-1 downto 0);
 
 signal pp0: std_logic_vector (2*WIDTH-1 downto 0);
 signal pp_next: std_logic_vector (2*WIDTH*(WIDTH-1)-1 downto 0);
 
 signal zeroW: std_logic_vector(WIDTH-1 downto 0) :=(others => '0');
 signal zeroW1: std_logic_vector(WIDTH-2 downto 0) :=(others => '0');
begin
 process (clk, reset)
 begin
 if (reset = '1') then
 pp_reg <= (others => '0');
 a_reg <= (others => '0');
 b_reg <= (others => '0');
 elsif (clk'event and clk = '1') then
 pp_reg <= pp_next;
 a_reg <= a_next;
 b_reg <= b_next;
 end if;
 end process;
 
 stage_gen:
 for i in 1 to (WIDTH-1) generate
 stage01_gen: if i=1 generate
 bv(WIDTH-1 downto 0) <= (others => b(0));
 bp(WIDTH*2-1 downto 0) <= zeroW & (bv(WIDTH-1 downto 0) and a);
 pp0 <= bp(WIDTH*2-1 downto 0);
 a1 <= a;
 b1 <= b;
 --
 bv(WIDTH*2-1 downto WIDTH) <= (others => b1(1));
 bp(WIDTH*4-1 downto WIDTH*2) <= zeroW1 & (bv(WIDTH*2-1 downto WIDTH)
and a1) & "0";
 pp_next(WIDTH*2-1 downto 0) <= pp0 + bp(WIDTH*4-1 downto WIDTH*2);
 a_next(WIDTH-1 downto 0) <= a1;
 b_next(WIDTH-1 downto 0) <= b1;
 end generate;
 
 middle_gen: if(i > 1) and (i<(WIDTH-1)) generate
 bv(WIDTH*(i+1)-1 downto WIDTH*i) <= (others => b_reg(WIDTH*(i-2)+i));
 --bp(WIDTH*2*(i+1)-1 downto WIDTH*2*i) <= 
 bp(WIDTH*2*(i+1)-1-WIDTH+i downto WIDTH*2*i+i) <= (bv(WIDTH*(i+1)-1
downto WIDTH*i) and a_reg(WIDTH*(i-1)-1 downto WIDTH*(i-2)));
 pp_next(WIDTH*2*i-1 downto 2*WIDTH*(i-1)) <= pp_reg(WIDTH*2*(i-1)-1
downto 2*WIDTH*(i-2)) + bp(WIDTH*2*(i+1)-1 downto WIDTH*2*i);
 a_next(WIDTH*i-1 downto WIDTH*(i-1)) <= a_reg(WIDTH*(i-1)-1 downto
WIDTH*(i-2));
 b_next(WIDTH*i-1 downto WIDTH*(i-1)) <= b_reg(WIDTH*(i-1)-1 downto
WIDTH*(i-2));
 end generate;
 
 last_gen: if i= (WIDTH-1) generate
 bv(WIDTH*WIDTH-1 downto WIDTH*(WIDTH-1)) <= (others => b_reg(WIDTH*
(WIDTH-2)-1));
 bp(2*WIDTH*WIDTH-1 downto 2*WIDTH*(WIDTH-1)) <= "0" & (bv(WIDTH*WIDTH-1
downto WIDTH*(WIDTH-1)) and a_reg(WIDTH*(WIDTH-2)-1 downto WIDTH*(WIDTH-3))) &
zeroW1;
 pp_next(2*WIDTH*(WIDTH-1)-1 downto 2*WIDTH*(WIDTH-2)) <=
pp_reg(2*WIDTH*(WIDTH-2)-1 downto 2*WIDTH*(WIDTH-3)) + bp(2*WIDTH*WIDTH-1 downto
2*WIDTH*(WIDTH-1));
 end generate;
 end generate;
 -- output
 y <= pp_reg(2*WIDTH*(WIDTH-1)-1 downto 2*WIDTH*(WIDTH-2));
end pipe_arch;
