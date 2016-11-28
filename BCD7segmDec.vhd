----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:43 11/03/2016 
-- Design Name: 
-- Module Name:    BCD7segmDec - Behavioral 
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

entity BCD7segmDec is
    Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           segm : out  STD_LOGIC_VECTOR (6 downto 0));
end BCD7segmDec;

architecture Behavioral of BCD7segmDec is

begin
process(bcd)
	  begin
		 case bcd is				-- 0-actieve 	-- HEX voor
	-----------------------------------------------------
			when "0000" => segm <= "1000000"; 		--  0	40
			when "0001" => segm <= "1111001";  		--  1	79
			when "0010" => segm <= "0100100";		--  2	24
			when "0011" => segm <= "0110000";		--  3	30
			when "0100" => segm <= "0011001";		--  4	19
			when "0101" => segm <= "0010010";		--  5	12
			when "0110" => segm <= "0000010";		--  6	02
			when "0111" => segm <= "1011000";		--  7	58
			when "1000" => segm <= "0000000";		--  8	00
			when "1001" => segm <= "0010000"; 		--  9	10
			when others => segm <= "1111111"; 		-- >9	7f
		 end case;
	  end process;

end Behavioral;

