--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:01 11/18/2016
-- Design Name:   
-- Module Name:   D:/school/SCH-IW_EI/elektronica/digitale/labo/working_directory/clock/select_show_function_tb.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: select_show_function
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
 
ENTITY select_show_function_tb IS
END select_show_function_tb;
 
ARCHITECTURE behavior OF select_show_function_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT select_show_function
    PORT(
			sysclk: IN std_logic;
			reset: IN std_logic;
			
         idig1 	: IN  std_logic_vector(23 downto 0);
         istate1 	: IN  std_logic_vector(3 downto 0);
         idig2 	: IN  std_logic_vector(23 downto 0);
         istate2 	: IN  std_logic_vector(3 downto 0);
         idig3 	: IN  std_logic_vector(23 downto 0);
         istate3 	: IN  std_logic_vector(3 downto 0);
         sel 		: IN  std_logic_vector(2 downto 0);
         odig 		: OUT  std_logic_vector(23 downto 0);
         ostate 	: OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal sysclk 	: std_logic := '0';
   signal reset 	: std_logic := '0';
   signal idig1 	: std_logic_vector(23 downto 0) := (others => '0');
   signal istate1 : std_logic_vector(3 downto 0) := (others => '0');
   signal idig2 	: std_logic_vector(23 downto 0) := (others => '0');
   signal istate2 : std_logic_vector(3 downto 0) := (others => '0');
   signal idig3 	: std_logic_vector(23 downto 0) := (others => '0');
   signal istate3 : std_logic_vector(3 downto 0) := (others => '0');
   signal sel 		: std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal odig 	: std_logic_vector(23 downto 0);
   signal ostate 	: std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: select_show_function PORT MAP (
			 sysclk => sysclk,
			 reset => reset,
          idig1 => idig1,
          istate1 => istate1,
          idig2 => idig2,
          istate2 => istate2,
          idig3 => idig3,
          istate3 => istate3,
          sel => sel,
          odig => odig,
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
      -- hold reset state for 100 ns.
      wait for 100 ns;
		idig1 <= "100000000000000000000000";
		idig2 <= "010000000000000000000000";
		idig3 <= "001000000000000000000000";
		istate1 <= "1000";
		istate2 <= "1000";
		istate3 <= "1000";
		sel <= "100";
		wait for 100ns;
		istate1 <= "0100";
		wait for 100ns;
		istate1 <= "0010";
		wait for 100ns;
		istate1 <= "0001";
		wait for 100ns;
		sel <= "010";
		--istate2 <= "00";
		wait for 100ns;
		istate2 <= "0100";
		wait for 100ns;
		istate2 <= "0010";
		wait for 100ns;
		istate2 <= "0001";
		wait for 100ns;
		
		sel <= "001";
		--istate3 <= "00";
		wait for 100ns;
		istate3 <= "0100";
		wait for 100ns;
		istate3 <= "0010"; 
		wait for 100ns;
		istate3 <= "0001";
		wait for 100ns;
		

      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
