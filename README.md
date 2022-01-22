# Trabalho Prático: Jogo de Plataforma 2D usando Godot Engine
Trabalho prático da disciplina de Tecnologias Emergentes em Informática do CEFET-MG, voltado ao desenvolvimento de um jogo de plataforma 2D usando Godot. O jogo foi desenvolvido conforme os vídeos da Playlist [Tutorial Godot](https://www.youtube.com/playlist?list=PL-oJEh-N3A3Qis2H0Mi-_jaq1c5oFd2Ty) do canal Clécio Espindola GameDev.

## Resultado Parcial
Visualize uma prévia do sistema em sua atual fase desenvolvimento através do vídeo abaixo :)

https://user-images.githubusercontent.com/51242342/150656716-80abd1ec-beb4-4725-b889-79e35a2fabab.mp4


# Processo de Implementação: Passo a Passo Conforme as Vídeo-Aulas

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

## Fall Zones
Um outro ponto importante no jogo em desenvolvimento é a criação de fallzones ou zonas de queda, nas quais caso o personagem se insira, o nível deverá ser reiniciado. Isso é feito usando uma área 2d com a função "body_entered". A mesma reiniciará a fase ou cenário em curso caso o personagegm adentrar a área em cheque. O resultado é exibido em sequência. 

https://user-images.githubusercontent.com/51242342/150041739-97ea764e-fa37-4af9-91a0-e7b3e04aa648.mp4

## Itens
Finalmente, são criados itens os quais podem ser coletados pelo jogador. Ao serem tocados pelo mesmo, estes objetos terão sua animação "coletado" rodada e, ao fim desta, desparecerão da cena através do uso da função queue_free(). Os resultados são expostos abaixo. 

https://user-images.githubusercontent.com/51242342/150214391-c1312494-27f0-478a-b539-04527800696f.mp4

## Enemies
Dentre os personagens importantes ao jogo em desenvolvimento estão os inimigos os quais o jogador deverá enfrentar. Estes são criados de maneira semelhante ao personagem principal, com as animações de run, hit e idle. Esta última, no entanto, não é contínua devido à necessidade de se reportar seu fim para uma movimentação mais harmônica do inimigo. Através de um raycast para verificação de colisões laterais com paredes ou com o próprio jogador, desenvolve-se um sistema de patrulha, o qual é apresentado a seguir. Os inimigos ainda não causam dano ao personagem neste estágio de desenvolvimento, algo que será implementado mais adiante. 

https://user-images.githubusercontent.com/51242342/150543425-cc073a22-0c7e-45e4-a101-4512f8eded10.mp4

## Colisão Jogador-Inimigo
Conforme mencionado, a colisão entre o jogador e seus inimigos de modo a lhe causar dano ou a inflingi-lo no vilão ainda não havia sido implementada, algo que é feito neste item através de áreas 2d com colision shapes. São implementadas funções que analisam a entrada de corpos nestas áreas. Dependendo de qual delas se trata, tem-se a ocorrência de dano ou no personagem principal ou em seu inimigo, podendo ocasionar a morte do indivíduo em cheque. Caso este seja o jogador, a cena em curso é reiniciada. Vê-se o resultado a seguir. 

https://user-images.githubusercontent.com/51242342/150561516-72a421be-bf99-4c82-b5fd-0156d0e57f83.mp4

## Falling Platforms
De modo a tornar o jogo mais interessante e aumentar seu grau de dificuldade, foram criadas neste itens plataformas as quais "caem" após terem contato com o jogador. Tal função foi implementada através de uma verificação de colisão em adição a um timer e uma verificação de fim de animação. Após alguns segundos, a plataforma caída é restaurada à sua posição e animação originais. O resultado é exposto abaixo. 

https://user-images.githubusercontent.com/51242342/150653031-2a411f77-3702-4319-a764-4f036b6b2eef.mp4

## Moving Platforms
Como uma dos últimas com

https://user-images.githubusercontent.com/51242342/150656623-db9480e6-1309-4afc-b965-ecba2c1b7227.mp4

ponentes da primeira cena está a plataforma móvel. Desenvolvidas através de um código associado a um objeto tween, elas se movem na horizontal e na vertical conforme as especificações de jogo. Os resultados são expostos em sequência. 
