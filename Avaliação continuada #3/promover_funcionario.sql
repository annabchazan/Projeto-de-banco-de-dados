CREATE OR REPLACE FUNCTION 
	PromoverFuncionario(cpf_input VARCHAR, novo_nivel INT)
RETURNS VOID AS $$
DECLARE
    nivel_atual INT := 0;
    data_ultima_promocao DATE := NULL;
    cargo_funcionario VARCHAR(10);
    anos_desde_ultima INT;
BEGIN
    SELECT cargo INTO cargo_funcionario
    FROM funcionario
    WHERE cpf = cpf_input;

    IF NOT FOUND THEN
        RAISE NOTICE 'Nenhum funcionário encontrado';
        RETURN;
    END IF;
    
    SELECT nivel, data_promocao INTO nivel_atual, data_ultima_promocao
    FROM promocoes
    WHERE cpf_funcionario = cpf_input
    ORDER BY data_promocao DESC
    LIMIT 1;

    IF NOT FOUND THEN
        RAISE NOTICE 'Ainda não teve promoção';
        nivel_atual := 0;
        data_ultima_promocao := current_date - INTERVAL '3 years';
    END IF;

    IF novo_nivel <> nivel_atual + 1 THEN
        RAISE NOTICE 'Não é permitido pular níveis';
        RETURN;
    END IF;
    anos_desde_ultima := EXTRACT(YEAR FROM age(current_date, data_ultima_promocao));

    IF anos_desde_ultima < 3 THEN
        RAISE NOTICE 'Não é possível realizar promoções em um intervalo menor que 3 anos';
        RETURN;
    END IF;

    INSERT INTO promocoes (cpf_funcionario, cargo, nivel, data_promocao)
    VALUES (cpf_input, cargo_funcionario, novo_nivel, current_date);

    RAISE NOTICE 'Promoção realizada com sucesso';
END;
$$ LANGUAGE plpgsql;
