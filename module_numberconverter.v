module	Module_convertnumber					(	clk_in,
															flag_sincro,
															numero,

															cifre);
															

input				clk_in;
input				flag_sincro;
input	[6:0]		numero;

output[7:0]		cifre;


reg				flag_conversione;
reg	[7:0]		cifre;
reg 	[6:0]   	mem;
reg	[3:0]		counter;

wire	GSR;

always @(posedge clk_in) begin

	if (GSR) begin 

		counter = 4'b0000;
		flag_conversione = 0;
		mem = 7'b0000000;
		cifre = 7'b0000000;

	end else begin
	
		  if (flag_sincro) begin 
		  
				flag_conversione = 1;
				mem[6:0]=numero[6:0];
				counter = 4'b0000;
			
		  end
		  
		  if (flag_conversione) begin
		  
					if (mem > 6'b001001) begin
					
						counter = counter + 1;
						mem = mem - 6'b001010;//tolgo 10
						
					end else begin 
					
						cifre = {counter[3:0],mem[3:0]};
						flag_conversione = 0;
						
					end
			
			end 
		
	end

end

endmodule
