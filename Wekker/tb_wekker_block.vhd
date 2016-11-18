--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:51:14 11/18/2016
-- Design Name:   
-- Module Name:   D:/School UAntwerpen/Electronica-1/Labo Digitaal/ISE Projects/Gitmap kopie/vhdl-clock/Wekker/tb_wekker_block.vhd
-- Project Name:  Wekker
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wekker_block
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
 
ENTITY tb_wekker_block IS
END tb_wekker_block;
 
ARCHITECTURE behavior OF tb_wekker_block IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wekker_block
    PORT(
         reset : IN  std_logic;
         btnStop : IN  std_logic;
         mode : IN  std_logic;
         incr : IN  std_logic;
         decr : IN  std_logic;
         counterInput : IN  std_logic_vector(23 downto 0);
         sysclk : IN  std_logic;
         wstate : OUT  std_logic_vector(1 downto 0);
         ledWekSignaal : OUT  std_logic;
         ledOn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal btnStop : std_logic := '0';
   signal mode : std_logic := '0';
   signal incr : std_logic := '0';
   signal decr : std_logic := '0';
   signal counterInput : std_logic_vector(23 downto 0) := (others => '0');
   signal sysclk : std_logic := '0';

 	--Outputs
   signal wstate : std_logic_vector(1 downto 0);
   signal ledWekSignaal : std_logic;
   signal ledOn : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wekker_block PORT MAP (
          reset => reset,
          btnStop => btnStop,
          mode => mode,
          incr => incr,
          decr => decr,
          counterInput => counterInput,
          sysclk => sysclk,
          wstate => wstate,
          ledWekSignaal => ledWekSignaal,
          ledOn => ledOn
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

      wait for sysclk_period*10;

      -- insert stimulus here 
		
		
		mode <='1';	wait for sysclk_period; 
		mode <='0';	wait for 100 ns;
      mode <='1';	wait for sysclk_period; 
		mode <='0';	wait for 100 ns;
		incr <='1';	wait for sysclk_period; 
		incr <='0';	wait for 100 ns;
		
		mode <='1';	wait for sysclk_period; 
		mode <='0';	wait for 100 ns;
		mode <='1';	wait for sysclk_period; 
		mode <='0';	wait for 100 ns;
		
		
		counterInput <= "000000000000000001011000"; wait for sysclk_period;
		counterInput <= "000000000000000001011001"; wait for sysclk_period;
		counterInput <= "000000000000000100000000"; wait for sysclk_period;
		counterInput <= "000000000000000100000001"; wait for sysclk_period;
		
		btnStop <= '1'; wait for sysclk_period;
		btnStop <= '0'; wait for sysclk_period;
		btnStop <= '1'; wait for sysclk_period;
		btnStop <= '0'; wait for sysclk_period;
		
		counterInput <= "000000000000000001011000"; wait for sysclk_period;
		counterInput <= "000000000000000001011001"; wait for sysclk_period;
		counterInput <= "000000000000000100000000"; wait for sysclk_period;
		counterInput <= "000000000000000100000001"; wait for sysclk_period;
		
		btnStop <= '1'; wait for sysclk_period;
		btnStop <= '0'; wait for sysclk_period;
		
		counterInput <= "000000000000000001011000"; wait for sysclk_period;
		counterInput <= "000000000000000001011001"; wait for sysclk_period;
		counterInput <= "000000000000000100000000"; wait for sysclk_period;
		counterInput <= "000000000000000100000001"; wait for sysclk_period;
		
		btnStop <= '1'; wait for sysclk_period;
		btnStop <= '0'; wait for sysclk_period;
		
		counterInput <= "000000000000000001011000"; wait for sysclk_period;
		counterInput <= "000000000000000001011001"; wait for sysclk_period;
		counterInput <= "000000000000000100000000"; wait for sysclk_period;
		counterInput <= "000000000000000100000001"; wait for sysclk_period;

      wait;
   end process;

END;
