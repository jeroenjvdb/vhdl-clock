----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:13 11/04/2016 
-- Design Name: 
-- Module Name:    one_pulse - Behavioral 
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

entity one_pulse is
    Port ( inp : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           debclk : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end one_pulse;

architecture Behavioral of one_pulse is
	type state is (wait1, outp1, wait0);
	signal current_state, next_state : state;
begin	
	STATE_REG: process(sysclk)
	begin
		if rising_edge(sysclk) then 
			current_state <= next_state; -- na cycle clock instellen van 1 of 0;
		end if;
	end process;
	
	SET_STATE: process (inp, current_state)
	begin 
	case current_state is
		when outp1 =>  next_state <= wait0;
		when wait1 =>  if inp = '1' then next_state <= outp1; else next_state <= wait1; end if;
		when wait0 =>  if inp = '0' then next_state <= wait1; else next_state <= wait0; end if;
	end case;
	end process;
	outp  <= '1' when current_state = outp1 else '0';
end Behavioral;

