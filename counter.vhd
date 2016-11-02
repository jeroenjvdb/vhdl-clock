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
			  min,max : in  STD_LOGIC_VECTOR (3 downto 0);
           count : out  STD_LOGIC_VECTOR (3 downto 0);
           tc : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is
	signal count_sig: unsigned (3 downto 0);	
begin 
	process (sysclk)
	begin
		if rising_edge(sysclk) 	then 
			if (reset = '1') 	then 	count_sig <= unsigned(min);																
			elsif cnten ='1' then
				if (std_logic_vector(count_sig) = max) then count_sig <= unsigned(min);
				else	count_sig <= count_sig + 1;																-- toestand + 1
				end if;
			end if;
		end if;	 			
	end process;
	tc <= '1' when ((std_logic_vector(count_sig) = max) and (cnten = '1')) else '0';
	count <= std_logic_vector(count_sig);	

end Behavioral;

