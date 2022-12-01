module NumeroAleatorio (
	input clock, 
	input [3:0] semente,  // semente tem que ser diferente de 1111 e 0000
	output reg [3:0] aleatorio
);

	wire [3:0] seqAleat, bitAleat;
	reg [2:0] aux; 

	initial 
	begin 
		aleatorio <= 4'b1101; //apenas para nao dar erro de inico
		aux <= 3'd0;
	end 

	LFSR lfsr(
		.clock(clock),
		.semente(semente),
		.aleatorio(seqAleat)
);

	assign bitAleat[0] = seqAleat[0];

	always@(posedge clock)
	begin 
		aleatorio[aux] = bitAleat[aux];
				
		aux = (aux == 3'd3) ? 3'd0 : aux + 3'd1;
		
		if(aleatorio == 4'b1111)
		begin
			aleatorio <= 4'b1010;
		end
		else if(aleatorio == 4'b0000)
		begin
			aleatorio <= 4'b0101;
		end
		
	end 
endmodule