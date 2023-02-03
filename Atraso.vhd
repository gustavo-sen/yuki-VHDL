library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;


entity Atraso is
	port(
		clk : in std_logic;
		inverse_enable_out : out std_logic
	);
end Atraso;


architecture atraso_comp of Atraso is
	
	signal cont : unsigned (7 downto 0);
	signal is_enable : std_logic;
	
	begin
	
		process(clk)
			
			begin
				
				if rising_edge(clk) then 
					is_enable <= '1'; 

					if "00010011" >= cont then
						cont <= (cont + 1); -- biblioteca STD permite concatenar '1' (bit) e 1 (integer)
					elsif cont >= "00010011" then
						is_enable <= '0';
					end if;
				end if;
			
		end process;
	
		inverse_enable_out <= std_logic(is_enable);
		
end atraso_comp;