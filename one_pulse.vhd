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

begin


end Behavioral;

