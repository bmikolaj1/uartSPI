	component unsaved is
		port (
			clk_clk       : in  std_logic := 'X'; -- clk
			reset_reset_n : in  std_logic := 'X'; -- reset_n
			output_readra : out std_logic         -- readra
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --    clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, --  reset.reset_n
			output_readra => CONNECTED_TO_output_readra  -- output.readra
		);

