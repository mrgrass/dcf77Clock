module	Module_TempBuffer		(	clk_in,
											sgn_in,

											wb_parallel_out,
											ld1,
											ld2);

input				clk_in;
input				sgn_in;

output [58:0]	wb_parallel_out;
output			ld1;
output			ld2;

reg [15:0]		counter;

wire				GSR;
wire				w_flag_shift;
wire				w_bit;
wire [58:0]		wb_parallel_out;

//provvisori
wire				ld1;
wire				ld2;


and(ld1,1,w_bit);
and(ld2,1,w_flag_shift);

Module_ShiftRegister_59_bit	temp_register		(	.serialInput(w_bit),
																	.flag_in(w_flag_shift),
														
																	.register(wb_parallel_out[58:0]));
														
														

Module_Decoder						decoder				(	.clk_in(clk_in),
																	.sgn_in(sgn_in),
										
																	.bit_out(w_bit),
																	.flag_out(w_flag_shift));
endmodule
