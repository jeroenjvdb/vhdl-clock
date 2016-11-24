----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:40 11/17/2016 
-- Design Name: 
-- Module Name:    wekker_block - Behavioral 
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

entity wekker_block is
    Port ( reset	: in STD_LOGIC;
			  btnStop : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           decr : in  STD_LOGIC;
           counterInput : in  STD_LOGIC_VECTOR (23 downto 0);
           sysclk : in  STD_LOGIC;
			  wstate : out STD_LOGIC_VECTOR (3 downto 0);
           ledWekSignaal : out  STD_LOGIC;
			  ledOn : out STD_LOGIC);
end wekker_block;

architecture Behavioral of wekker_block is

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
	

-- declaratie interne verbindingen	
	signal tcT1,tcT2 			: std_logic;
	signal cntenT1,cntenT2	: std_logic;
	signal cntenT3 			: std_logic;
	signal countcheck			: std_logic_vector (23 downto 0);
	signal onOff				: std_logic := '0';
	signal upDwn				: std_logic := '1';
	signal btn					: std_logic := '0';
	signal ledOut				: std_logic := '0';
	
-- TOESTANDSMACHINE VOOR DE BEDIENING
-- declaratie toestanden
	type state is (static,setT1,setT2,setT3);
	signal present_state, next_state : state;
	
begin
	
	STATE_REG: process (sysclk)
	begin
		if rising_edge(sysclk) then 								
			if reset = '1' then present_state <= static; else present_state <= next_state; end if;
			ledWekSignaal <= ledOut;
			ledOn <= onOff;
		end if;
	end process;
	
	NXT_STATE: process (present_state, mode)		
	begin
		case present_state is
			when static   =>	if mode = '1' then 	next_state <= setT3;	else next_state <= static;		end if;
			when setT3 =>	if mode = '1' then 	next_state <= setT2;	else next_state <= setT3;	end if;
			when setT2 =>	if mode = '1' then 	next_state <= setT1;	else next_state <= setT2;	end if;	
			when setT1 =>	if mode = '1' then 	next_state <= static;	else next_state <= setT1;	end if;			
		end case;
	end process;
	
	-- het OUTPUTS process zal, afhankelijk van de "present-state", de verbindingen met de correcte (teller)poorten leggen
	
	BTNCHANGER : process (incr,decr) 		
	begin	
   if incr = '1' 
		then upDwn <= '1'; btn <= '1'; 
	elsif decr = '1' 
		then upDwn <= '0'; btn <= '1';
	else 
		upDwn <= '1'; btn <= '0'; 
	end if;	--else if decr = '1' then upDwn <= '0'; btn <= '1'; else btn <= '0';	
	end process;
	
	OUTPUTS : process (present_state, btn) 		
	begin	
	case present_state is
			when static  	=> cntenT1 <= '0';	cntenT2 <= '0';	cntenT3 <= '0'; wstate <= "1000"; 
			when setT3  =>	cntenT1 <= '0';	cntenT2 <= '0'; 	cntenT3 <= btn; wstate <= "0100"; 
			when setT2  =>	cntenT1 <= '0';	cntenT2 <= btn;	cntenT3 <= '0'; wstate <= "0010";
			when setT1  =>	cntenT1 <= btn;	cntenT2 <= '0'; 	cntenT3 <= '0'; wstate <= "0001";
		end case;
	end process;

   WEKKER_FUNCTIONALITEIT	: process (counterInput, btnStop)
	begin
	if present_state = static then
		if counterInput = countcheck and onOff = '1' then ledOut <= '1'; end if;
	end if;
	if btnStop = '1' then
		if ledOut = '0' then onOff <= not onOff; else ledOut <= '0'; end if;
	end if;
	end process;
	
	WEKKER_FUNCTIONALITEIT2	: process (btnStop)
	begin
	--if btnStop = '1' then
		--if ledOut = '1' then ledOut <= '0'; else onOff <= not onOff; end if;
	--end if;
	end process;
	
	T1: counter PORT MAP(cnten => cntenT1, reset => reset,sysclk => sysclk,min => x"00",max => x"59",count => countcheck(7 downto 0), tc => tcT1, upDwn => upDwn );
	T2: counter PORT MAP(cnten => cntenT2, reset => reset,sysclk => sysclk,min => x"00",max => x"59",count => countcheck(15 downto 8), tc => tcT2, upDwn => upDwn );
	T3: counter PORT MAP(cnten => cntenT3, reset => reset,sysclk => sysclk,min => x"00",max => x"23",count => countcheck(23 downto 16), upDwn => upDwn );


end Behavioral;

