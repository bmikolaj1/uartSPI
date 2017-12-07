

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity spi_master is
  port (
    reset    : in  std_logic;
    clk      : in  std_logic;
    SCLK     : out std_logic;
    SS       : out std_logic;
    MOSI     : out  std_logic;
    MISO     : in std_logic;
    DataToTx : in std_logic_vector(39 downto 0);
    DataRxd  : out std_logic_vector(39 downto 0)
	 );
end spi_master;

architecture Behavioral of spi_master is
    type state_type is (idle, txBit, CheckFinished);
    signal state : state_type;

begin
  process(clk, reset)
    --type state_type is (idle, txBit, CheckFinished);
    --variable state : state_type;

    variable index : integer := 0;
    variable dataLen : integer := 39;   --length of the data word to be txd
  begin
    if reset = '1' then
      DataRxd <= (others => '0');  
      SCLK <= '1';
      SS <= '1';
      MOSI <= 'Z';
      dataLen := 39;
      index := 0;
    else
      if(clk'event and clk = '1') then
        case state is
          when idle =>
            SCLK <= '0';
              state <= txBit;
              SS <= '0';
            

          when txBit =>
            MOSI <= DataToTx(index);
            SCLK <= '0';
            state <= checkFinished;
            
          when checkFinished =>
            DataRxd(index) <= MISO;
            if(index = dataLen) then
              state <= idle;
              SCLK <= '1';
            else
              state <= txBit;
              index := index + 1;
              SCLK <= '1';
            end if;
        
          when others => null;
        end case;
      end if;
    end if;     

  end process;
end Behavioral;

