module	Module_ParityCheck	(	qzt_clk,
											sincro_in,
											wbtempbuf,
											
											sincro_out);

input				qzt_clk;
input				sincro_in;
input	[58:0]	wbtempbuf;

output			sincro_out;

reg				sincro_out;
reg 				a;
reg				b;

wire				GSR;

always @(posedge qzt_clk) begin

	if (GSR) begin

		sincro_out = 0;

	end else begin
	
		if (sincro_in) begin
		
			a = wbtempbuf[28]+wbtempbuf[35]+wbtempbuf[58];	//paritá della stringa
			b = wbtempbuf[21]+wbtempbuf[22]+wbtempbuf[23]+wbtempbuf[24]+wbtempbuf[25]+wbtempbuf[26]+wbtempbuf[27]+wbtempbuf[29]+wbtempbuf[30]+wbtempbuf[31]+wbtempbuf[32]+wbtempbuf[33]+wbtempbuf[34]+wbtempbuf[36]+wbtempbuf[37]+wbtempbuf[38]+wbtempbuf[39]+wbtempbuf[40]+wbtempbuf[41]+wbtempbuf[42]+wbtempbuf[43]+wbtempbuf[44]++wbtempbuf[45]+wbtempbuf[46]+wbtempbuf[47]+wbtempbuf[48]+wbtempbuf[49]+wbtempbuf[50]+wbtempbuf[51]+wbtempbuf[52]+wbtempbuf[53]+wbtempbuf[54]+wbtempbuf[55]+wbtempbuf[56]+wbtempbuf[57];
			
			if (a==b) sincro_out=1;
			else sincro_out=0;
			
		end else begin
			
			sincro_out=0;
			
		end
		
	end

end

endmodule
