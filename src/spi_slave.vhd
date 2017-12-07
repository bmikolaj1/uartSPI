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
	 DataRxd     : out std_logic_vector(31 downto 0)  
    );
end spi_slave;

architecture Behavioral of spi_slave is

    signal SCLK_latched, SCLK_old : std_logic;
    signal SS_latched, SS_old : std_logic;
    signal MOSI_latched: std_logic;
    signal TxData : std_logic_vector(39 downto 0);
    signal index: natural range 0 to 39;
    signal RxdData : std_logic_vector(31 downto 0);
	 signal Address : std_logic_vector(6 downto 0);
	 signal ReadWriteBit : std_logic; --'1' for write,'0' for read
	 signal ControlReg : std_logic_vector(31 downto 0);

begin


  process(CLK_in, RESET_in)

 begin
    if (RESET_in = '1') then
      RxdData <= (others => '0');
      index <= 39;
      TxData  <= (others => '0');
      SCLK_old <= '0';
      SCLK_latched <= '0';
      SS_old <= '0';
      SS_latched <= '0';
      MOSI_latched <= '0';
		Address <= (others => '0');
	   ReadWriteBit <= '0';
	   ControlReg <= (others => '0');
		

    elsif( rising_edge(CLK_in) ) then

      SCLK_latched <= SPI_CLK;
      SCLK_old <= SCLK_latched;
      SS_latched <= SPI_SS;
      SS_old <= SS_latched;
      MOSI_latched <= SPI_MOSI;

    
      if (SS_old = '1' and SS_latched = '0') then --set index to 39(start of address part) on falling edge of slave select
          index <= 39;
      end if;
		
		
      if( SS_latched = '0' ) then --slave select low
		  if(SCLK_old = '0' and SCLK_latched = '1') then --rising edge of spi clock
		     Address <= Address(5 downto 0) & MOSI_latched; --copy adress from master to adress register
		
		
		
		
           if(index = 32) then 
			     ReadWriteBit <= MOSI_latched; -- copy read or write bit to ReadWriteBit register
				  
			  if(index = 31 and ReadWriteBit = '1') then --if write operation
              RxdData <= RxdData(30 downto 0) & MOSI_latched; -- copy value from master to rxdData
				 
           if(index = 0) then --if end reset index to start
               index <= 39;
           else
               index <= index-1;
           end if;
			    end if;
				  end if;
			  	
         elsif(SCLK_old = '1' and SCLK_latched = '0') then  --faling edge of spic clock
			  if(index = 31) then -- if index past readwrite bit
			    if(ReadWriteBit = '0') then --if read operation
                TxData <= TxData(38 downto 0) & '1'; -- output 1111 1111 to master
				else
				    TxData <= TxData(38 downto 0) & '0'; -- output 0000 0000 to master
               end if;
				end if;
        end if;
      end if;
	  end if;
   end process;

 

   SPI_MISO <= TxData(39);
   DataRxd <= RxdData;

end Behavioral;