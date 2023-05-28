# Desafio Google Search

Desenvolver, em qualquer linguagem, uma API que faz uma pesquisa no google e devolve o resultado em json e/ou XML.

Não utilizar as API do Google, como Search API.

Deve se extrair do resultado do google:
- Titulo
- Link
   

Um cliente para consumir a API em qualquer linguagem/Plataforma:

Ex:
- Apenas um campo para entrada de dados do valor a ser pesquisado;
- Um botão para disparar a pesquisa;
- Um container para exibir o resultado.
   
Não pode ser utilizado IFrames, ou similares.

O Titulo deve ser exibido, sem link.

O Link logo abaixo do Titulo, clicavel e abrir em uma nova janela.

Não deve ser exibido mais nada da página do google. Todas as outras informações, cabeçalhos, rodapés, etc devem ser descartados.

Exemplo do resultado:

Maringá - Wikipedia
[https://en.wikipedia.org/wiki/Maringá]


MARINGA.COM - O portal da cidade de Maringá - Paraná
[www.maringa.com/]


Prefeitura do Município de Maringá
[www.maringa.pr.gov.br/]


## Como executar o projeto
- Primeiramente deve-se instalar o Dart seguindo a documentação do mesmo: https://dart.dev/get-dart
- Após instalação do Dart, instalar o flutter seguindo documentação: https://flutter.dev/docs/get-started/install
- Com as ferramentas devidamente instaladas é necessário fazer o Download desse repositório.
- Após o download abra o projeto backend no VSCode.
- Execute o comando "flutter pub get" para baixar as bibliotecas do pubspec.yaml.
- Abra o arquivo .env e no campo IP_CONFIG insira o ip da sua máquina.
- Após execute o comando "dart run" ou aperte f5.
- Pronto o servidor API está rodando.
- Agora abra em uma nova janela o projeto client no VSCode.
- Execute o comando "flutter pub get" para baixar as bibliotecas do pubspec.yaml.
- Abra o arquivo .env e no campo IP_CONFIG insira o ip da sua máquina.
- Abra um emulador Android ou iOS.
- Após execute o comando "flutter run" ou aperte f5.