module Module_SelectDispType				(	qzt_clk,
														enable_loop,
																		
														Dtype);

input				qzt_clk;
input				enable_loop;

output [1:0]	Dtype;

reg [1:0]		Dtype;


always @(posedge qzt_clk) begin

		if (enable_loop) Dtype=2'b10;
		if (!enable_loop) Dtype=2'b01;
		
end


endmodule
