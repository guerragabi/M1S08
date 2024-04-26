-- Ex1: Crie uma tabela chamada Departamento. A tabela deve conter as seguintes colunas:
-- id (chave primária, tipo serial)
-- nome (texto) - não nulo
-- dataCriacao(data) - não nulo
create table departamento(
	id serial primary key,
	nome varchar(60) not null,
	dataCriacao date not null
)

-- Ex2: Crie uma tabela chamada Funcionarios. A tabela deve conter as seguintes colunas:
-- id (chave primária, tipo serial)
-- nome (texto) - não nulo
-- idade (inteiro) - não nulo
-- cargo (texto) - não nulo
-- salario (decimal) - não nulo
-- idDepartamento (inteiro) - não nulo - chave estrangeira tabela Departamento
create table funcionarios(
	id serial primary key,
	nome varchar(60) not null,
	idade int not null,
	cargo varchar(60) not null,
	salario decimal(8,2) not null,
	idDepartamento int not null, 
	foreign key (idDepartamento) references departamento (id)
)

-- Ex3: Crie três registros na tabela Departamento.
insert into departamento (nome, dataCriacao)
values ('Administrativo', '1990-03-15');
insert into departamento (nome, dataCriacao)
values ('Financeiro', '1990-03-15');
insert into departamento (nome, dataCriacao)
values ('Marketing', '1990-08-02');

-- Ex4: Crie três registros na tabela Funcionarios. Lembre-se de adicionar um idDepartamento válido.
insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Monica Geller', '28', 'Administrador', '2500', '1');
insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Chandler Bing', '30', 'Gerente de Finanças', '3000', '2');
insert into funcionarios (nome, idade, cargo, salario, idDepartamento)
values ('Rachel Green', '29', 'Mídias Sociais', '2500', '3');

-- Ex5: Crie uma consulta usando o JOIN para exibir os dados da tabela Funcionarios junto as 
-- informações da tabela Departamento
select 
f.nome as nomeFuncionario,
f.idade,
f.cargo,
f.salario,
d.nome as nomeDepartamento
from funcionarios as f
inner join departamento as d
on f.idDepartamento = d.id

-- Ex6: Crie um script de update para atualizar um registro na tabela Funcionarios e um 
-- na tabela de Departamento. O dado a ser deve ser o nome do Departamento e a idade do Funcionario
update departamento set nome = 'Marketing Digital' where id = 3
update funcionarios set idade = '31' where id = 2

-- Ex7: Crie um script de delete para remover registros da tabela Funcionarios e Departamento.
-- O delete na tabela Funcionarios deve remover somente o registro na própria tabela. 
-- Porém ao usar o delete na tabela Departamento deve ser removido todos os registros 
-- na tabela Funcionarios que contenha uma referência a chave estrangeira idDepartamento, ou seja, 
-- remover todos os funcionários que foram cadastrados naquele departamento.
delete from funcionarios where idDepartamento = 3
delete from departamento where id = 3

-- Ex8: Crie um script para apagar a tabela Funcionarios e a tabela Departamento.
drop table funcionarios
drop table departamento

