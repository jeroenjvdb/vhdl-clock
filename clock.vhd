----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:44 11/28/2016 
-- Design Name: 
-- Module Name:    clock - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock is
    Port ( 
		sysclk : in  STD_LOGIC;
		reset : in std_logic;
      
		an : out  STD_LOGIC;
      cath : out  STD_LOGIC;
      led : out  STD_LOGIC);
end clock;

architecture Behavioral of clock is

COMPONENT timer 
PORT  ( sysclk : in  STD_LOGIC;	 
			  reset : in  STD_LOGIC := '0';
			  pulse_1ms : out  STD_LOGIC;
			  pulse_10ms : out STD_LOGIC;
			  pulse_100ms: out STD_LOGIC;
			  pulse_1s: out STD_LOGIC
			  );
end component;

COMPONENT weergave4dig7segm
Port ( sysclk, reset,en ,blank	 : in  STD_LOGIC;
           dig3,dig2,dig1,dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           cath 					 : out  STD_LOGIC_VECTOR (6 downto 0);
           an 						 : out  STD_LOGIC_VECTOR (3 downto 0)
			  --Led : out STD_LOGIC
			  );
end component;

COMPONENT time_block
Port ( 	sysclk,reset 	: in  STD_LOGIC;
				cnten	 			: in  STD_LOGIC;
				mode 			: in  STD_LOGIC;									-- OPGELET : voor deze ingangen mag de ingang slechts gedurende 1 klokperiode 1 zijn.
				incr, decr	: in  STD_LOGIC;
				time_cnt 		: out  STD_LOGIC_VECTOR (23 downto 0);
				tc 				: out  STD_LOGIC;
				state_vect		: out	 STD_LOGIC_VECTOR (3 downto 0) -- "1000" = counter, "0100" = uur aanpassen, "0010" = min aanpassen, "0001" = sec aanpassen
				);
end component;

signal pulse_1ms : std_logic := '0';
signal pulse_10ms : std_logic := '0';
signal pulse_100ms: std_logic := '0';
signal pulse_1s: std_logic := '0';

signal an : std_logic_vector(3 downto 0);
signal cath : std_logic_vector(6 downto 0);


begin

T1 : timer PORT MAP( 
	sysclk => sysclk,	reset => reset,
	pulse_1ms => pulse_1ms, pulse_10ms => pulse_10ms, pulse_100ms => pulse_100ms, pulse_1s => pulse_1s
);

C1 : time_block PORT MAP(
	sysclk => sysclk, cnten => pulse_1s, reset => reset, mode => '1', incr => '0', decr => '0',
	time_cnt => time_cnt, tc => tc, state_vect => state_vect
);

W1 : weergave4dig7segm PORT MAP (
	sysclk => sysclk, reset => reset, en => pulse_1ms,	blank => '0',
	dig3 => x"3", dig2 => x"2", dig1 => x"1",	dig0 => x"0",
	an => an, cath => cath
);


end Behavioral;

