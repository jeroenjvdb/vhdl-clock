--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:23:28 11/24/2016
-- Design Name:   
-- Module Name:   D:/school/elektronica 1/VHDLclock/vhdl-clock/tb_format_numbers.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: format_numbers
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
 
ENTITY tb_format_numbers IS
END tb_format_numbers;
 
ARCHITECTURE behavior OF tb_format_numbers IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT format_numbers
    PORT(
         idig : IN  std_logic_vector(23 downto 0);
         istate : IN  std_logic_vector(3 downto 0);
         number1 : OUT  std_logic_vector(3 downto 0);
         number2 : OUT  std_logic_vector(3 downto 0);
         number3 : OUT  std_logic_vector(3 downto 0);
         number4 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal idig : std_logic_vector(23 downto 0) := (others => '0');
   signal istate : std_logic_vector(3 downto 0) := (others => '0');
	
	--clock
	signal clock : STD_LOGIC := '0';

 	--Outputs
   signal number1 : std_logic_vector(3 downto 0);
   signal number2 : std_logic_vector(3 downto 0);
   signal number3 : std_logic_vector(3 downto 0);
   signal number4 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_time : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: format_numbers PORT MAP (
          idig => idig,
          istate => istate,
          number1 => number1,
          number2 => number2,
          number3 => number3,
          number4 => number4
        );

   -- Clock process definitions
   clock_timing:process
   begin
		clock <= '0';
		wait for clock_time/2;
		clock <= '1';
		wait for clock_time/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		idig <= "010101010101010101111111";
		istate <= "1000";
      wait for 100 ns;	
		--idig <= "010101010101010101010101";
		istate <= "0100";
      wait for 100 ns;	
		--idig <= "010101010101010101010101";
		istate <= "0001";
      wait for 100 ns;	
		idig <= "111111111111111111111111";
		--istate <= "1000";
      wait for 100 ns;	
		--idig <= "010101010101010101010101";
		istate <= "1000";
      wait for 100 ns;	

      wait for clock_time*10;

      -- insert stimulus here 

      wait;
   end process;

END;
