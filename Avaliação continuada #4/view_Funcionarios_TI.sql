CREATE VIEW Funcionarios_TI
as SELECT id_funcionario, nome, salario
FROM Funcionarios
WHERE   departamento = 'TI' AND salario > 5000;