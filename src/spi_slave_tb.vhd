library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity spi_slave_tb is
end spi_slave_tb;

architecture SIM of spi_slave_tb is

	 constant CLK_PERIOD  : time := 20 ns;

    signal CLK        : std_logic := '0';
    signal RST        : std_logic := '1';

    signal spi_clk        : std_logic;
	 signal spi_ss         : std_logic;
	 signal spi_mosi       : std_logic;
    signal spi_miso       : std_logic;
    
	 
	 signal data_txd      : std_logic_vector(23 downto 0);
    signal data_rxd      : std_logic_vector(23 downto 0);
   
	 

begin

 spi_slave : entity work.spi_slave
    port map (
        CLK_in       => CLK,
        RESET_in     => RST,       
        SPI_CLK      => spi_clk,
        SPI_SS       => spi_ss,
        SPI_MOSI     => spi_mosi,
        SPI_MISO     => spi_miso,
        DataTxd      => data_txd,
        DataRxd  		=> data_rxd	  
    );
	 
	
		

    
    clk_process : process
    begin
        CLK <= '1';
        wait for CLK_PERIOD/2;
        CLK <= '0';
        wait for CLK_PERIOD/2;
    end process;
	 
	 
	 slave_test_process : process
	 
    begin
	 
		  spi_clk <= '0';       
	     spi_ss <= '1';         
		  spi_mosi <= '0';     
		   
	     RST <= '1';
        data_txd <= (others => '0');
		  
		  wait for 20 ns;
		  
		  wait until rising_edge(CLK);
		  RST <= '0';
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0';      
		  data_txd <= "000000000000000000000001";
		  
		  wait until falling_edge(CLK); 
        spi_clk <= '1';       
	             
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';               
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '1'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '1'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '1'; 

        wait until falling_edge(CLK); 
        spi_clk <= '1';       
	     spi_ss <= '0';         
		  spi_mosi <= '1'; 
		  
		  wait until rising_edge(CLK);
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
        wait until falling_edge(CLK); 
        spi_clk <= '0';       
	     spi_ss <= '0';         
		  spi_mosi <= '0'; 
		  
		  
		  wait for 20 ns;
		  
		 
         
        

    end process;
	 
	 



end SIM;