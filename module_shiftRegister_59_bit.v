module	Module_ShiftRegister_59_bit	(	serialInput,
														flag_in,

														register);


input				serialInput;
input				flag_in;

output [58:0]	register;

reg [58:0]		register;

always @(posedge flag_in) begin

		register={serialInput,register[58:1]};
		
end

endmodule
