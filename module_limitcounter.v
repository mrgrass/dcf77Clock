module	Module_Limitcounter	(	clk_control,
											clk_in,
											period,
											reset,
											cifra,

											clk_out,
											counter);

input	clk_control;
input	clk_in;
input	[3:0]	period;
input	reset;
input	[3:0]	cifra;

output	clk_out;
output	[3:0]	counter;

reg 	flag_1;  //serve per simulare il posedge del secondo clock
reg	clk_out;
reg	[3:0]	counter;

wire	GSR;


always @(posedge clk_control) begin

		if (GSR) begin
			
			counter[3:0] = 4'b0000;
			clk_out = 0;
			flag_1=1;
			
		end else begin
		
			if (reset) begin
				
				counter[3:0] = cifra[3:0] - 4'b0001;
				clk_out = 1;
				flag_1 = 1;
				
			end else begin
			
				if (clk_in && flag_1) begin 
				
					flag_1 = 0;
					//if (counter == (period - 4'b0010)) clk_out = 0;
					if (counter == (period - 4'b0001)) begin		//nb le istruzioni vengono fatte al clock successivo! 
																		//serve un ritado per settare le nuove porte
						counter[3:0] = 4'b0000;
						clk_out = 1;							//tilda vuol dire non, cambio il clock out
																		//in questo modo faccio un divisore di frequenza del clk per il periodo in input
					end else	begin
						
						counter = counter + 1;
						clk_out = 0;
						
					end
				
				end 

				if (~clk_in) flag_1=1; //butto su il flag per il posedge successivo
				
			end		
			
		end
		
end

endmodule
