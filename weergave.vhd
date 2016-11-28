----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:51 11/03/2016 
-- Design Name: 
-- Module Name:    weergave - Behavioral 
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

entity weergave is
    Port ( sysclk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           blank : in  STD_LOGIC;
           dig3, dig2, dig1, dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           cath : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end weergave;

architecture Behavioral of weergave is
	COMPONENT Control
    PORT(sysclk, en, blank 				: IN   std_logic;
         dig3,dig2,dig1,dig0 	: IN   std_logic_vector(3 downto 0);
         bcdout 					: OUT  std_logic_vector(3 downto 0);
         dignrout 				: OUT  std_logic_vector(3 downto 0));
    END COMPONENT;
	 COMPONENT BCD7segmDec
    port(bcd 	: in	std_logic_vector(3 downto 0);
         segm 	: out	std_logic_vector(6 downto 0));
    END COMPONENT;
	signal bcdout_int 			: std_logic_vector(3 downto 0);

begin
	C1:Control PORT MAP (	sysclk => sysclk,en => en,blank=>blank,
									dig3 => dig3,dig2 => dig2,dig1 => dig1,dig0 => dig0,
									bcdout => bcdout_int,dignrout => an);
	D1:BCD7segmDec PORT MAP (bcd => bcdout_int, segm => cath);


end Behavioral;

