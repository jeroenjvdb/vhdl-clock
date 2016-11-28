----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date:    10:09:16 01/21/2015 
-- Design Name: 
-- Module Name:    weergave4dig7segm - Behavioral 
-- Project Name: 
-- Description: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity weergave4dig7segm is
	--Generic (div : integer := 100000);  
    Port ( sysclk, reset,en ,blank	 : in  STD_LOGIC;
           dig3,dig2,dig1,dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           cath 					 : out  STD_LOGIC_VECTOR (6 downto 0);
           an 						 : out  STD_LOGIC_VECTOR (3 downto 0)
			  --Led : out STD_LOGIC
			  );
end weergave4dig7segm;

architecture Behavioral of weergave4dig7segm is
    COMPONENT Control
    PORT(sysclk, en, blank 				: IN   std_logic;
         dig3,dig2,dig1,dig0 	: IN   std_logic_vector(3 downto 0);
         bcdout 					: OUT  std_logic_vector(3 downto 0);
         dignrout 				: OUT  std_logic_vector(3 downto 0));
    END COMPONENT; 
	 
    COMPONENT BCD7segmDec
    port(bcd 	: in	std_logic_vector(3 downto 0);
         seg 	: out	std_logic_vector(6 downto 0));
    END COMPONENT;
	 
	 COMPONENT timer
    PORT(
         sysclk : IN  std_logic;
			reset : IN std_logic := '0';
         pulse_1ms : OUT std_logic --, pulse_10ms, pulse_100ms, pulse_1s : OUT  std_logic
        );
    END COMPONENT;
	 
	 signal pulse_1ms : std_logic; 
	signal bcdout_int 			: std_logic_vector(3 downto 0);
	signal div : integer := 10000;
	--signal segen : std_logic := '0';
	--signal sysclk_count : integer(99 downto 0);
	signal cnt_signal : integer range 0 to div;
	constant max		: integer := div - 1;
	--signal reset : std_logic := '0';
	
	
begin
--COUNT : process (sysclk)  
	--begin	 	 
		--if rising_edge(sysclk) then 
		
		
			--if cnt_signal = max
			--then cnt_signal <= 0; pulse <= '1';
			--else cnt_signal <=  cnt_signal + 1; pulse <= '0';
			--end if;
		--end if;
	--end process; 
	--pulse <= '1' when cnt_signal = max else pulse <='0';
--PULSE : process(sysclk, cnt_signal)
	--begin
	--if cnt_signal = max then
		--pulse <= '1';
	--else
		--pulse <= '0';
	--end if;
	--end process;
	
	
	--SETSEGMENT : process(sysclk, pulse, blank, bcdout_int)
	--begin
	--T1: timer 
		--PORT MAP (
			--	 sysclk => sysclk,
			--    pulse_1ms => pulse_1ms,
			--	 reset => reset
			-- );
			  
   C1:Control PORT MAP (	sysclk => sysclk,en => en,blank=>'0',
									dig3 => dig3,dig2 => dig2,dig1 => dig1,dig0 => dig0,
									bcdout => bcdout_int,
									dignrout => an);
									--bcdout_int <= "1011";
	D1:BCD7segmDec PORT MAP (bcd => bcdout_int, seg => cath);
	--end process;
end Behavioral;

