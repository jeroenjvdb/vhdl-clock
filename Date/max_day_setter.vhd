----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:40 11/10/2016 
-- Design Name: 
-- Module Name:    max_day_setter - Behavioral 
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

entity max_day_setter is
    Port ( MYinput : in  STD_LOGIC_VECTOR (15 downto 0);
           maxDay : out  STD_LOGIC_VECTOR (7 downto 0));
end max_day_setter;

architecture Behavioral of max_day_setter is
-- declaratie interne signalen
	signal DayUout 		: 	integer range 0 to 9;
	signal DayTout 		: 	integer range 0 to 9;
	signal MonthU			:	integer range 0 to 9;
	signal MonthT			:	integer range 0 to 9;
	signal YearU			:	integer range 0 to 9;
	signal YearT			:	integer range 0 to 9;
	
begin
		MonthU <= to_integer(unsigned(MYinput(11 downto 8))) ;	
		MonthT <= to_integer(unsigned(MYinput(15 downto 12))) ;	
		YearU <= to_integer(unsigned(MYinput(3 downto 0))) ;	
		YearT <= to_integer(unsigned(MYinput(7 downto 4))) ;
		
		MCNT :process (MonthU, MonthT, YearU, YearT)
	begin
		if    ((YearT mod 2 = 0 and YearU mod 4 = 0) or (YearT mod 2 /= 0 and YearU mod 4 = 2)) and (MonthT = 0 and MonthU = 2) then DayTout <= 2; DayUout <= 9;			-- Schrikkeljaar, 29 Februari    
		elsif (MonthT = 0 and (MonthU = 1 or MonthU = 3 or MonthU = 5 or MonthU = 7 or MonthU = 8)) or (MonthT = 1 and (MonthU = 0 or MonthU = 2)) then DayTout <= 3; DayUout <= 1;			-- Alle maanden met 31 dagen
		elsif (MonthT = 0 and (MonthU = 4 or MonthU = 6 or MonthU = 9)) or (MonthT = 1 and MonthU = 1) then DayTout <= 3; DayUout <= 0;			-- Alle maanden met 30 dagen
		else 	DayTout <= 2; DayUout <= 8; -- Geen Schrikkeljaar, 28 Februari
		end if;
	end process;
	maxDay(3 downto 0) <= std_logic_vector(to_unsigned(DayUout , 4));
	maxDay(7 downto 4) <= std_logic_vector(to_unsigned(DayTout , 4));
end Behavioral;

