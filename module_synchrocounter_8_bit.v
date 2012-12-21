module	Module_SynchroCounter_8_bit	(	qzt_clk,
								clk_in,
								reset,
								limit,

								out,
								carry);

input			qzt_clk;
input			clk_in;
input			reset;
input	[7:0]		limit;

output [7:0]	out;
output		carry;

reg [7:0]		out;
reg			carry;
reg			old_clk_in;

wire			GSR;

always @(posedge qzt_clk) begin

	if (GSR | reset) begin

		out = 0;
		carry = 0;
		old_clk_in = 0;

	end else begin

		if (!old_clk_in & clk_in)  begin

			if (out == (limit - 8'b00000001)) begin

				out = 0;
				carry = 1;

			end else if (out == 0) begin

				out = 1;
				carry = 0;

			end else

			out = out + 1;

		end

		old_clk_in = clk_in;

	end
end

endmodule
