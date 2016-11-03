--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:36:28 11/03/2016
-- Design Name:   
-- Module Name:   D:/school/elektronica 1/VHDLclock/vhdl-clock/timer_tb.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: timer
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
 
ENTITY timer_tb IS
END timer_tb;
 
ARCHITECTURE behavior OF timer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
		-- 20000000 for 1 sec
		
    COMPONENT timer
	 generic (div : integer := 2000000);
    PORT(
         clk : IN  std_logic;
         pulse : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal pulse_1ms : std_logic;
	signal pulse_10ms : std_logic;
	signal pulse_100ms : std_logic;
	signal pulse_1s : std_logic;

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   timer_1s: timer 
	GENERIC MAP	(div=> 20000000)
	PORT MAP (
          clk => clk,
          pulse => pulse_1s
        );
	timer_100ms: timer 
		GENERIC MAP	(div=> 2000000)
		PORT MAP (
				 clk => clk,
				 pulse => pulse_100ms
			  );
	timer_10ms: timer 
		GENERIC MAP	(div=> 200000)
		PORT MAP (
				 clk => clk,
				 pulse => pulse_10ms
			  );
	timer_1ms: timer 
		GENERIC MAP	(div=> 20000)
		PORT MAP (
				 clk => clk,
				 pulse => pulse_1ms
			  );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
