# salao-agendamento
Protótipo de Sistema de Agendamento de clientes

Sistema independente para gestão de agendamentos em salão de beleza com a Lógica do sistema com modelo POO Java e a estrutura do Banco de Dados com modelo MySQL, sem integração entre eles neste protótipo.

Tecnologias Utilizadas
Componente	/ Versão	/ Finalidade
Java JDK	  /  11+	  /Lógica do sistema (POO)
MySQL	      /8.0+	    /Armazenamento de dados
VS Code	    /Latest	  /Editor de código

Estrutura do Projeto

salao-agendamento/
├── java/                   # Código Java (POO)
│   ├── Cliente.java        # Modelo de cliente
│   ├── Servico.java        # Modelo de serviço
│   └── Agendamento.java    # Modelo de agendamento
├── sql/
│   ├── schema.sql          # Script de criação do BD
└── README.md               # Este arquivo
