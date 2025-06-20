CREATE TABLE faltas (
    id SERIAL PRIMARY KEY,
    justificativa BOOLEAN DEFAULT FALSE
    cpf_funcionario VARCHAR(11) REFERENCES funcionario(cpf),
    data_falta DATE NOT NULL,
);
