library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity portadora is
	port(
		ctt : in std_logic_vector(7 downto 0);
		wave : out std_logic_vector(7 downto 0)
	);
end portadora;

architecture ondaTriangular of portadora is
	signal wave_temp : unsigned(7 downto 0);
	signal ctt_unsigned : unsigned(7 downto 0);
	
	begin
	ctt_unsigned <= unsigned(ctt);
	
	process(ctt_unsigned)
		
		begin
		wave_temp <= (others => '0');
		if ctt_unsigned < "10000000" then
			wave_temp <= (shift_left(ctt_unsigned, 1)); -- wave_temp recebe o dobro do valor em ctt
		elsif ctt_unsigned >= "1000000" then
			wave_temp <= ("11111111" - (shift_left(ctt_unsigned, 1))); -- wave_temp recebe (256 - o dobro do valor em ctt)
		end if;
	
		
	end process;

	wave <= std_logic_vector(wave_temp);
end ondaTriangular;