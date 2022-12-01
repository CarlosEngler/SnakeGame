module LFSR(
	input clock,
	input [3:0] semente,
	output reg [3:0] aleatorio
);

	wire aux = aleatorio[3] ^ aleatorio[2];
	
	initial 
		aleatorio <= semente;

	always@(posedge clock)
		aleatorio <= (aleatorio == 4'd0) ? semente : {aleatorio[2:0], aux};

endmodule