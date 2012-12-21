module	Module_FrequencyDivider	(	clk_in,
												period,
												reset_sincro,
												
												sincro_pulse,
												clk_out);

input				clk_in;
input				reset_sincro;
input	[29:0]	period;

output			clk_out;
output			sincro_pulse;

reg				clk_out;
reg				sincro_pulse;
reg				pulse;
reg	[29:0]	counter;

wire				GSR;


always @(posedge clk_in) begin

	if (GSR) begin
	
		counter = 0;
		clk_out = 0;
		pulse=0;
		sincro_pulse=0;
		
	end else begin
	
			if (reset_sincro) begin
		
				pulse=1;//serve per dare il primo clock subito dopo il reset
				counter = 0;
				clk_out = 0;
				sincro_pulse = 0;	
				
			end else begin
			
					if (pulse) begin
						
						pulse=0;
						clk_out = 1;
						sincro_pulse = 1;
						//counter = counter + 1;
						
					end else begin
					
						counter = counter + 1;
						sincro_pulse = 0;	
						
						if (counter == (period - 1)) begin		//nb le istruzioni vengono fatte al clock successivo! 
													//serve un ritado per settare le nuove porte
							counter = 0;
							clk_out = ~clk_out;			//tilda vuol dire non, cambio il clock out
													//in questo modo faccio un divisore di frequenza del clk per il periodo in input
						end
					
					end
		
			end
			
	end

end

endmodule
