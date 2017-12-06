LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


entity led_driver is
  port (
    RESET_in    : in  std_logic;
    CLK_in      : in  std_logic;
	 InputData   : in std_logic_vector(31 downto 0);
	 LedOut      : out  std_logic 
    );
end led_driver;

architecture Behavioral of led_driver is
TYPE State_type IS (Init,Enable,OnTime,OffTime);  -- Define the states
	SIGNAL State : State_Type;    
							      
	signal      LED_Signal   : std_logic;							
    

begin


  process(CLK_in, RESET_in)

 begin
    if (RESET_in = '1') then
        State <= Init;
		

    elsif( rising_edge(CLK_in) ) then
	 
      CASE State IS
        WHEN Init => 
				State <= Enable; 
			
		  WHEN Enable =>
		       State <= OnTime;
				 
		  WHEN OnTime =>
		      LED_Signal <= not LED_Signal;
		       State <= OffTime;
				 
		  WHEN OffTime =>
		     LED_Signal <= LED_Signal;
			  
		  WHEN others =>
		        State <= Init;
		       
		
		END CASE;
		
	
	 end if;
   end process;

 LedOut <= LED_Signal;


end Behavioral;