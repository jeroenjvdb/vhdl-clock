----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:48 10/27/2016 
-- Design Name: 
-- Module Name:    timer - Behavioral 
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

entity timer is
	Generic (div : integer := 10);
    Port ( clk : in  STD_LOGIC;	 
           pulse : out  STD_LOGIC);
			  
			  
end timer;

architecture Behavioral of timer is

	signal cnt_signal : integer range 0 to div;
	constant max		: integer := div - 1;

begin

COUNT : process (clk)  
	begin		
		if rising_edge(clk) then 
			if cnt_signal = max
			then cnt_signal <= 0;
			else cnt_signal <=  cnt_signal + 1;
			end if;
		end if;
	end process;
	pulse <= '1' when cnt_signal = max else '0';
end Behavioral;

