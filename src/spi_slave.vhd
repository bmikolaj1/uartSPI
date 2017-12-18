LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


entity spi_slave is
  port (
    RESET_in    : in  std_logic;
    CLK_in      : in  std_logic;
    SPI_CLK     : in std_logic;
    SPI_SS      : in std_logic;
    SPI_MOSI    : in  std_logic;
    SPI_MISO    : out std_logic;
	 DataTxd     : in std_logic_vector(23 downto 0);
	 DataRxd     : out std_logic_vector(23 downto 0)  
    );
end spi_slave;

architecture Behavioral of spi_slave is


    type state_type is (init,txBit);
    signal state : state_type;
	 
    signal SCLK_latched, SCLK_old : std_logic;
    signal SS_latched, SS_old : std_logic;
    signal MOSI_latched: std_logic;
    signal TxData : std_logic_vector(23 downto 0);
    signal index: natural range 0 to 23;
    signal RxdData : std_logic_vector(23 downto 0);
	 
	 signal Address : std_logic_vector(6 downto 0);
	 signal ReadWriteBit : std_logic; --'1' for write,'0' for read
	 
	 constant controlAddr :std_logic_vector(6 downto 0):= "0000000";  --adress values for registers
	 constant statusAddr :std_logic_vector(6 downto 0):= "0000001";
	 constant onTimeAddr :std_logic_vector(6 downto 0):= "0000010";
	 constant ofTimeAddr :std_logic_vector(6 downto 0):= "0000011";
	 
	 signal ControlReg : std_logic_vector(15 downto 0);
	 signal StatusReg : std_logic_vector(15 downto 0);
	 signal OnTimeReg : std_logic_vector(15 downto 0);
	 signal OffTimeReg : std_logic_vector(15 downto 0);

begin


  process(CLK_in, RESET_in)

 begin
    if (RESET_in = '1') then
      RxdData <= (others => '0');
      index <= 23;
      TxData  <= (others => '0');
      SCLK_old <= '0';
      SCLK_latched <= '0';
      SS_old <= '0';
      SS_latched <= '0';
      MOSI_latched <= '0';
		Address <= (others => '0');
	   ReadWriteBit <= '0';
	   ControlReg <= (others => '0');
		StatusReg <= (others => '0');
		OnTimeReg <= (others => '0');
		OffTimeReg <= (others => '0');
		

    elsif( rising_edge(CLK_in) ) then
	  case state IS 
	    
		 when init =>

      SCLK_latched <= SPI_CLK;
      SCLK_old <= SCLK_latched;
      SS_latched <= SPI_SS;
      SS_old <= SS_latched;
      MOSI_latched <= SPI_MOSI;
		TxData <= DataTxd;
		
		  state <= txBit;
		  
		  when txBit =>
		  	
		
      if( SS_latched = '0' ) then --slave select low
		  if(SCLK_old = '0' and SCLK_latched = '1') then --rising edge of spi clock
		     Address <= Address(5 downto 0) & MOSI_latched; --copy adress from master to adress register
			  
	
		
           if(index = 16) then 
			     
			     ReadWriteBit <= MOSI_latched; -- copy read or write bit to ReadWriteBit register
				  
			  if(index = 15 and ReadWriteBit = '1') then --if write operation
			     case Address is
				   when controlAddr => 
                 ControlReg <= ControlReg(14 downto 0) & MOSI_latched; -- copy value from master to rxdData
					  
					 when statusAddr => 
                 StatusReg <= StatusReg(14 downto 0) & MOSI_latched; -- copy value from master to rxdData
					  
					 when onTimeAddr => 
                 OnTimeReg <= OnTimeReg(14 downto 0) & MOSI_latched; -- copy value from master to rxdData
					  
					 when ofTimeAddr => 
                 OffTimeReg <= OffTimeReg(14 downto 0) & MOSI_latched; -- copy value from master to rxdData
					  
					 when others =>
					   ControlReg <= (others => '0');
						StatusReg <= (others => '0');
						OnTimeReg <= (others => '0');
						OffTimeReg <= (others => '0');
				  end case;
           
			    end if;
				  end if;
			  	
         elsif(SCLK_old = '1' and SCLK_latched = '0') then  --faling edge of spic clock
			  
              TxData <= TxData(22 downto 0) & TxData(23); -- output data from led to master
				
        end if;
		     
			  if(index = 0) then
			     index <= 23;
			     state <= init;
				else
				index <= index-1;
			   state <= txBit;
				end if;
				
		  
		 
		  
		   end if;
		  end case;
      end if;
   end process;

 

   SPI_MISO <= TxData(23);
   DataRxd <= RxdData;

end Behavioral;