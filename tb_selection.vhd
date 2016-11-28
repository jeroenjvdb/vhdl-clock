--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:07:26 11/17/2016
-- Design Name:   
-- Module Name:   D:/school/elektronica 1/VHDLclock/vhdl-clock/tb_selection.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: selection
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
 
ENTITY tb_selection IS
END tb_selection;
 
ARCHITECTURE behavior OF tb_selection IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT selection
    PORT(
         i1 : IN  std_logic;
         i2 : IN  std_logic;
         i3 : IN  std_logic;
         selectm : IN  std_logic;
         sysclk : IN  std_logic;
         U1_1 : OUT  std_logic;
         U1_2 : OUT  std_logic;
         U1_3 : OUT  std_logic;
         U2_1 : OUT  std_logic;
         U2_2 : OUT  std_logic;
         U2_3 : OUT  std_logic;
         U3_1 : OUT  std_logic;
         U3_2 : OUT  std_logic;
         U3_3 : OUT  std_logic;
			ostate : OUT STD_LOGIC_VECTOR(1 downto 0)			
        );
    END COMPONENT;
    

   --Inputs
   signal i1 : std_logic := '0';
   signal i2 : std_logic := '0';
   signal i3 : std_logic := '0';
   signal selectm : std_logic := '0';
   signal sysclk : std_logic := '0';

 	--Outputs
   signal U1_1 : std_logic ;
   signal U1_2 : std_logic;
   signal U1_3 : std_logic;
   signal U2_1 : std_logic;
   signal U2_2 : std_logic;
   signal U2_3 : std_logic;
   signal U3_1 : std_logic;
   signal U3_2 : std_logic;
   signal U3_3 : std_logic;
	signal ostate : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: selection PORT MAP (
          i1 => i1,
          i2 => i2,
          i3 => i3,
          selectm => selectm,
          sysclk => sysclk,
          U1_1 => U1_1,
          U1_2 => U1_2,
          U1_3 => U1_3,
          U2_1 => U2_1,
          U2_2 => U2_2,
          U2_3 => U2_3,
          U3_1 => U3_1,
          U3_2 => U3_2,
          U3_3 => U3_3,
			 ostate => ostate
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
	
		i1 <= '0';
		i2 <= '0';
		i3 <= '0';
		selectm <= '0';
		wait for 10 ns;
		
		i1 <= '0';
		i2 <= '1';
		i3 <= '0';
		selectm <= '0';
		wait for 10 ns;
		
		i1 <= '0';
		i2 <= '0';
		i3 <= '0';
		selectm <= '1';
		wait for 10 ns;
		
		i1 <= '1';
		i2 <= '0';
		i3 <= '0';
		selectm <= '0';
		wait for 10 ns;
		
		i1 <= '0';
		i2 <= '0';
		i3 <= '1';
		selectm <= '0';
		wait for 10 ns;
		
		i1 <= '0';
		i2 <= '0';
		i3 <= '0';
		selectm <= '1';
		wait for 10 ns;
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
