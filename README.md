# **Sistema com Lazarus**.


## Este repositório contém um mini sistema desenvolvido utilizando a IDE Lazarus. O projeto inclui o script para a criação do banco de dados e todos os arquivos necessários, como imagens e ícones.


* Índice
* Descrição
* Pré-requisitos
* Instalação
* Uso
* Estrutura do Projeto
* Contribuição
* Licença
* Contato


## Descrição

Este mini sistema foi desenvolvido para demonstrar as funcionalidades básicas de um aplicativo de desktop usando Lazarus. Ele inclui a interface gráfica, operações básicas de banco de dados e alguns ícones e imagens para melhorar a usabilidade.


## Pré-requisitos

Antes de começar, certifique-se de ter os seguintes softwares instalados:

* Lazarus (Versão 3.4).
* PostgreSQL (Versão 9.6.24).


## Instalação

1. Clone este repositório para sua máquina local:

```
git clone https://github.com/nferdica/small-system-lazarus.git
```

2. Navegue até o diretório do projeto:

```
cd small-system-lazarus
```

3. Crie o banco de dados utilizando o script fornecido:

* Abra o seu cliente PostgreSQL (como DBeaver ou pgAdmin).
* Execute o script script.sql localizado na pasta database para criar o banco de dados e as tabelas necessárias.

4. Abra o projeto na IDE Lazarus:

* Abra a IDE Lazarus
* Vá para File > Open e selecione o arquivo do prjSCO.lpi no diretório clonado.


## Uso

* Compile e execute o projeto na IDE Lazarus.
* Utilize a interface do mini sistema para interagir com as funcionalidades disponíveis.


## Estrutura do Projeto

A estrutura do projeto é a seguinte:

```
small-system-lazarus/
├── database/
│   └── script.sql
├── images/
│   └── ...
├── README.md
└── prjSCO.lpi
```

* **database/:** Contém o script SQL para criação do banco de dados.
* **images/:** Contém as imagens e ícones usados no projeto.
* **README.md:** Este arquivo.
* **project.lpi:** Arquivo do projeto Lazarus.

## Contribuição
Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Licença
Este projeto está licenciado sob a Licença MIT.

## Contato
Se você tiver alguma dúvida ou sugestão, sinta-se à vontade para entrar em contato:

* Email: nferdica@outlook.com
* GitHub: nferdica
