// General Purpose Multiplexer
// Default Params instantiate a 4:1 multiplexer with data width of 8 bits

module GPMux #(
		parameter DATA_WIDTH  = 8,
		parameter SELECTOR_BITS_COUNT = 2
	) (
		input [SELECTOR_BITS_COUNT-1:0] selector,
		input [DATA_WIDTH-1:0] data_in [2**SELECTOR_BITS_COUNT-1:0],

		output [DATA_WIDTH-1:0] data_out
	);

	assign data_out = data_in[selector];

endmodule
