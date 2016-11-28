----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:01 11/03/2016 
-- Design Name: 
-- Module Name:    display_test - Behavioral 
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

entity display_test is
    Port ( sysclk : in  STD_LOGIC);
end display_test;

architecture Behavioral of display_test is
	COMPONENT time_block
		PORT(
			cnten,reset 			: IN std_logic;
			sysclk 					: IN std_logic;
			min 						: IN std_logic_vector(7 downto 0);
			max 						: IN std_logic_vector(7 downto 0); 
			upDwn						: IN std_logic;
			count 					: OUT std_logic_vector(7 downto 0);
			tc 						: OUT std_logic);
	END COMPONENT;
	COMPONENT weergave
		Port ( sysclk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           blank : in  STD_LOGIC;
           dig3, dig2, dig1, dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           cath : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
	END COMPONENT;
	
begin 

	--tBlock: time_block PORT MAP(cnten => '1', reset => '0', sysclk => sysclk, min => x"00", max => x"99", upDwn => '1');
	display: weergave PORT MAP(sysclk => sysclk, en => '1', blank => '0', dig3 => x"3", dig2 => x"2", dig1 => x"1", dig0 => x"0");

end Behavioral;

