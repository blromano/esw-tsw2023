# Como rodar o projeto

## Instalações pré-projeto

- Node (eu uso a versão 20.7)
- Um gerenciador de pacotes do node (o Node vem com o npm já, não precisa instalar outro se não quiser, mas eu uso e recomendo o pnpm que é mais rápido e pesa menos no HD)

- Observação: tem como usar o bun também, se quiser kk, mas daí eu acho que é muita coisa pra explicar nesse documento. Caso alguém tiver interesse, é só entrar na [página deles](https://bun.sh/) e ver como funciona, é bem fácil e prático.
  - Perceba que não existe ainda uma versão pra windows, por enquanto é só linux e mac.

## Rodando o projeto

- Clone o repositório na sua máquina, seja baixando a pasta, fazendo "git clone _url_" ou ainda usando o github cli.
- Entre no projeto do seu computador usando o vs code
- Abra o terminal integrado do vscode (o atalho é **ctrl + j**) e digite:

  - _npm install_, caso vc use o npm
  - _pnpm install_, caso vc use o pnpm

- Ele vai baixar os pacotes do Node e vai demorar um tempinho que varia com a velocidade da sua internet
- Quando ele terminar, é só digitar "npm run dev" ou "pnpm run dev" no terminal e o projeto estará rodando! Vai aparecer uma mensagem no terminal mostrando qual é o link onde o site está rodando, é só clicar com o botão esquerdo do mouse + ctrl e ele vai direto pra ela.

# Explicações principais do projeto (anotações pra eu lembrar depois)

- Mudar fonte => (public.css) e mudar o import em cima e depois em baixo na parte do
