`define		10_kHz_Period	30'b000000000000000000100111000100	//	2500


module	Module_DisplayDriver	(	qzt_clk,
											fourDigitInput,
											flag_sec,
											loopindex,
											Dtype,

											anode,
											element);
				
input				qzt_clk;
input				flag_sec; //flag del secondo
input	[15:0]	fourDigitInput;
input [5:0]		loopindex;//indice del testo scorrevole
input [1:0]		Dtype;//tipo di visualizzazione

output [3:0]	anode;
output [7:0]	element;

wire				w_clock_10_kHz;
wire [1:0]		wb_anodeNumber;
wire [3:0]		wb_digit;



Module_FrequencyDivider				display_clock_generator			(	.clk_in(qzt_clk),
																						.period(`10_kHz_Period),
																						.reset_sincro(0),
																						.clk_out(w_clock_10_kHz));


Module_DisplayAnodeController		display_Anode						(	.clk_in(w_clock_10_kHz),

																						.anodeRegister(anode),
																						.anodeNumber(wb_anodeNumber));
	

Module_Multiplexer_4_input_4_bit	digitSelector						(	.clk_in(qzt_clk),
																						.address(wb_anodeNumber),
																						.input_0(fourDigitInput[3:0]),
																						.input_1(fourDigitInput[7:4]),
																						.input_2(fourDigitInput[11:8]),
																						.input_3(fourDigitInput[15:12]),
																						//.select_type(),
											
																						.mux_output(wb_digit));


Module_DigitDisplayDecoder			digitElements						(	.clk_in(qzt_clk),
																						.digit(wb_digit),
																						.type(Dtype),
																						.loopindex(loopindex),
																						.address(wb_anodeNumber),
																						.flag_sec(flag_sec),
											
																						.segments(element));
											
												
endmodule
