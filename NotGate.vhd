library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity NotGate is
	port(
		input: in std_logic;
		not_output : out std_logic 
	);
end NotGate;

architecture inverter of NotGate is

	begin
	not_output <= not input;

end inverter;