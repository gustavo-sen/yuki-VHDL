library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity contador is
	port(
		clk, rst: in std_logic;
		delay : in integer;
		q: out std_logic_vector(7 downto 0)
	);
end contador;

architecture ctt of contador is
	signal q_temp : unsigned (7 downto 0);
	
	begin
	
	process(clk,rst)
		begin
		
		if rst = '1' then
			q_temp <= (others => '0'); -- aplica o valor 0 a todas as posições do vetor
			
		elsif rising_edge(clk) then 
			
			q_temp <= (q_temp + '1'); -- biblioteca STD permite concatenar '1' (bit) e 1 (integer)
			
		end if;
		
	end process;
	
		q <= std_logic_vector(q_temp); -- converte 'unsigned' para 'std_logic_vector'
	
end ctt;