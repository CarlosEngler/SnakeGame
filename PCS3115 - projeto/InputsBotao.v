module InputsBotao(clock,w,a,s,d,direcao);
input clock,w,a,s,d;
output reg [3:0] direcao;

initial
begin
 direcao = 4'b0001;
end


always@(posedge clock)
begin
if(w == 1 && direcao != 4'b0100) begin
direcao <= 4'b0001; //cima
end 
else if(a == 1 && direcao != 4'b1000) begin 
direcao <= 4'b0010; //esquerda
end 
else if(s == 1 && direcao != 4'b0001) begin 
direcao <= 4'b0100; //baixo 
end 
else if(d == 1 && direcao != 4'b0010) begin 
direcao <= 4'b1000; //direita
end
else begin 
direcao <= direcao; //sem novo imput, mantem o ultimo 
end 
end 

endmodule