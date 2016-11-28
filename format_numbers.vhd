----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:29:20 11/18/2016 
-- Design Name: 
-- Module Name:    format_numbers - Behavioral 
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

entity format_numbers is
    Port ( idig : in  STD_LOGIC_VECTOR (23 downto 0);
           istate : in  STD_LOGIC_VECTOR (3 downto 0);
			  number1 : out  STD_LOGIC_VECTOR (3 downto 0);
           number2 : out  STD_LOGIC_VECTOR (3 downto 0);
           number3 : out  STD_LOGIC_VECTOR (3 downto 0);
           number4 : out  STD_LOGIC_VECTOR (3 downto 0));
end format_numbers;

architecture Behavioral of format_numbers is

begin
	format:process(istate, idig)
	begin
		if istate = "0001" then
			number1 <= (others => '0');
			number2 <= (others => '0');
			number3 <= idig(19 downto 16);
			number4 <= idig(23 downto 20);
		else
			number1 <= idig(3 downto 0);
			number2 <= idig(7 downto 4);
			number3 <= idig(11 downto 8);
			number4 <= idig(15 downto 12);
		end if;
	end process;
end Behavioral;

