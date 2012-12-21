module	Module_Signal_Facke	(	clk_in,

							sgn_out);

input			clk_in;

output		sgn_out;

reg			sgn_out;

reg	[15:0]	counter;

wire			GSR;

always @(posedge clk_in) begin

	if (GSR) begin //per 20millisec resetta

		counter = 0;
		sgn_out = 1;

	end else begin

		if (counter == 0) sgn_out=1;

		if (counter == 1000) sgn_out=0;
		if (counter == 1100) sgn_out=1;

		if (counter == 2000) sgn_out=0;
		if (counter == 2100) sgn_out=1;

		if (counter == 3000) sgn_out=0;
		if (counter == 3100) sgn_out=1;

		if (counter == 4000) sgn_out=0;
		if (counter == 4100) sgn_out=1;

		if (counter == 5000) sgn_out=0;
		if (counter == 5100) sgn_out=1;

		if (counter == 6000) sgn_out=0;
		if (counter == 6100) sgn_out=1;

		if (counter == 7000) sgn_out=0;
		if (counter == 7100) sgn_out=1;

		if (counter == 8000) sgn_out=0;
		if (counter == 8100) sgn_out=1;

		if (counter == 9000) sgn_out=0;
		if (counter == 9100) sgn_out=1;

		if (counter == 10000) sgn_out=0;
		if (counter == 10100) sgn_out=1;

		if (counter == 11000) sgn_out=0;
		if (counter == 11100) sgn_out=1;

		if (counter == 12000) sgn_out=0;
		if (counter == 12100) sgn_out=1;

		if (counter == 13000) sgn_out=0;
		if (counter == 13100) sgn_out=1;

		if (counter == 14000) sgn_out=0;
		if (counter == 14100) sgn_out=1;

		if (counter == 15000) sgn_out=0;
		if (counter == 15100) sgn_out=1;

		if (counter == 16000) sgn_out=0;
		if (counter == 16100) sgn_out=1;

		if (counter == 17000) sgn_out=0;
		if (counter == 17100) sgn_out=1;

		if (counter == 18000) sgn_out=0;
		if (counter == 18200) sgn_out=1;

		if (counter == 19000) sgn_out=0;
		if (counter == 19100) sgn_out=1;

		if (counter == 20000) sgn_out=0;
		if (counter == 20100) sgn_out=1;

		if (counter == 21000) sgn_out=0;
		if (counter == 21200) sgn_out=1;

		if (counter == 22000) sgn_out=0;
		if (counter == 22200) sgn_out=1;

		if (counter == 23000) sgn_out=0;
		if (counter == 23100) sgn_out=1;

		if (counter == 24000) sgn_out=0;
		if (counter == 24100) sgn_out=1;

		if (counter == 25000) sgn_out=0;
		if (counter == 25200) sgn_out=1;

		if (counter == 26000) sgn_out=0;
		if (counter == 26200) sgn_out=1;

		if (counter == 27000) sgn_out=0;
		if (counter == 27100) sgn_out=1;

		if (counter == 28000) sgn_out=0;
		if (counter == 28200) sgn_out=1;

		if (counter == 29000) sgn_out=0;
		if (counter == 29100) sgn_out=1;

		if (counter == 30000) sgn_out=0;
		if (counter == 30200) sgn_out=1;

		if (counter == 31000) sgn_out=0;
		if (counter == 31200) sgn_out=1;

		if (counter == 32000) sgn_out=0;
		if (counter == 32100) sgn_out=1;

		if (counter == 33000) sgn_out=0;
		if (counter == 33100) sgn_out=1;

		if (counter == 34000) sgn_out=0;
		if (counter == 34200) sgn_out=1;

		if (counter == 35000) sgn_out=0;
		if (counter == 35100) sgn_out=1;

		if (counter == 36000) sgn_out=0;
		if (counter == 36200) sgn_out=1;

		if (counter == 37000) sgn_out=0;
		if (counter == 37200) sgn_out=1;

		if (counter == 38000) sgn_out=0;
		if (counter == 38100) sgn_out=1;

		if (counter == 39000) sgn_out=0;
		if (counter == 39200) sgn_out=1;

		if (counter == 40000) sgn_out=0;
		if (counter == 40200) sgn_out=1;

		if (counter == 41000) sgn_out=0;
		if (counter == 41200) sgn_out=1;

		if (counter == 42000) sgn_out=0;
		if (counter == 42100) sgn_out=1;

		if (counter == 43000) sgn_out=0;
		if (counter == 43200) sgn_out=1;

		if (counter == 44000) sgn_out=0;
		if (counter == 44200) sgn_out=1;

		if (counter == 45000) sgn_out=0;
		if (counter == 45200) sgn_out=1;

		if (counter == 46000) sgn_out=0;
		if (counter == 46100) sgn_out=1;

		if (counter == 47000) sgn_out=0;
		if (counter == 47100) sgn_out=1;

		if (counter == 48000) sgn_out=0;
		if (counter == 48200) sgn_out=1;

		if (counter == 49000) sgn_out=0;
		if (counter == 49100) sgn_out=1;

		if (counter == 50000) sgn_out=0;
		if (counter == 50100) sgn_out=1;

		if (counter == 51000) sgn_out=0;
		if (counter == 51200) sgn_out=1;

		if (counter == 52000) sgn_out=0;
		if (counter == 52100) sgn_out=1;

		if (counter == 53000) sgn_out=0;
		if (counter == 53100) sgn_out=1;

		if (counter == 54000) sgn_out=0;
		if (counter == 54200) sgn_out=1;

		if (counter == 55000) sgn_out=0;
		if (counter == 55100) sgn_out=1;

		if (counter == 56000) sgn_out=0;
		if (counter == 56100) sgn_out=1;

		if (counter == 57000) sgn_out=0;
		if (counter == 57100) sgn_out=1;

		if (counter == 58000) sgn_out=0;
		if (counter == 58100) sgn_out=1;

		if (counter == 59000) sgn_out=0;
		if (counter == 59100) sgn_out=1;

		if (counter == 59999) counter=0;


		counter=counter+1;
	end

end

endmodule
