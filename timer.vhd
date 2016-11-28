----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:48 10/27/2016 
-- Design Name: 
-- Module Name:    timer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
    Port ( sysclk : in  STD_LOGIC;	 
			  reset : in  STD_LOGIC := '0';
			  pulse_1ms : out  STD_LOGIC;
			  pulse_10ms : out STD_LOGIC;
			  pulse_100ms: out STD_LOGIC;
			  pulse_1s: out STD_LOGIC
			  );
			  
			  
end timer;

architecture Behavioral of timer is
	COMPONENT counter
	Port ( sysclk, cnten, reset, upDwn : in  STD_LOGIC;
			  min,max : in  STD_LOGIC_VECTOR (7 downto 0);
           count : out  STD_LOGIC_VECTOR (7 downto 0);
           tc : out  STD_LOGIC);
	END COMPONENT;
	
	-- declaratie interne verbindingen	
	signal tcT1,tcT2, tcT3, tcT4, tcT5, tcT6 			: std_logic;
	signal cntenT1,cntenT2, cntenT3, cntenT4, cntenT5, cntenT6	: std_logic;
	
	signal upDwn				: std_logic := '1';
	

	--Outputs
	signal pulse_1us: std_logic;
	signal pulse_100us: std_logic;
   --signal pulse_1ms : std_logic;
	--signal pulse_10ms : std_logic;
	--signal pulse_100ms : std_logic;
	--signal pulse_1s : std_logic;
	
	signal cnten_100us, cnten_1ms : std_logic;
	
	signal cnt_us: std_logic_vector (7 downto 0);
	signal cnt_100us: std_logic_vector (7 downto 0);
	signal cnt_ms: std_logic_vector (7 downto 0);
	signal cnt_10ms: std_logic_vector (7 downto 0);
	signal cnt_100ms: std_logic_vector (7 downto 0);
	signal cnt_s : std_logic_vector (7 downto 0);
	
	--signal reset : std_logic := '0';

begin
	CNTEN: process(tcT1,tcT2, tcT3, tcT4, tcT5, tcT6) --pulse_1ms, pulse_10ms, pulse_100ms)
	begin 
	cntenT2 <= tcT1;	cntenT3 <= tcT2; cntenT4 <= tcT3; cntenT5 <= tcT4; cntenT6 <= tcT5;
	pulse_1ms <= tcT3; pulse_10ms <= tcT4; pulse_100ms <= tcT5; pulse_1s <= tcT6;
	--	cnten_100us <= pulse_1us;	
		--cnten_1ms <= pulse_100us;	
		--cnten_10ms <= pulse_1ms;
		--cnten_100ms <= pulse_10ms;
		--cnten_1s <= pulse_100ms;
	end process;
	T1: counter PORT MAP(cnten => '1', 		reset => reset,sysclk => sysclk,min => x"00",max => x"99",count => cnt_us,  	tc => tcT1, upDwn => upDwn );
	T2: counter PORT MAP(cnten => cntenT2, reset => reset,sysclk => sysclk,min => x"00",max => x"99",count => cnt_100us, tc => tcT2, upDwn => upDwn ); --100us
	T3: counter PORT MAP(cnten => cntenT3, reset => reset,sysclk => sysclk,min => x"00",max => x"09",count => cnt_ms, 	tc => tcT3, upDwn => upDwn ); -- 1ms
	T4: counter PORT MAP(cnten => cntenT4, reset => reset,sysclk => sysclk,min => x"00",max => x"09",count => cnt_10ms, 	tc => tcT4, upDwn => upDwn ); -- 10ms
	T5: counter PORT MAP(cnten => cntenT5, reset => reset,sysclk => sysclk,min => x"00",max => x"09",count => cnt_100ms, tc => tcT5, upDwn => upDwn ); -- 100ms
	T6: counter PORT MAP(cnten => cntenT6, reset => reset,sysclk => sysclk,min => x"00",max => x"09",count => cnt_s, 		tc => tcT6, upDwn => upDwn ); -- 1s
	
	
	
  

		  

	
end Behavioral;

