# JogoDePlataformaGodot
Trabalho prático da disciplina de Tecnologias Emergentes em Informática do CEFET-MG, voltado ao desenvolvimento de um jogo de plataforma 2D usando Godot.

## Configuração Inicial
Inicialmente, é feita a configuração da animação do personagem, tal como sua movimentação inicial nos eixos X e Y, conforme variáveis de velocidade, gravidade e força de pulo, além da função physics_process() do Godot Engine.

![recording-_5_-_online-video-cutter com_](https://user-images.githubusercontent.com/51242342/149674172-5d59afb9-db0c-481b-9c1c-fde2c1b3d3a4.gif)

## Tilemap, Layers e Colisões
Em sequência é criado um tilemap o qual é configurado conforme Assets baixados. São configuradas 4 camadas de jogo (Jogadores, Inimigos, Itens e Mundo) as quais são atribuidas aos objetos presentes no jogo. As colisões são ajustadas conforme as camadas e os tilemaps únicos. O resultado inicial é exibido abaixo.  

![recording-_4_-_online-video-cutter com_](https://user-images.githubusercontent.com/51242342/149676634-7bfd11fb-4ea6-4bc0-9c4f-0fa4335fd48c.gif)

## Animações e Raycast
Como próximo passo no tutorial, são feitos ajustes no processo de animação do jogador, tal como em seu formato de pulo. São criadas animações associadas ao movimento de corrida do jogador, tal como de pulo e recebimento de ataque. Ademais, é feita a configuração de alternância entre as animações através da alteração do arquivo de Scripts do player. Por fim, são incluídos raycasts no personagem para controlar a colisão do mesmo com o chão, de modo que o pulo só possa ocorrer caso o jogador esteja em alguma superfície, não "pulando infinitamente". Os resultados são expostos em sequência.  

![recording-_4_-_online-video-cutter com_ (1)](https://user-images.githubusercontent.com/51242342/149678272-490b1e9f-11a6-440a-be21-21bebf08115c.gif)
