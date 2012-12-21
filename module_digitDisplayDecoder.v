module	Module_DigitDisplayDecoder	(	clk_in,
													digit,
													type,//tipo di visualizzazione
													loopindex, //indice del registro in loop
													address,
													flag_sec,//flag del secondo

													segments);

input				clk_in;
input				flag_sec;
input	[3:0]		digit;
input	[1:0]		address;
input [1:0]		type;
input [5:0]		loopindex;

output [7:0]	segments;

reg [7:0]		segments;

always @(posedge clk_in) begin

		case(type)
			
			2'b01://hh:mm punto che lampeggia
				if ((address==2'b10) && flag_sec) begin
					case (digit)
						0: segments = ~(8'b10111111);
						1: segments = ~(8'b10000110);
						2: segments = ~(8'b11011011);
						3: segments = ~(8'b11001111);
						4: segments = ~(8'b11100110);
						5: segments = ~(8'b11101101);
						6: segments = ~(8'b11111101);
						7: segments = ~(8'b10000111);
						8: segments = ~(8'b11111111);
						9: segments = ~(8'b11101111);
						
						10: segments = ~(8'b10000000);// 
						11: segments = ~(8'b11000000);//-
						12: segments = ~(8'b10000000);//.
						13: segments = ~(8'b10000000);//.
						14: segments = ~(8'b10000000);//.
						15: segments = ~(8'b10000000);//.
					endcase
				end else begin
					case (digit)
						0: segments = ~(8'b00111111);
						1: segments = ~(8'b00000110);
						2: segments = ~(8'b01011011);
						3: segments = ~(8'b01001111);
						4: segments = ~(8'b01100110);
						5: segments = ~(8'b01101101);
						6: segments = ~(8'b01111101);
						7: segments = ~(8'b00000111);
						8: segments = ~(8'b01111111);
						9: segments = ~(8'b01101111);
						
						10: segments = ~(8'b00000000);// 
						11: segments = ~(8'b01000000);//-
						12: segments = ~(8'b10010000);//.
						13: segments = ~(8'b10010000);//.
						14: segments = ~(8'b10010000);//.
						15: segments = ~(8'b10010000);//.
					endcase
				end

			2'b10://scorrevole punti fissi
			
				if ((loopindex < 5'b00100) && (loopindex[1:0]==address)) begin
					case (digit)
						0: segments = ~(8'b10111111);
						1: segments = ~(8'b10000110);
						2: segments = ~(8'b11011011);
						3: segments = ~(8'b11001111);
						4: segments = ~(8'b11100110);
						5: segments = ~(8'b11101101);
						6: segments = ~(8'b11111101);
						7: segments = ~(8'b10000111);
						8: segments = ~(8'b11111111);
						9: segments = ~(8'b11101111);
						
						10: segments = ~(8'b10000000);// 
						11: segments = ~(8'b11000000);//-
						12: segments = ~(8'b10000000);//.
						13: segments = ~(8'b10000000);//.
						14: segments = ~(8'b10000000);//.
						15: segments = ~(8'b10000000);//.
					endcase
				end else begin
				
						if ((loopindex > 5'b00010) && (loopindex < 5'b00110) && (loopindex[1:0]==(address+2'b10))) begin
						
							case (digit)
								0: segments = ~(8'b10111111);
								1: segments = ~(8'b10000110);
								2: segments = ~(8'b11011011);
								3: segments = ~(8'b11001111);
								4: segments = ~(8'b11100110);
								5: segments = ~(8'b11101101);
								6: segments = ~(8'b11111101);
								7: segments = ~(8'b10000111);
								8: segments = ~(8'b11111111);
								9: segments = ~(8'b11101111);
								
								10: segments = ~(8'b10000000);// 
								11: segments = ~(8'b11000000);//-
								12: segments = ~(8'b10000000);//.
								13: segments = ~(8'b10000000);//.
								14: segments = ~(8'b10000000);//.
								15: segments = ~(8'b10000000);//.
							endcase
							
						end else begin
						
							case (digit)
								0: segments = ~(8'b00111111);
								1: segments = ~(8'b00000110);
								2: segments = ~(8'b01011011);
								3: segments = ~(8'b01001111);
								4: segments = ~(8'b01100110);
								5: segments = ~(8'b01101101);
								6: segments = ~(8'b01111101);
								7: segments = ~(8'b00000111);
								8: segments = ~(8'b01111111);
								9: segments = ~(8'b01101111);
								
								10: segments = ~(8'b00000000);// 
								11: segments = ~(8'b01000000);//-
								12: segments = ~(8'b00000000);//.
								13: segments = ~(8'b00000000);//.
								14: segments = ~(8'b00000000);//.
								15: segments = ~(8'b00000000);//.
							endcase
						
						end
				
				end
										
				
			endcase
			
end

endmodule
