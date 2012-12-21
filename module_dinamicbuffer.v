`define	1_Hz_Period	 30'b000001011111010111100001000000

module	Module_DinamicBuffer	(	clk_in,//quarzo!
											sincro,
											wb_tempbuffer,
											
											pulse,
											wb_buffer);

input					clk_in;
input	[58:0]		wb_tempbuffer;
input					sincro;

output	[47:0]	wb_buffer;
output				pulse;

reg [3:0]			h_24_period;  //periodo delle ore che tiene conto che 24=00

wire 					w_sincro_pulse; //per mandare l'aggiornamento dell'ora al buffer nel momento giusto
wire [47:0] 		wb_buffer;
wire					GSR;
wire					w_dsec;
wire					w_min;
wire					w_dmin;
wire					w_h;
wire					w_dh;
wire					w_g;
wire					w_flag_day;


always @(posedge clk_in) begin

		if (wb_buffer[23:20]==4'b0010) h_24_period = 4'b0100;
		else h_24_period = 4'b1010; //tiene conto che 24=00
		
end

Module_FrequencyDivider		clock_1_Hz_generator		(	.clk_in(clk_in),
																		.period(`1_Hz_Period),
																		.reset_sincro(sincro),
																		
																		.sincro_pulse(w_sincro_pulse),
																		.clk_out(w_clock_1_Hz));

Module_Limitcounter			secondi						(	.clk_control(clk_in),
																		.clk_in(w_clock_1_Hz),
																		.period(4'b1010),
																		.reset(w_sincro_pulse),
																		.cifra(4'b0000),
													
																		.clk_out(w_dsec),
																		.counter(wb_buffer[3:0]));

Module_Limitcounter			dsecondi						(	.clk_control(clk_in),
																		.clk_in(w_dsec),
																		.period(4'b0110),
																		.reset(w_sincro_pulse),
																		.cifra(4'b0000),
													
																		.clk_out(w_min),
																		.counter(wb_buffer[7:4]));


Module_Limitcounter				minuti					(	.clk_control(clk_in),
																		.clk_in(w_min),
																		.period(4'b1010),
																		.reset(w_sincro_pulse),
																		.cifra(wb_tempbuffer[24:21]),
													
																		.clk_out(w_dmin),
																		.counter(wb_buffer[11:8]));

Module_Limitcounter				dminuti					(	.clk_control(clk_in),
																		.clk_in(w_dmin),
																		.period(4'b0110),
																		.reset(w_sincro_pulse),
																		.cifra({0,wb_tempbuffer[27:25]}),
													
																		.clk_out(w_h),
																		.counter(wb_buffer[15:12]));


Module_Limitcounter				ore						(	.clk_control(clk_in),
																		.clk_in(w_h),
																		.period(h_24_period),
																		.reset(w_sincro_pulse),
																		.cifra(wb_tempbuffer[32:29]),
													
																		.clk_out(w_dh),
																		.counter(wb_buffer[19:16]));

Module_Limitcounter				dore						(	.clk_control(clk_in),
																		.clk_in(w_dh),
																		.period(4'b0011),
																		.reset(w_sincro_pulse),
																		.cifra({0,0,wb_tempbuffer[34:33]}),
													
																		.clk_out(w_g),
																		.counter(wb_buffer[23:20]));
																		
//conversione data
Module_convertnumber		giorno							(	.clk_in(clk_in),//quarzo o fast!
																		.flag_sincro(sincro),
																		.numero({1'b0,wb_tempbuffer[42:37]}),
			
																		.cifre(wb_buffer[31:24]));
																		
Module_convertnumber		mese								(	.clk_in(clk_in),//quarzo o fast!
																		.flag_sincro(sincro),
																		.numero({2'b00,wb_tempbuffer[50:46]}),
			
																		.cifre(wb_buffer[39:32]));

Module_convertnumber		anno								(	.clk_in(clk_in),//quarzo o fast!
																		.flag_sincro(sincro),
																		.numero(wb_tempbuffer[57:51]),
			
																		.cifre(wb_buffer[47:40]));																		

endmodule