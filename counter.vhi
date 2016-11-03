
-- VHDL Instantiation Created from source file counter.vhd -- 12:08:46 11/03/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT counter
	PORT(
		sysclk : IN std_logic;
		cnten : IN std_logic;
		reset : IN std_logic;
		upDwn : IN std_logic;
		min : IN std_logic_vector(7 downto 0);
		max : IN std_logic_vector(7 downto 0);          
		count : OUT std_logic_vector(7 downto 0);
		tc : OUT std_logic
		);
	END COMPONENT;

	Inst_counter: counter PORT MAP(
		sysclk => ,
		cnten => ,
		reset => ,
		upDwn => ,
		min => ,
		max => ,
		count => ,
		tc => 
	);


