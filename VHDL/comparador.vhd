library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity comparador is
	port(
		input_minus, input_plus : in std_logic_vector(7 downto 0);
		output_signal : out std_logic 
	);
end comparador;

architecture comp of comparador is

	begin
	output_signal <= '1' when (input_plus > input_minus) else '0';

end comp;