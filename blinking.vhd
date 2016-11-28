----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:53 11/17/2016 
-- Design Name: 
-- Module Name:    blinking - Behavioral 
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

entity blinking is
    Port ( istate : in  STD_LOGIC_VECTOR (3 downto 0);
			  sysclk : in std_logic;
			  bliclk : in std_logic;
           obli0 : out  STD_LOGIC_Vector (3 downto 0));
end blinking;

architecture Behavioral of blinking is

	signal obli0_s : STD_LOGIC_Vector (3 downto 0) := (others => '0');

begin
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			if bliclk = '1' then
				case istate is
					--when "0000" => 
					when "0001" => obli0_s <= "0011";
					when "0010" => obli0_s <= "0011";
					when "0100" => obli0_s <= "1100";
					when others => obli0_s <= "0000";
				end case;
			else
				obli0_s <= "0000";
			end if;
		end if;
	end process;
	obli0 <= obli0_s;
end Behavioral;

