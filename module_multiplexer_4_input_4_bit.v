module	Module_Multiplexer_4_input_4_bit	(	clk_in,
							address,
							input_0,
							input_1,
							input_2,
							input_3,

							mux_output);

input		clk_in;
input	[1:0]	address;
input	[3:0]	input_0;
input	[3:0]	input_1;
input	[3:0]	input_2;
input	[3:0]	input_3;

output	[3:0]	mux_output;

reg	[3:0]	mux_output;

wire		GSR;

always @(posedge clk_in) begin
	if (GSR) begin
		mux_output = 4'b0000;
	end else begin
		case (address)
			2'b00  : begin
				mux_output = input_0;
			end
			2'b01  : begin
				mux_output = input_1;
			end
			2'b10  : begin
				mux_output = input_2;
			end
			2'b11  : begin
				mux_output = input_3;
			end
		endcase
	end
end

endmodule
