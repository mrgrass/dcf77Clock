module	Module_Decoder		(	clk_in,
										sgn_in,
										
										bit_out,
										flag_out);

input			clk_in;
input			sgn_in;


output		bit_out;
output		flag_out;

reg			bit_out;
reg			flag_out;

reg [15:0]		counter;

wire			GSR;

always @(posedge clk_in) begin

	if (GSR) begin //per 20millisec resetta

		counter = 0;
		bit_out=0;
		flag_out=0;

	end else begin
		
		if (sgn_in==1) counter=counter+1; //l'ultimo bit sará sempre zero perché conta tanto
		else begin 	
			
			if (counter) begin
				flag_out=1;
				if (counter>850) bit_out=0;
				else bit_out=1;
				counter=0;
			end else flag_out=0;
			
		end
		
	end

end

endmodule
