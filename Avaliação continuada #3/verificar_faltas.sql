CREATE FUNCTION VerificarFaltas() RETURNS TRIGGER AS $$
DECLARE
    total_faltas_injustificadas INT;
BEGIN
    SELECT COUNT(*) INTO total_faltas_injustificadas
    FROM faltas
    WHERE cpf_funcionario = NEW.cpf_funcionario AND justificativa = FALSE;

    IF total_faltas_injustificadas >= 5 THEN
        UPDATE funcionario
        SET ativo = 'N'
        WHERE cpf = NEW.cpf_funcionario;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER VerificarFaltasTrigger
AFTER INSERT ON faltas
FOR EACH ROW execute PROCEDURE VerificarFaltas();
