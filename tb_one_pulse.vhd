--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:26:37 11/10/2016
-- Design Name:   
-- Module Name:   D:/school/elektronica 1/VHDLclock/vhdl-clock/tb_one_pulse.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: one_pulse
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
 
ENTITY tb_one_pulse IS
END tb_one_pulse;
 
ARCHITECTURE behavior OF tb_one_pulse IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT one_pulse
    PORT(
         inp : IN  std_logic;
         sysclk : IN  std_logic;
         debclk : IN  std_logic;
         outp : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT timer
	 generic (div : integer := 2000000);
    PORT(
         clk : IN  std_logic;
         pulse : OUT  std_logic
        );
    END COMPONENT;
	
			  
			  

    

   --Inputs
   signal inp : std_logic := '0';
   signal sysclk : std_logic := '0';
   signal debclk : std_logic := '0';

 	--Outputs
   signal outp : std_logic;
	signal pulse_1ms : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
   constant debclk_period : time := 10 ns;
 
BEGIN
 
 
 	timer_1ms: timer 
		GENERIC MAP	(div=> 20000)
		PORT MAP (
				 clk => sysclk,
				 pulse => pulse_1ms
			  );
 
	-- Instantiate the Unit Under Test (UUT)
   uut: one_pulse PORT MAP (
          inp => inp,
          sysclk => sysclk,
          debclk => pulse_1ms,
          outp => outp
        );

   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
 
   debclk_process :process
   begin
		debclk <= '0';
		wait for debclk_period/2;
		debclk <= '1';
		wait for debclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      inp <= '1';
		wait for 100 ns;
		
		inp <= '0';
		wait for 100 ns;

		inp <= '1';
		wait for 100 ns;
		
		inp <= '0';
		wait for 100 ns;

		inp <= '1';
		wait for 100 ns;
		
		inp <= '0';
		wait for 100 ns;

		inp <= '1';
		wait for 100 ns;

      wait for sysclk_period*10;
		
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
