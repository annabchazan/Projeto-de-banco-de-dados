CREATE OR REPLACE FUNCTION 
  DiminuirSalario(cpf_user varchar, percentual int)
RETURNS void AS $$
BEGIN
  UPDATE funcionario
  SET salario = salario - (salario * percentual / 100.0)
  WHERE cpf = cpf_user;
END;
$$ LANGUAGE plpgsql;
