library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--USE ieee.numeric_std.ALL;

entity SineWave is
	port(
		ctt : in std_logic_vector(7 downto 0);
		offsetValue : in integer;
		delayValue : in integer;
		wave : out std_logic_vector(7 downto 0)
	);
end SineWave;

architecture ondaSenoidal of SineWave is 
	
	type tabela_seno is array (integer range<>) of integer;
	
	constant dados : tabela_seno (0 to 255) := 
	(
	126,   129,   131,   134,   136,   138,   141,
   143,   146,   148,   151,   153,   156,   158,
   160,   163,   165,   167,   170,   172,   174,
   176,   178,   181,   183,   185,   187,   189,
   191,   193,   194,   196,   198,   200,   202,
   203,   205,   206,   208,   209,   211,   212,
   213,   215,   216,   217,   218,   219,   220,
   221,   222,   223,   224,   224,   225,   226,
   226,   226,   227,   227,   228,   228,   228,
   228,   228,   228,   228,   228,   228,   227,
   227,   226,   226,   226,   225,   224,   224,
   223,   222,   221,   220,   219,   218,   217,
   216,   215,   213,   212,   211,   209,   208,
   206,   205,   203,   202,   200,   198,   196,
   194,   193,   191,   189,   187,   185,   183,
   181,   178,   176,   174,   172,   170,   167,
   165,   163,   160,   158,   156,   153,   151,
   148,   146,   143,   141,   138,   136,   134,
   131,   129,   126,   123,   121,   118,   116,
   114,   111,   109,   106,   104,   101,    99,
    96,    94,    92,    89,    87,    85,    82,
    80,    78,    76,    74,    71,    69,    67,
    65,    63,    61,    59,    58,    56,    54,
    52,    50,    49,    47,    46,    44,    43,
    41,    40,    39,    37,    36,    35,    34,
    33,    32,    31,    30,    29,    28,    28,
    27,    26,    26,    26,    25,    25,    24,
    24,    24,    24,    24,    24,    24,    24,
    24,    25,    25,    26,    26,    26,    27,
    28,    28,    29,    30,    31,    32,    33,
    34,    35,    36,    37,    39,    40,    41,
    43,    44,    46,    47,    49,    50,    52,
    54,    56,    58,    59,    61,    63,    65,
    67,    69,    71,    74,    76,    78,    80,
    82,    85,    87,    89,    92,    94,    96,
    99,   101,   104,   106,   109,   111,   114,
   116,   118,   121,   123
	);
	
	signal adress : integer;
	
	begin

	adress <= conv_integer(unsigned(ctt)); -- converte a entrada ctt para 'integer'

		
	wave <= std_logic_vector(conv_UNSIGNED(dados(adress + delayValue) + offsetValue, wave'length)); --converte o signal adress para 'Std_logic_vector'


end ondaSenoidal;
