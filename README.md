<h1> Projeto de Snake Game em verilog </h1>

 A pasta "PCS3115 - Projeto" vista no diretório inicial do repositório é a pasta do projeto do Quartus que utilizamos. <br>
 
A pasta "codigos" também no diretório inicial é a pasta com apenas os arquivos .v que utilizamos para a compilação e simulação efetiva do projeto.
Com a adição da testbench "jogando.v".

 Para esse projeto, utilizamos o Quartus Prime Lite para desenvolver os códigos, o Questa e o Modelsim para o simularmos.
A maior parte dos códigos foi simulada independentemente e posteriomente unida no código Main.v, dentro dos always nela encontrados.  <br>
O Projeto foi dividido em algumas partes consideradas essenciais: A leitura dos inputs de 4 botões e a sua ordenação, 
a movimentação da cobra (da sua cabeça e do seu corpo), a checagem das colisões (com a parede, com o próprio corpo e com a maçã) e
a geração de uma maçã em uma posição aleatória (por meio do uso de LFSR). <br>

<h2>Sobre a Testbench:</h2>
Nós a fizemos como um circuito simples de simulação do jogo, onde a cobra vai atrás da primeira maçã (em 22 movimentos) e depois colide com a parede do lado direito.
É relativamente complexo fazer uma simulação desse tipo onde a cobra consegue colidir com múltiplas maçãs, uma vez que elas idealmente são aleatórias devido ao LFSR.


