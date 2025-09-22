create database LocadoraVeiculos; 
use LocadoraVeiculos; 

-- Tabela cliente 

create table Cliente ( 
idCliente int primary key, 
    cpf varchar(20) not null, 
    nome varchar(50) not null, 
    telefone varchar(50) not null, 
    email varchar(50) not null, 
    endereco varchar(100) not null 
); 

-- Tabela Pagamento 

create table Pagamento ( 
idPagamento int primary key, 
    forma enum ('Cartao', 'PIX', 'Dinheiro') not null, 
    dataPagamento date not null, 
    valorTotal decimal (7,2) not null, 
    estado enum ('Pago', 'Pendente') not null 
); 

-- Tabela Locacao 

create table Locacao ( 

idLocacao int primary key, 
    idCliente int not null, 
    idPagamento int not null, 
    dataInicio date not null, 
    dataFim date not null, 
    constraint fkLocacaoCliente foreign key(idCliente) references Cliente(idCliente), 
    constraint fkLocacaoPagamento foreign key(idPagamento) references Pagamento(idPagamento)     
); 

-- Tabela Veiculo 
  
create table Veiculo( 
idVeiculo int primary key, 
    modelo varchar(50) not null, 
    marca varchar(50) not null, 
    ano int not null, 
    placa varchar(10) not null, 
    valorDiaria decimal (7,2) not null, 
    estado enum ('Disponivel', 'Alugado', 'Manutencao') not null 
); 

-- Tabela Manutencao 

  

create table Manutencao( 
idManutencao int primary key, 
    idVeiculo int not null, 
    descricao varchar(100) not null, 
    dataManutencao date not null, 
    custo decimal(7,2) not null, 
    constraint fkManutencaoVeiculo foreign key(idVeiculo) references Veiculo(idVeiculo) 
); 

  

-- Tabela LocacaoVeiculo 

create table LocacaoVeiculo ( 
    idLocacao int not null, 
    idVeiculo int not null, 
    primary key (idLocacao, idVeiculo), 
    constraint fkLocacao foreign key (idLocacao) references Locacao(idLocacao), 
    constraint fkVeiculo foreign key (idVeiculo) references Veiculo(idVeiculo) 
); 