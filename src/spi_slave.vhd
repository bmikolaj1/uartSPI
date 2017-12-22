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

    signal spi_clk_reg        : std_logic;
    signal spi_clk_redge_en   : std_logic;
    signal spi_clk_fedge_en   : std_logic;
	  
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

  spi_clk_reg_p : process (CLK_in)
    begin
        if (rising_edge(CLK_in)) then
            if (RESET_in = '1') then
                spi_clk_reg <= '0';
            else
                spi_clk_reg <= SPI_CLK;
            end if;
        end if;
    end process;


    -- Falling edge is detect when SCLK=0 and spi_clk_reg=1.
    spi_clk_fedge_en <= not SPI_CLK and spi_clk_reg;
    -- Rising edge is detect when SCLK=1 and spi_clk_reg=0.
    spi_clk_redge_en <= SPI_CLK and not spi_clk_reg;
	 
	 
  spi_transfer : process(CLK_in,RESET_in)

 begin
 
 TxData <= DataTxd;  
 
    if (RESET_in = '1') then
      RxdData <= (others => '0');
      index <= 23;
      TxData  <= (others => '0');
		Address <= (others => '0');
	   ReadWriteBit <= '0';
	   ControlReg <= (others => '0');
		StatusReg <= (others => '0');
		OnTimeReg <= (others => '0');
		OffTimeReg <= (others => '0');
	    
		

    elsif( rising_edge(CLK_in) ) then
	     
      
		
	
      if( SPI_SS = '0' ) then --slave select low
		  if(spi_clk_redge_en = '1') then --rising edge of spi clock
		     Address <= Address(5 downto 0) & SPI_MOSI; --copy adress from master to adress register
			  
	
		
           if(index = 16) then 
			     
			     ReadWriteBit <= SPI_MOSI; -- copy read or write bit to ReadWriteBit register
				  
			  if(index = 15 and ReadWriteBit = '1') then --if write operation
			     case Address is
				   when controlAddr => 
                 ControlReg <= ControlReg(14 downto 0) & SPI_MOSI; -- copy value from master to rxdData
					  
					 when statusAddr => 
                 StatusReg <= StatusReg(14 downto 0) & SPI_MOSI; -- copy value from master to rxdData
					  
					 when onTimeAddr => 
                 OnTimeReg <= OnTimeReg(14 downto 0) & SPI_MOSI; -- copy value from master to rxdData
					  
					 when ofTimeAddr => 
                 OffTimeReg <= OffTimeReg(14 downto 0) & SPI_MOSI; -- copy value from master to rxdData
					  
					 when others =>
					   ControlReg <= (others => '0');
						StatusReg <= (others => '0');
						OnTimeReg <= (others => '0');
						OffTimeReg <= (others => '0');
				  end case;
           
			    end if;
				  end if;
				  
				if(index = 0) then
			     index <= 23;
			    
				else
				index <= index-1;
			   end if;
			  	
         elsif(spi_clk_fedge_en = '1') then  --faling edge of spi clock
			  
              TxData <= TxData(22 downto 0) & TxData(23); -- output data from led to master
		
        end if;
		     
			  
				
		  
		 
		  
		   
		 end if; 
      end if;
   end process;

 

   SPI_MISO <= TxData(23);
   DataRxd <= RxdData;

end Behavioral;