# Hospital Database

Bem-vindo ao centro de organização da migração dos dados do Hospital Albert Einstein para o banco de dados. A seguir, estão as etapas seguidas no processo de migração dos dados, com detalhes de cada fase.

## 1. Migração Inicial

### Dados

O hospital necessita de um sistema para a área clínica que ajude a controlar consultas realizadas. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades (pediatria, clínica geral, gastroenterologia e dermatologia). Alguns registros antigos ainda estão em formulários de papel, e será necessário incluí-los no novo sistema.
Os pacientes precisam de cadastro, contendo: nome, data de nascimento, endereço, telefone, e-mail, CPF e RG. Cada paciente pode estar vinculado a um convênio (nome, CNPJ, tempo de carência).
As consultas são registradas com data e hora, médico responsável, paciente, valor da consulta ou nome do convênio (com o número da carteira). Também é necessário indicar a especialidade buscada pelo paciente.
O sistema deve permitir que, ao encerrar uma consulta, o médico registre a receita médica, incluindo os medicamentos receitados, quantidade e instruções de uso. A partir disso, o sistema deve permitir imprimir ou visualizar a receita online.

### Resultado Esperado


## 2. Migração de Internações

### Dados
No hospital, as internações têm sido registradas por meio de formulários eletrônicos que gravam os dados em arquivos. 
Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados. 
As internações precisam ser vinculadas a quartos, com a numeração e o tipo. 
Cada tipo de quarto tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).
Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (COREN).
A internação, obviamente, é vinculada a um paciente – que pode se internar mais de uma vez no hospital – e a um único médico responsável.

### Resultado Esperado