`timescale 1ns / 100ps 
module jogando();
reg clock,w,a,s,d, start;
wire fim, vitoria;
wire [6:0] pontuacao;

	main bench(.clk(clock), .start(start), .w(w), .a(a), .s(s), .d(d), 
						.game_over(fim), .win(vitoria), .tamanho(pontuacao));


always #1 clock = ~clock;

initial 
begin 
clock = 0;

w = 1; a = 0; s = 0; d = 0; #2; 
w = 0; a = 0; s = 0; d = 1; #2;
w = 0; a = 0; s = 0; d = 1; #2;
w = 0; a = 0; s = 1; d = 0; #2;
w = 0; a = 0; s = 0; d = 1; #2;
w = 0; a = 0; s = 0; d = 1; #2;
w = 1; a = 0; s = 0; d = 0; #2;
w = 1; a = 0; s = 0; d = 0; #2;
w = 1; a = 0; s = 0; d = 0; #2;
w = 0; a = 1; s = 0; d = 0; #2;
w = 0; a = 1; s = 0; d = 0; #2;
w = 0; a = 1; s = 0; d = 0; #2;
w = 1; a = 0; s = 0; d = 0; #2;
w = 1; a = 0; s = 0; d = 0; #2;
w = 0; a = 0; s = 0; d = 1; #2;
w = 0; a = 0; s = 0; d = 1; #2;
w = 1; a = 0; s = 0; d = 0; #2; 
w = 0; a = 0; s = 0; d = 1; #2;
w = 0; a = 0; s = 0; d = 1; #2;
w = 1; a = 0; s = 0; d = 0; #2; 
w = 0; a = 0; s = 0; d = 1; #2;
w = 0; a = 0; s = 0; d = 1; #2;

//caminho para pegar a maca

w = 0; a = 0; s = 0; d = 1; #30; // se mata na parede

$finish; 
end

endmodule