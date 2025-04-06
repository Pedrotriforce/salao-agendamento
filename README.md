# Projeto Integrado Desenvolvimento Desktop

Projeto desenvolvido para o curso de Análise e Desenvolvimento de Sistemas da UNIFEOB.




## Autores

- Pedro Paulo Batista Alves - RA: 24001197


## Sobre o projeto

Protótipo de Sistema de Agendamento de clientes

Sistema independente para gestão de agendamentos para a empresa Neula Araujo Studio de Beleza, sobre o CNPJ 30.430.640/0001-00, localizado em São José dos Campos, com a lógica do sistema desenvolvida em Java com POO e a estrutura do Banco de Dados desenvolvida em MySQL, sem integração entre eles neste protótipo.

Foram utilizados os conceitos de orientação a objetos visto na unidade **Programação Orientada a Objetos** fazendo uso da criação de classes, métodos construtores, métodos getters e setters e instância de objetos e execução de métodos na classe App.

Já na unidade de **Banco de Dados** o sistema possui uma database desenvolvida em MySQL onde é possível observar a criação das tabelas Cliente, Serviços e Agendamentos. Também foram colocados exemplos da inserção de dados e suas consultas.

## Descrição dos Modelos

- **Cliente.java**: Contém a classe modelo que representa o cliente do salão, com os atributos e métodos relacionados a ele.
- **Servico.java**: Contém a classe modelo que define os serviços oferecidos pelo salão.
- **Agendamento.java**: Representa o modelo de agendamento, com atributos como data, horário e cliente associado.
- **App.java**: Instância e cria os objetos e executa os metodos.


## Funcionalidades

- Cadastro de Clientes
- Cadastro de Serviços
- Agendamento
- Consulta de Clientes, Serviços e Agendamento


## Tecnologias Utilizadas

| Componente    | Versão  | Finalidade                      |
|---------------|---------|----------------------------------|
| **Java JDK**  | 11+     | Lógica do sistema (POO)         |
| **MySQL**     | 8.0+    | Armazenamento de dados          |
| **VS Code**   | Latest  | Editor de código                |


## Estrutura do Projeto
```
salao-agendamento/
├── java/                        # Código Java (POO)
│   ├── Cliente.java             # Modelo de cliente
│   ├── Servico.java             # Modelo de serviço
│   ├──Agendamento.java          # Modelo de agendamento
│   ├──App.java                  # Instância de objetos e execução dos métodos
├── sql/                         # Scripts de banco de dados
│   ├── schema.sql               # Script de criação do BD
└── README.md                    # Este arquivo

```
