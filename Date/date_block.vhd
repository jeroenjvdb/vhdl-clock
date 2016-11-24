----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:58 11/03/2016 
-- Design Name: 
-- Module Name:    time - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity date_block is
    Port ( 	sysclk,reset 	: in  STD_LOGIC;
				cnten	 			: in  STD_LOGIC;
				mode		: in  STD_LOGIC;									-- OPGELET : voor deze ingangen mag de ingang slechts gedurende 1 klokperiode 1 zijn.
				incr, decr	: in  STD_LOGIC;
				ostate			: out  STD_LOGIC_VECTOR (3 downto 0);
				date_cnt 		: out  STD_LOGIC_VECTOR (23 downto 0));
end date_block;

architecture Behavioral of date_block is

COMPONENT counter
	PORT(
		cnten,reset 			: IN std_logic;
		sysclk 					: IN std_logic;
		min 						: IN std_logic_vector(7 downto 0);
		max 						: IN std_logic_vector(7 downto 0); 
		upDwn						: IN std_logic;
		count 					: OUT std_logic_vector(7 downto 0);
		tc 						: OUT std_logic);
	END COMPONENT;
	
COMPONENT max_day_setter
	PORT(
		MYinput : in  STD_LOGIC_VECTOR (15 downto 0);
      maxDay : out  STD_LOGIC_VECTOR (7 downto 0));
	END COMPONENT;
	
-- declaratie interne verbindingen	
	signal tcT1,tcT2 			: std_logic;
	signal cntenT1,cntenT2	: std_logic;
	signal cntenT3 			: std_logic;
	signal setMaxDay			: STD_LOGIC_VECTOR (7 downto 0);
	signal countT2T1			: STD_LOGIC_VECTOR (15 downto 0);
	signal countT1				: STD_LOGIC_VECTOR (7 downto 0);
	signal countT2 			: STD_LOGIC_VECTOR (7 downto 0);
	signal upDwn				: std_logic := '1';
	signal btn					: std_logic := '0';
----------------------------------------------------------------
-- TOESTANDSMACHINE VOOR DE BEDIENING
-- declaratie toestanden
	type state is (cnt,setT1,setT2,setT3);
	signal present_state, next_state : state;

begin
	
	STATE_REG: process (sysclk)
	begin
		if rising_edge(sysclk) then 								
			if reset = '1' then present_state <= cnt; else present_state <= next_state; end if;
		end if;
		countT2T1 (7 downto 0) <= countT1;
		countT2T1 (15 downto 8) <= countT2;
		date_cnt (15 downto 0) <= countT2T1;
	end process;

	NXT_STATE: process (present_state, mode)		
	begin
		case present_state is
			when cnt   =>	if mode = '1' then 	next_state <= setT1;	else next_state <= cnt;		end if;
			when setT3 =>	if mode = '1' then 	next_state <= cnt;	else next_state <= setT3;	end if;
			when setT2 =>	if mode = '1' then 	next_state <= setT3;	else next_state <= setT2;	end if;	
			when setT1 =>	if mode = '1' then 	next_state <= setT2;	else next_state <= setT1;	end if;			
		end case;
	end process;
	-- het OUTPUTS process zal, afhankelijk van de "present-state", de verbindingen met de correcte (teller)poorten leggen
	OUTPUTS : process (present_state,cnten,tcT1,tcT2,btn) 		
	begin
	if incr = '1' 
		then upDwn <= '1'; btn <= '1'; 
	elsif decr = '1' 
		then upDwn <= '0'; btn <= '1'; 
	else 
		upDwn <= '1'; btn <= '0'; 
	end if;
	case present_state is
			when cnt  	=> cntenT1 <= tcT2;	cntenT2 <= tcT1;	cntenT3 <= cnten; ostate <= "1000";
			when setT3  =>	cntenT1 <= '0';	cntenT2 <= '0'; 	cntenT3 <= btn; ostate <= "0100";
			when setT2  =>	cntenT1 <= '0';	cntenT2 <= btn;	cntenT3 <= '0'; ostate <= "0010";
			when setT1  =>	cntenT1 <= btn;	cntenT2 <= '0'; 	cntenT3 <= '0'; ostate <= "0001";
		end case;
	end process;	
	
	T1: counter PORT MAP(cnten => cntenT1, reset => reset,sysclk => sysclk,min => x"16",max => x"99",count => countT1, upDwn => upDwn );
	T2: counter PORT MAP(cnten => cntenT2, reset => reset,sysclk => sysclk,min => x"01",max => x"12",count => countT2, tc => tcT2, upDwn => upDwn );
	T3: counter PORT MAP(cnten => cntenT3, reset => reset,sysclk => sysclk,min => x"01",max => setMaxDay,count => date_cnt(23 downto 16),tc => tcT1 , upDwn => upDwn );
	SD: max_day_setter PORT MAP (MYinput => countT2T1, maxDay => setMaxDay);
	

end Behavioral;

