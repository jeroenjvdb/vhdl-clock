--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:22:39 11/10/2016
-- Design Name:   
-- Module Name:   D:/School UAntwerpen/Electronica-1/Labo Digitaal/ISE Projects/Gitmap kopie/vhdl-clock/Date/tb_date_block.vhd
-- Project Name:  Date
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: date_block
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
 
ENTITY tb_date_block IS
END tb_date_block;
 
ARCHITECTURE behavior OF tb_date_block IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT date_block
    PORT(
         sysclk : IN  std_logic;
         reset : IN  std_logic;
         cnten : IN  std_logic;
         mode : IN  std_logic;
         btn : IN  std_logic;
         date_cnt : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal reset : std_logic := '0';
   signal cnten : std_logic := '0';
   signal mode : std_logic := '0';
   signal btn : std_logic := '0';

 	--Outputs
   signal date_cnt : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: date_block PORT MAP (
          sysclk => sysclk,
          reset => reset,
          cnten => cnten,
          mode => mode,
          btn => btn,
          date_cnt => date_cnt
        );

   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
	
	cnten_process :process
   begin
		cnten <= '0';	wait for sysclk_period*9;
		cnten <= '1';	wait for sysclk_period;
   end process;	


   -- Stimulus process
   stim_proc: process
   begin		
    reset <='1';wait for 100 ns;	
		reset <='0';wait for sysclk_period*8650;
		
		wait for 100 ns;
		mode <='0';	wait for 20 ns;
		
		-- stel instel mode in op setT3
		mode <='1';	wait for sysclk_period;
		mode <='0';	wait for 100 ns;	
			-- stel T3 in
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for sysclk_period;
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for sysclk_period;
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for 100 ns;	
		-- stel instel mode in op setT2	
		mode <='1';	wait for sysclk_period; 
		mode <='0';	wait for 100 ns;	
			-- stel T2 in	
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for sysclk_period;
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for sysclk_period;
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for 100 ns;		
		
		-- stel instel mode in op setT1
		mode <='1';	wait for sysclk_period;
		mode <='0';	wait for 100 ns;	
			-- stel T1 in	
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for sysclk_period;
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for sysclk_period;
		btn <='1';	wait for sysclk_period;
		btn <='0';	wait for 100 ns;	
		
		-- stel  mode in op tellen	
		mode <='1';	wait for sysclk_period;
		mode <='0';	wait for 100 ns;
      wait;
   end process;

END;
