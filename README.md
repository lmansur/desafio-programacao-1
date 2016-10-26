# README

## Como rodar

Clone o repositorio do github

```
git clone git@github.com:lmansur/desafio-programacao-1.git
```

Vá para o diretório do app e rode os seguintes comandos:

```
cd desafio-programacao-1/
bundler install
rails db:migrate
rails s
```

Pronto! O app está pronto para ser usado.

## Features

O site recebe um arquivo delimitado por tabs, importa os dados das compras e calcula o valor da receita total.
Para importar o arquivo, você precisa estar logado. O cadastro pode ser feito manualmente ou usando o Facebook.
