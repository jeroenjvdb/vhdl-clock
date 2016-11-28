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
	 --generic (div : integer := 2000000);
    PORT(
			sysclk, reset : IN  std_logic;
         pulse_1ms : OUT  std_logic;
			pulse_10ms : OUT std_logic;
			pulse_100ms : out std_logic;
			pulse_1s : out std_logic
        );
    END COMPONENT;
	 
	 --COMPONENT counter
	 --Port ( sysclk, cnten, reset, upDwn : in  STD_LOGIC;
	--		  min,max : in  STD_LOGIC_VECTOR (7 downto 0);
   --        count : out  STD_LOGIC_VECTOR (7 downto 0);
   --        tc : out  STD_LOGIC);
	--  END COMPONENT;
	 
    

   --Inputs
   signal sysclk : std_logic := '0';

 	--Outputs
	--signal pulse_1us: std_logic;
	--signal pulse_100us: std_logic;
   signal pulse_1ms : std_logic;
	signal pulse_10ms : std_logic;
	signal pulse_100ms : std_logic;
	signal pulse_1s : std_logic;
	
	--signal count_us: std_logic_vector (7 downto 0);
	--signal count_100us: std_logic_vector (7 downto 0);
	--signal count_ms: std_logic_vector (7 downto 0);
	--signal count_10ms: std_logic_vector (7 downto 0);
	--signal count_100ms: std_logic_vector (7 downto 0);
	--signal count_s : std_logic_vector (7 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
	signal reset : std_logic := '0';
 
BEGIN
	-- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
 
	-- Instantiate the Unit Under Test (UUT)
	uut: timer PORT MAP(
		sysclk => sysclk,
		reset => reset,
		pulse_1ms => pulse_1ms,
		pulse_10ms => pulse_10ms,
		pulse_100ms => pulse_100ms,
		pulse_1s => pulse_1s
	);
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';

      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
