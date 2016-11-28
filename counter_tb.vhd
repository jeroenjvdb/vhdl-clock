--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:46:55 11/02/2016
-- Design Name:   
-- Module Name:   D:/school/SCH-IW_EI/elektronica/digitale/labo/working_directory/clock/counter_tb.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
ENTITY counter_tb IS
END counter_tb;
 
ARCHITECTURE behavior OF counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         sysclk : IN  std_logic;
         cnten : IN  std_logic;
         reset : IN  std_logic;
         upDwn : IN  std_logic;
         min : IN  std_logic_vector(7 downto 0) := x"00";
         max : IN  std_logic_vector(7 downto 0) := x"99";
         count : OUT  std_logic_vector(7 downto 0);
         tc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs 
   signal sysclk : std_logic := '0';
   signal cnten : std_logic := '0';
   signal reset : std_logic := '0'; 
   signal upDwn : std_logic := '0';
   signal min : std_logic_vector(7 downto 0) := (others => '0');
   signal max : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal count : std_logic_vector(7 downto 0);
   signal tc : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          sysclk => sysclk,
          cnten => cnten,
          reset => reset,
          upDwn => upDwn,
          min => min,
          max => max,
          count => count,
          tc => tc
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
		min <= x"00"; max <= x"55";						wait for 100 ns;
		cnten <= '0';		updwn <= '1';		reset <= '1'; 	wait for 100 ns;

				
		cnten <= '1';		updwn <= '1';		reset <= '0'; 	wait for 100 ns;
		cnten <= '1';		updwn <= '0';		reset <= '0';	wait for 100 ns;

		min <= x"00"; max <= x"99";						wait for 100 ns; 		
		cnten <= '1';		updwn <= '0';		reset <= '0'; 	wait for 1500 ns;	
		
		min <= x"02"; max <= x"72";						wait for 100 ns;		
		cnten <= '1';		updwn <= '1';		reset <= '0'; 	wait for 1500 ns;		

		min <= x"01"; max <= x"31";						wait for 100 ns;		
		cnten <= '1';		updwn <= '0';		reset <= '0'; 	wait for 1500 ns;	 
 
		wait;
   end process;

END;
