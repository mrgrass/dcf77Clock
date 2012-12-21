// `define		N_max	28'b0010111110101111000010000000	//	5 10^7
`define		N_max 	28'b0000100110001001011010000000	//	5 10^6

module Module_Monostable	(	clk_in,
						monostable_input,

						monostable_output);

input			clk_in;
input			monostable_input;

output		monostable_output;

reg			monostable_output;

reg  [27:0]		counter;

wire 			GSR;

always @(posedge clk_in) begin

	if (GSR) begin

		monostable_output = 0;
		counter = 0;

	end else begin

		if (counter == 0) begin

			if (monostable_input == 1) begin

				counter = 1;
				monostable_output = 1;

			end

		end else if (counter == (`N_max - 1)) begin

			counter = 0;
			monostable_output = monostable_input;

		end else

		counter = counter + 1;

	end
end	

endmodule
