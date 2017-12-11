	component nis_cpu_uart is
		port (
			clk_clk       : in  std_logic := 'X'; -- clk
			reset_reset_n : in  std_logic := 'X'; -- reset_n
			spi_out_MISO  : in  std_logic := 'X'; -- MISO
			spi_out_MOSI  : out std_logic;        -- MOSI
			spi_out_SCLK  : out std_logic;        -- SCLK
			spi_out_SS_n  : out std_logic         -- SS_n
		);
	end component nis_cpu_uart;

	u0 : component nis_cpu_uart
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --     clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, --   reset.reset_n
			spi_out_MISO  => CONNECTED_TO_spi_out_MISO,  -- spi_out.MISO
			spi_out_MOSI  => CONNECTED_TO_spi_out_MOSI,  --        .MOSI
			spi_out_SCLK  => CONNECTED_TO_spi_out_SCLK,  --        .SCLK
			spi_out_SS_n  => CONNECTED_TO_spi_out_SS_n   --        .SS_n
		);

