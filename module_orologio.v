`define		1_kHz_Period	30'b000000000000000110000110101000	//	25000
`define		loop_Hz_Period	 30'b000001011111010111100001000000
`define		50_Hz_Period   30'b000000000001111010000100100000	//	500000

module Module_Orlogio	(	qzt_clk,
									enable_sincro,
									enable_lp,
									
									led,
									sevenSegmentDigit_Anode,
									sevenSegmentDigit_Element);

input				qzt_clk;
input				enable_sincro;		//switch per abilitare la sincronia
input				enable_lp;			//abilita il loop del display

output [4:0]	led;		
output [7:0]	sevenSegmentDigit_Element;
output [3:0]	sevenSegmentDigit_Anode;

wire [58:0]		wb_temp_buf;		//buffer non codificato
wire [47:0]		wb_buffer;			//buffer codificato
wire [23:0]		wb_dispbuff;  		//display effettivo
wire [5:0]		wb_loop_index;		//indice del testo scorrevole
wire [1:0]		wb_dtype;			//tipo di visualizzazione su display

wire				w_clock_1_kHz;		//clock della sincronia
wire				w_clock_50_Hz;		//clock dell'aggiornamento del display scorrevole
wire				w_clock_loop_Hz;	//peri il loop del display
wire				w_sgn;				//segnale
wire				w_sincro;			//bit sincronia senza il controllo della paritá
wire				w_sincrocheck;		//bit sincronia con il controllo della paritá
wire				w_sincroflag; 		//bit sincronia per lettura buffer ecc (non x inizio minuto=>w_sincro_pulse)
wire				ld1;
wire				ld2;
wire				ld0;

and(led[0],1,w_sincro);
and(led[1],1,ld0);
and(led[2],1,ld1);
and(led[3],1,ld2);
and(led[4],wb_temp_buf[0],1);

and(w_sincroflag,w_sincro,w_sincrocheck); //per la sincronia dei due sincro

//genera segnale facke						
Module_FrequencyDivider		clock_1_KHz_generator	(	.clk_in(qzt_clk),
																		.period(`1_kHz_Period),
																		.reset_sincro(0),

																		.clk_out(w_clock_1_kHz));

Module_Signal_Facke			signal						(	.clk_in(w_clock_1_kHz),

																		.sgn_out(w_sgn));
//fine genera segnale


//Sincronizzazione del segnale (ricerca l'inizio del minuto) il flag di sincro va a 1 
//e torna a 0 esattamente al primo secondo del minuto
Module_SincroDCF				sincro						(	.clk_in(w_clock_1_kHz),
																		.sgn_in(w_sgn),
																		.onoff_sincro(enable_sincro),

																		.flag_out(w_sincro));			

//fine sincronizzazione										



//Lettura segnale e conversione
Module_TempBuffer			tempdecoder						(	.clk_in(w_clock_1_kHz),
																		.sgn_in(w_sgn),

																		.wb_parallel_out(wb_temp_buf[58:0]),
																		.ld1(ld1),
																		.ld2(ld2));
																		
																		
Module_DinamicBuffer		bufferdinamico					(	.clk_in(qzt_clk),
																		.sincro(w_sincroflag),
																		.wb_tempbuffer(wb_temp_buf[58:0]),
																		
																		.pulse(ld0),
																		.wb_buffer(wb_buffer[47:0]));		

//controllo paritá per evitare gli errori la sincronia avviene solo se non ci sono errori																		
Module_ParityCheck		controlloParita				(	.qzt_clk(qzt_clk),
																		.sincro_in(w_sincro),
																		.wbtempbuf(wb_temp_buf[58:0]),
																		
																		.sincro_out(w_sincrocheck));									
									
//fine lettura

//display driver
Module_FrequencyDivider		clock_loop_Hz_generator	(	.clk_in(qzt_clk),
																		.period(`loop_Hz_Period),
																		.reset_sincro(0),

																		.clk_out(w_clock_loop_Hz));
																		

Module_FrequencyDivider		clock_50_Hz_generator	(	.clk_in(qzt_clk),
																		.period(`50_Hz_Period),
																		.reset_sincro(0),

																		.clk_out(w_clock_50_Hz));

																		
Module_LoopRegister_80_bit	loop							(	.qzt_clk(qzt_clk),
																		.clk_loop(w_clock_loop_Hz),
																		.flag_load(w_clock_50_Hz),
																		.parallelInput(wb_buffer[47:0]),
																		.enable_loop(enable_lp),
																		
																		.loop_index(wb_loop_index),
																		.display_buffer(wb_dispbuff[15:0]));
																		
Module_SelectDispType		DispType						(	.qzt_clk(qzt_clk),
																		.enable_loop(enable_lp),
																		
																		.Dtype(wb_dtype));
																		
													
Module_DisplayDriver			display						(	.qzt_clk(qzt_clk),
																		.fourDigitInput(wb_dispbuff[15:0]),
																		.flag_sec(w_sgn),
																		.Dtype(wb_dtype),
																		.loopindex(wb_loop_index),

																		.anode(sevenSegmentDigit_Anode),
																		.element(sevenSegmentDigit_Element));

//fine display
endmodule