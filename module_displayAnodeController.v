module	Module_DisplayAnodeController	(	clk_in,

								anodeRegister,
								anodeNumber);

input			clk_in;

output [3:0]	anodeRegister;
output [1:0]	anodeNumber;

reg [3:0]		anodeRegister;
reg [1:0]		anodeNumber;

wire			GSR;

always @(posedge clk_in) begin

	if (GSR) begin

		anodeNumber = 0;
		anodeRegister = 4'b1110;

	end else begin

		if (anodeNumber == 3) anodeRegister = 4'b1110;		//maschera del display a 4 digits
		else anodeRegister = ~((~anodeRegister)<<1);
		anodeNumber = anodeNumber+1;

	end
end

endmodule