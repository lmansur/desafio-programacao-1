# README

## Como rodar

Clone o repositorio do github

ssh
```
git clone git@github.com:lmansur/desafio-programacao-1.git
```
ou https
```
git clone https://github.com/lmansur/desafio-programacao-1.git
```

Agora rode os seguintes comandos:

```
cd desafio-programacao-1/
bundler install
rails db:migrate
rails s
```

Pronto! O app está pronto para ser usado.

## Features

O site recebe um arquivo delimitado por tabs, importa os dados das compras para o db e calcula o valor da receita total, redirecionando para uma pagina que lista as compras importadas.
Para importar o arquivo, você precisa estar logado. O cadastro pode ser feito manualmente ou usando o Facebook.
