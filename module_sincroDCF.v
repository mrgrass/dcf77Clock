module	Module_SincroDCF	(	clk_in,
										sgn_in,
										onoff_sincro,

										flag_out);

input			clk_in;
input			sgn_in;
input			onoff_sincro;

output		flag_out;

reg			flag_out;
reg [16:0]	counter;

wire			GSR;

always @(posedge clk_in) begin

	if (GSR) begin //per 20millisec resetta

		counter = 0;
		flag_out = 0;

	end else begin
	
		if (onoff_sincro) begin
		
				if (sgn_in==1) counter=counter+1;
				else begin 		
						counter=0;
						flag_out=0;		
				end
		
				if (counter >= 1000) flag_out=1;
				
		end else begin
			
			flag_out=0;
			counter = 0;
			
		end
		
	end

end

endmodule
