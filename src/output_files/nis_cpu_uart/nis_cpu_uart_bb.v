
module nis_cpu_uart (
	clk_clk,
	reset_reset_n,
	spi_out_MISO,
	spi_out_MOSI,
	spi_out_SCLK,
	spi_out_SS_n);	

	input		clk_clk;
	input		reset_reset_n;
	input		spi_out_MISO;
	output		spi_out_MOSI;
	output		spi_out_SCLK;
	output		spi_out_SS_n;
endmodule
