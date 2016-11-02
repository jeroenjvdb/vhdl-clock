----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:45 11/02/2016 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( sysclk, cnten, reset, upDwn : in  STD_LOGIC;
			  min,max : in  STD_LOGIC_VECTOR (7 downto 0);
           count : out  STD_LOGIC_VECTOR (7 downto 0);
           tc : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is
-- declaratie interne signalen
	signal Ucnt 		: 	integer range 0 to 9;
	signal Tcnt 		: 	integer range 0 to 9;
	signal Umin			:	integer range 0 to 9;
	signal Tmin			:	integer range 0 to 9;
	signal Umax			:	integer range 0 to 9;
	signal Tmax			:	integer range 0 to 9;
	--signal count_sig: unsigned (3 downto 0);	
	
begin 
		Umin <= to_integer(unsigned(min(3 downto 0))) ;	
		Tmin <= to_integer(unsigned(min(7 downto 4))) ;	
		Umax <= to_integer(unsigned(max(3 downto 0))) ;	
		Tmax <= to_integer(unsigned(max(7 downto 4))) ;
	CNT: process (sysclk)
	begin 
		if rising_edge(sysclk) 	then 
			if 	reset = '1' then Tcnt <= Tmin; Ucnt <= Umin;								-- RESET
			elsif	updwn = '1' and cnten = '1' then												-- OPTELLEN					
				if Tcnt = Tmax and  Ucnt = Umax then Tcnt <= Tmin;	  Ucnt <= Umin; 	
				elsif	Ucnt	= 9 then	Tcnt <= Tcnt + 1;Ucnt <= 0;
				else  Ucnt	<= Ucnt + 1;														
				end if;
			elsif updwn ='0' and cnten='1' then													-- AFTELLEN
				if Tcnt = Tmin and  Ucnt = Umin then Tcnt <= Tmax;Ucnt <= Umax;							
				elsif Ucnt = 0 then Tcnt <= Tcnt - 1;Ucnt <= 9 ;	
				else 	Ucnt <= Ucnt - 1;					
				end if;
			end if;
		end if;	 			
	end process;
	MCNT :process (Ucnt,Tcnt,updwn,cnten,Umax,Umin,Tmax,Tmin)
	begin
		if    (Ucnt = Umax and Tcnt = Tmax) and updwn = '1' and cnten = '1' then tc <= '1';
		elsif (Ucnt = Umin and Tcnt = Tmin) and updwn = '0' and cnten = '1' then tc <= '1';
		else 	tc <='0';
		end if;
	end process;
	count(3 downto 0) <= std_logic_vector(to_unsigned(Ucnt, 4));
	count(7 downto 4) <= std_logic_vector(to_unsigned(Tcnt, 4));
	--tc <= '1' when ((std_logic_vector(count_sig) = max) and (cnten = '1')) else '0';
end Behavioral;

