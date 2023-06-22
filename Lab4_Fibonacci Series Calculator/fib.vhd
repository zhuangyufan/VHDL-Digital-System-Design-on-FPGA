library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fib is
    Port ( CLK: in STD_LOGIC;
           RST: in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (4 downto 0);   -- 5bits
           output : out STD_LOGIC_VECTOR (31 downto 0));   -- 32bits
end fib;

architecture Behavioral of fib is

-- State Definition
type state_type is (idle, i0, i1, load, op);
signal state, state_next : state_type;

-- Signal Definition
signal f0 :STD_LOGIC_VECTOR (31 downto 0);       -- f(n-2)
signal f0_next :STD_LOGIC_VECTOR (31 downto 0);
signal f1 :STD_LOGIC_VECTOR (31 downto 0);       -- f(n-1)
signal f1_next :STD_LOGIC_VECTOR (31 downto 0);
signal n : STD_LOGIC_VECTOR (4 downto 0);        -- counter
signal n_next : STD_LOGIC_VECTOR (4 downto 0);
signal start: STD_LOGIC;
signal start_next: STD_LOGIC;


begin
    process (CLK, RST) is
    begin
        if (RST = '1') then
            state <= idle;
            start <= '1';
            f0 <= (others => '0');
            f1 <= (others => '0');
        elsif (CLK'event and CLK = '1') then
            state <= state_next;
            f0 <= f0_next;
            f1 <= f1_next;
            n <= n_next;
            start <= start_next;
        end if;
    end process;
    
    process (f0, f1, n, start, state) is
    begin
            -- default value
            f0_next <= f0;
            f1_next <= f1;
            case state is
                when idle =>
                    if start = '1' then
                        if input = "00000" then
                            state_next <= i0;
                        elsif input = "00001" then
                            state_next <= i1;
                        else
                            state_next <= load;
                        end if;
                    else
                        state_next <= idle;
                    end if;
                    
                when i0 =>
                    f1_next <= (others => '0');
                    state_next <= idle;
                    start_next <= '0';
                    
                when i1 =>
                    f1_next <= (0 => '1', others => '0');
                    state_next <= idle;
                    start_next <= '0';
                    
                when load =>
                    n_next <= input - 2;
                    f0_next <= (others => '0');   
                    f1_next <= (0 => '1', others => '0');
                    state_next <= op;
                
                when op =>
                    f1_next <= f0 + f1;
                    f0_next <= f1;
                    n_next <= n - 1;
                    if n = "00000" then
                        state_next <= idle;
                        start_next <= '0';
                        n_next <= "00000";
                    else
                        state_next <= op;
                    end if;
                end case;
   end process; 
   output <= f1; 
end Behavioral;
