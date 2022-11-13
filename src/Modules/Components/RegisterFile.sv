// Register File
// Integer register file, can be configured for all RISC-V base ISAs, default is for RV32I

module RegisterFile #(
		parameter REG_WIDTH  = 32,   // Width of the internal registers (32 for RV32I, 64 for RV64I, etc.)
		parameter NUM_REGS   = 32,   // Number of registers in the file (16 for RV32E, 32 for all other current ISAs)
	) (
		input clk,
		input [$clog2(NUM_REGS) - 1:0] rs1Addr, // Read address for register 1
		input [$clog2(NUM_REGS) - 1:0] rs2Addr, // Read address for register 2
		input [$clog2(NUM_REGS) - 1:0] wrAddr,  // Write address for register
		input wrEn,                             // Write enable
		input [REG_WIDTH - 1:0] wrData,         // Write data

		output reg [REG_WIDTH - 1:0] rs1Data,       // Read data for register 1
		output reg [REG_WIDTH - 1:0] rs2Data        // Read data for register 2
	);

	reg [REG_WIDTH - 1:0] regFile [NUM_REGS - 1:0];

	initial
	begin
		for (int i = 0; i < NUM_REGS; i = i + 1)
		begin
			regFile[i] = 0;
		end
	end

	always @(posedge clk)
	begin
		if (wrEn && wrAddr != 0)
		begin
			regFile[wrAddr] <= wrData;
		end
		rs1Data <= regFile[rs1Addr];
		rs2Data <= regFile[rs2Addr];
	end

endmodule
