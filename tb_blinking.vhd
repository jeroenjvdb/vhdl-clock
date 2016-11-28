--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:15:57 11/18/2016
-- Design Name:   
-- Module Name:   D:/school/elektronica 1/VHDLclock/vhdl-clock/tb_blinking.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: blinking
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
 
ENTITY tb_blinking IS
END tb_blinking;
 
ARCHITECTURE behavior OF tb_blinking IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT blinking
    PORT(
         istate : IN  std_logic_vector(3 downto 0);
         sysclk : IN  std_logic;
         bliclk : IN  std_logic;
         obli0 : OUT  std_logic_vector(3 downto 0)
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
   signal istate : std_logic_vector(3 downto 0) := (others => '0');
   signal sysclk : std_logic := '0';
   signal bliclk : std_logic := '0';

 	--Outputs
   signal obli0 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN

	timer_1s: timer 
	GENERIC MAP	(div=> 2)
	PORT MAP (
          clk => sysclk,
          pulse => bliclk
        );
 
 
	-- Instantiate the Unit Under Test (UUT)
   uut: blinking PORT MAP (
          istate => istate,
          sysclk => sysclk,
          bliclk => bliclk,
          obli0 => obli0
        );
		  
		  

   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin		
	
		istate <= "0000";
		wait for 30 ns;
		istate <= "0100";
		wait for 30 ns;
		istate <= "0010";
		wait for 30 ns;
		istate <= "0001";
		wait for 30 ns;
		istate <= "0010";
		wait for 30 ns;
		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
