----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:04 11/18/2016 
-- Design Name: 
-- Module Name:    select_show_function - Behavioral 
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

entity select_show_function is
    Port ( 
			  sysclk		: in  STD_LOGIC;
			  reset		: in	STD_LOGIC;
			  idig1 		: in  STD_LOGIC_VECTOR (23 downto 0); -- volledige tijd
           istate1 	: in  STD_LOGIC_VECTOR (3 downto 0); -- "0000" = counter, "0100" = uur aanpassen, "0010" = min aanpassen, "0001" = sec aanpassen
           idig2 		: in  STD_LOGIC_VECTOR (23 downto 0);
           istate2 	: in  STD_LOGIC_VECTOR (3 downto 0); -- "0000" = dag,mnd, "0100" = dag aanp, "0010" mnd aanpassen, "0001" jaar aanpassen
			  idig3		: in	STD_LOGIC_VECTOR (23 downto 0);
			  istate3	: in	STD_LOGIC_VECTOR (3 downto 0);
           sel 		: in  STD_LOGIC_VECTOR (2 downto 0); -- "100" = clock, "010" = date, "100" = wekker
			  
           odig 		: out  STD_LOGIC_VECTOR (23 downto 0);
           ostate 	: out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end select_show_function;

architecture Behavioral of select_show_function is

--signal sel: std_logic_vector(1 downto 0) := "00";
--signal odig: std_logic_vector (23 downto 0);

--signal idig1 		: STD_LOGIC_VECTOR (23 downto 0) := "100000000000000000000000"; -- volledige tijd
--signal istate1 	: STD_LOGIC_VECTOR (1 downto 0) := "00"; -- "00" = counter, "01" = uur aanpassen, "10" = min aanpassen, "11" = sec aanpassen
--signal idig2 		: STD_LOGIC_VECTOR (23 downto 0) := "010000000000000000000000";
--signal istate2 	: STD_LOGIC_VECTOR (1 downto 0) := "00";
--signal idig3		: STD_LOGIC_VECTOR (23 downto 0) := "001000000000000000000000";
--signal istate3		: STD_LOGIC_VECTOR (1 downto 0) := "00"; 

begin
	SET_DIG: process (sysclk, istate1, istate2, istate3, idig1, idig2,idig3)
		begin
		case sel is
			when "100" => 
				odig <= idig1;
				ostate <= istate1;
				--if 	istate1 = "1000" then ostate <= "0001"; 
				--elsif istate1 = "0100" then ostate <= "0010";
				--elsif istate1 = "1000" then ostate <= "0100";
				--elsif istate1 = "0001" then ostate <= "1000";
				--end if;
			when "010" => 
				odig <= idig2;
				ostate <= istate2;
				--if 	istate2 = "00" then ostate <= "0001"; 
				--elsif istate2 = "01" then ostate <= "0010";
				--elsif istate2 = "10" then ostate <= "0100";
				--elsif istate2 = "11" then ostate <= "1000";
				--end if;
			when "001" => 
				odig <= idig3;
				ostate <= istate3;
				--if 	istate3 = "00" then ostate <= "0001"; 
				--elsif istate3 = "01" then ostate <= "0010";
				--elsif istate3 = "10" then ostate <= "0100";
				--elsif istate3 = "11" then ostate <= "1000";
				--end if;
			when others =>
				odig <= idig1;
				ostate <= istate1;
				--if 	istate1 = "00" then ostate <= "0001"; 
				--elsif istate1 = "01" then ostate <= "0010";
				--elsif istate1 = "10" then ostate <= "0100";
				--elsif istate1 = "11" then ostate <= "1000";
				--end if;
		end case;
	end process;
	

end Behavioral;

