module	Module_LoopRegister_80_bit	(	qzt_clk,
													clk_loop,
													flag_load,
													parallelInput,
													enable_loop,
													
													loop_index,
													display_buffer);

input				qzt_clk;
input				clk_loop;
input	[47:0]	parallelInput;
input				flag_load;
input				enable_loop;


output [15:0]	display_buffer;
output [5:0]	loop_index;

reg [79:0]		register;
reg [15:0]		display_buffer;

reg [5:0]		loop_index;
reg [5:0]		counter0;

always @(posedge clk_loop) begin

	//ruoto l'output
	
	if (loop_index==5'b10100) loop_index=1;
	else loop_index=loop_index+1;
	
end

always @(posedge qzt_clk) begin
	
	if (flag_load) begin
	
			register[79:72]=8'b10101010;	   			//2spazi
			register[71:64]=parallelInput[23:16];  	//ore
			register[63:56]=parallelInput[15:8];  		//minuti
			register[55:48]=parallelInput[7:0];  		//secondi
		
			register[47:36]=12'b101010101010;	   	//3spazi
		
			register[35:28]=parallelInput[31:24];  	//giorno
			register[27:24]=4'b1011;  						//linea		
			register[23:16]=parallelInput[39:32];  	//mese
			register[15:12]=4'b1011;  						//linea
			register[11:4]=parallelInput[47:40]; 	 	//anno
		
			register[3:0]=4'b1010;	 					  //1spazio
			
			counter0 = 0;
			
	end else begin
			
			if (enable_loop) begin
			
					if (counter0 < loop_index) begin  //shifto del valore di counter
					
						counter0 = counter0 + 1;
						register[79:0]={register[75:0],register[79:76]};
										
					end else display_buffer[15:0]=register[79:64];
					
			end else display_buffer[15:0]=register[71:56];
	
	end
	
end

endmodule
