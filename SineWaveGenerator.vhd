 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SineWaveGenerator is
	port (
		clk, rst: in std_logic;
		set_clock: in std_logic_vector(7 downto 0);
		sin,not_sin: out std_logic
	);
end SineWavegenerator;

architecture threePWM of SineWaveGenerator is 
	
	component contador is
		port (
			clk, rst: in std_logic;
			q: out std_logic_vector(7 downto 0)
		);
	end component contador;
	
	component portadora is 
		port (
			ctt : in std_logic_vector(7 downto 0);
			wave : out std_logic_vector(7 downto 0)
		);
		
	end component portadora;
	
	component SineWave is 
		port (
			ctt : in std_logic_vector(7 downto 0);
			wave : out std_logic_vector(7 downto 0)
		);
	end component SineWave;
	
	component comparador is
		port (
			input_minus, input_plus : in std_logic_vector(7 downto 0);
			output_signal : out std_logic
		);
	end component comparador;
	
	component divisor_de_clock is
		port(
			i_clk         : in  std_logic;
			i_rst         : in  std_logic;
			i_clk_divider : in  std_logic_vector(7 downto 0);
			o_clk         : out std_logic);
	
	end component divisor_de_clock;
	
	component Atraso is
		port(
			clk : in std_logic;
			inverse_enable_out : out std_logic
		);
	end component Atraso;
	
	component NotGate is
		port(
			input: in std_logic;
			not_output : out std_logic 
		);
	end component NotGate;
	
	
	signal divisor_out,atraso_enable,sin_2 : std_logic;
	signal contador_1, contador_2,contador_3,moduladora_1,moduladora_2,triangular_out : std_logic_vector (7 downto 0);
	
	begin
		
		--Divisor de Clock
		div_1 : divisor_de_clock 
			port map(clk,rst,set_clock,divisor_out);
		
		-- Atraso
		at : Atraso
			port map(clk,atraso_enable);
		
		-- contadores
		
		ct_1 : contador
			port map(divisor_out,rst,contador_1);
		
		ct_2 : contador
			port map(divisor_out,atraso_enable,contador_2);
			
		ct_3 : contador --contador da triangular
			port map(clk,rst,contador_3);
		
		--triangular
		tri : portadora
			port map(contador_3,triangular_out);
			
		--senoidal

		senoidal_1 : SineWave
			port map(contador_1,moduladora_1);
		
		senoidal_2 : SineWave
			port map(contador_2,moduladora_2);
	
		
		-- comparadores
		comp_1 : comparador
			port map(moduladora_1,triangular_out,sin);
			
		comp_2 : comparador
			port map(moduladora_2,triangular_out,sin_2);
		
		--inversor
		nGate : NotGate
			port map (sin_2,not_sin);


end threePWM;

