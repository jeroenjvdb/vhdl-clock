--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:45:09 11/10/2016
-- Design Name:   
-- Module Name:   D:/School UAntwerpen/Electronica-1/Labo Digitaal/ISE Projects/Gitmap kopie/vhdl-clock/Date/tb_max_day_setter.vhd
-- Project Name:  Date
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: max_day_setter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_max_day_setter IS
END tb_max_day_setter;
 
ARCHITECTURE behavior OF tb_max_day_setter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT max_day_setter
    PORT(
         MYinput : IN  std_logic_vector(15 downto 0);
         maxDay : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MYinput : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal maxDay : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: max_day_setter PORT MAP (
          MYinput => MYinput,
          maxDay => maxDay
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      

      -- insert stimulus here 
		MYinput <= "0000000100010110";
		wait for 100 ns;
		MYinput <= "0000001000010110";
		wait for 100 ns;
		MYinput <= "0000001000010111";
		wait for 100 ns;
		MYinput <= "0000001100010111";
		wait for 100 ns;
		MYinput <= "0000010000010111";
		wait for 100 ns;
		MYinput <= "0000010100010111";
		wait for 100 ns;
		MYinput <= "0000011000010111";
		wait for 100 ns;
		MYinput <= "0000011100010111";
		wait for 100 ns;
		MYinput <= "0000100000010111";
		wait for 100 ns;
		MYinput <= "0000100100010111";
		wait for 100 ns;
		MYinput <= "0001000000010111";
		wait for 100 ns;
		MYinput <= "0001000100010111";
		wait for 100 ns;
		MYinput <= "0001001000010111";
      wait;
   end process;

END;
