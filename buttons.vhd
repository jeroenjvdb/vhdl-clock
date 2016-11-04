----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:35 11/04/2016 
-- Design Name: 
-- Module Name:    buttons - Behavioral 
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

entity buttons is
    Port ( btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           btn4 : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           debclk : in  STD_LOGIC;
           op1 : out  STD_LOGIC;
           op2 : out  STD_LOGIC;
           op3 : out  STD_LOGIC;
           op4 : out  STD_LOGIC);
end buttons;

architecture Behavioral of buttons is

begin


end Behavioral;

