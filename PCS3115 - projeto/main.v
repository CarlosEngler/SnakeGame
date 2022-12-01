module main (
	input clk,
	input start,
	input w, a, s, d,
	output reg game_over, //retorna 1 se perder
	output reg win, //retorna 1 se ganhar
	output reg [6:0] tamanho
);
	
	reg [3:0] headY, headX;
	reg [3:0] appley, applex;
	reg [7:0] corpo [0:127];
	reg [7:0] posicao;
	
	reg [3:0] sementex, sementey;
	
	reg naoLetal;
	
	wire [3:0] randomx, randomy;
	wire [3:0] direcao;
	
	integer conter;
	
	initial
	begin
		headX = 4'd8;
		headY = 4'd8;
		corpo[0] = 8'b01111000;
		
		sementex = 4'b1011;
		sementey = 4'b1100;
		
		applex = 4'b1011;
		appley = 4'b1011;
		naoLetal = 1'b0; 
		
		game_over = 1'b0;
		win = 1'b0;
		
		tamanho = 7'd1;
	end
	
	InputsBotao uut (.clock(clk), .w(w), .a(a), .s(s), .d(d), .direcao(direcao));
	
	NumeroAleatorio uux (.clock(clk), .semente(sementex), .aleatorio(randomx));
	NumeroAleatorio uuy (.clock(clk), .semente(sementey), .aleatorio(randomy));
	
	//move a posição da cabeça da cobra
	
	always @(posedge clk)
	begin
		if(~game_over && start && ~win)
		begin
			case (direcao)
			
				4'b0001: //cima
				begin
					headY <= headY + 4'd1;
				end
				
				4'b0010: //esquerda
				begin
					headX <= headX - 4'd1;
				end
				
				4'b0100: //baixo
				begin
					headY <= headY - 4'd1;
				end
				
				4'b1000: //direita
				begin
					headX <= headX + 4'd1;
				end
				
			endcase
		end
		
	end
	
	
	//verifica se teve alguma colisao letal
	
	always @(posedge clk)
		begin
		
		//verificar se bateu na parede 
		
		if (headX == 4'b0000)
		begin
			 game_over <= 1'b1;
		end
		
		else if (headX == 4'b1111)
		begin
			 game_over <= 1'b1;
		end
		
		else if (headY == 4'b0000)
			begin
			 game_over <= 1'b1;
		end
		
		else if (headY == 4'b1111)
			begin
			 game_over <= 1'b1;
		end
		
		//verificar se bateu no corpo
		
		posicao = {headX, headY};
		
		if(tamanho == 7'd0)
		begin
			for(conter = 0; conter <= tamanho; conter = conter + 1)
				begin
		
				if(posicao == corpo[conter]) 
					begin
					game_over <= 1'b1;
				end
					
			end
		end
		
	end
 
 
	always @(posedge clk)
	begin
		naoLetal = ((headY == appley) && (applex == headX));
		
		if(~naoLetal) // caso não tenha comido maçã
		begin
			for(conter = 0; conter < 127; conter = conter + 1)
			begin	
				if(conter < (tamanho - 1))
				begin
				corpo[conter] <= corpo[conter+1];
				end
			end
			corpo[tamanho - 1] <= {headX, headY}; //ultima posição do vetor recebe a informação da cabeça
		end
		
		if(naoLetal) //caso tenha comido 
		begin
			tamanho <= tamanho + 7'd1;	
			corpo[tamanho-1] <= {headX, headY};	
			applex <= randomx;
			appley <= randomy;
			naoLetal <= 1'd0;
		end
	end 
	
	always @(posedge clk)
		begin
		
		//vitoria
		
		if (tamanho == 8'b1111111)
			begin
			win <= 1'b1; 
		end
		  
		 //colisao fatal
	
	end
	
endmodule
