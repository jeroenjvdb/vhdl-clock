----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:43 11/04/2016 
-- Design Name: 
-- Module Name:    button - Behavioral 
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

entity button is
    Port ( btn : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           debclk : in  STD_LOGIC;
           op : out  STD_LOGIC);
end button;

architecture Behavioral of button is

COMPONENT debouncer
Port( inp 	: in STD_LOGIC;
		debclk : in STD_LOGIC;
		sysclk : in STD_LOGIC;
		op 	 : out STD_LOGIC);
END COMPONENT;

COMPONENT one_pulse
Port( inp 	: in STD_LOGIC;
		debclk : in STD_LOGIC;
		sysclk : in STD_LOGIC;
		outp 	 : out STD_LOGIC);
END COMPONENT;

	signal pulse : STD_LOGIC := '0';

begin
	debouncer1: 	debouncer port map (inp=>btn, op=>pulse, sysclk=>sysclk, debclk=>debclk);
	one_pulse1: 	one_pulse	 port map (inp=>pulse, outp=>op ,sysclk=>sysclk, debclk => debclk);
end Behavioral;

