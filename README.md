# JogoDePlataformaGodot
Trabalho prático da disciplina de Tecnologias Emergentes em Informática do CEFET-MG, voltado ao desenvolvimento de um jogo de plataforma 2D usando Godot. O jogo foi desenvolvido conforme os vídeos da Playlist [Tutorial Godot](https://www.youtube.com/playlist?list=PL-oJEh-N3A3Qis2H0Mi-_jaq1c5oFd2Ty) do canal Clécio Espindola GameDev.  

## Configuração Inicial
Inicialmente, é feita a configuração da animação do personagem, tal como sua movimentação inicial nos eixos X e Y, conforme variáveis de velocidade, gravidade e força de pulo, além da função physics_process() do Godot Engine.

![recording-_5_-_online-video-cutter com_](https://user-images.githubusercontent.com/51242342/149674172-5d59afb9-db0c-481b-9c1c-fde2c1b3d3a4.gif)

## Tilemap, Layers e Colisões
Em sequência é criado um tilemap o qual é configurado conforme Assets baixados. São configuradas 4 camadas de jogo (Jogadores, Inimigos, Itens e Mundo) as quais são atribuidas aos objetos presentes no jogo. As colisões são ajustadas conforme as camadas e os tilemaps únicos. O resultado inicial é exibido abaixo.  

![recording-_4_-_online-video-cutter com_](https://user-images.githubusercontent.com/51242342/149676634-7bfd11fb-4ea6-4bc0-9c4f-0fa4335fd48c.gif)

## Animações e Raycast
Como próximo passo no tutorial, são feitos ajustes no processo de animação do jogador, tal como em seu formato de pulo. São criadas animações associadas ao movimento de corrida do jogador, tal como de pulo e recebimento de ataque. Ademais, é feita a configuração de alternância entre as animações através da alteração do arquivo de Scripts do player. Por fim, são incluídos raycasts no personagem para controlar a colisão do mesmo com o chão, de modo que o pulo só possa ocorrer caso o jogador esteja em alguma superfície, não "pulando infinitamente". Os resultados são expostos em sequência.  

![recording-_4_-_online-video-cutter com_ (1)](https://user-images.githubusercontent.com/51242342/149678272-490b1e9f-11a6-440a-be21-21bebf08115c.gif)

## Câmera 2D e Limites
Seguimos então para a configuração da câmera ou visão de jogo e seus limites. Para o contexto de jogo, é desejado que a câmera acompanhe o jogador com suavidade, mostrando partes do cenário que estão próximas do mesmo e deixado de lado áreas fora do limite da tela de jogo. Para tanto, cria-se um elemento "Câmera 2D" na aba do jogador; a mesma terá a opção "current" ativada, além das ferramentas de "smoothing". Os resultados, juntamente com um remanejamento do mapa, são exibidos abaixo.  

https://user-images.githubusercontent.com/51242342/150013438-603f46e3-0bc5-4f1a-b548-f408a5d12d89.mp4

## Parallax Background
Em sequência, foram configuradas as diferentes camadas do plano de fundo do jogo, utilizando os Assets [Seasonal Tilesets](https://grafxkid.itch.io/seasonal-tilesets) e os nós "Parallax Background" e "Parallax Layers" da Engine Godot. Os diferentes elementos do conjunto de assets foram organizados como texturas de diferentes "Parallax Layers" e então ordenados conforme sua posição. O ajuste à tela foi feito através de configurações de escala e espelhamento, tal como movimentação manual. De modo a proporcionar certa movimentação do cenário em relação ao jogador, são feitos ajustes na propriedade "Motion" das camadas em paralaxe. Por fim, de modo a animar as nuvens, é criado um "Shader Material" no sprite do conjunto de nuvens. Este shader material ganha então um "shade" no wual é desenvolvida uma pequena codificação responsável pela movimentação destes itens. Os resultados são exibidos abaixo. 

https://user-images.githubusercontent.com/51242342/150021429-770263d5-2578-45d1-b260-2ab6b3c60e70.mp4



