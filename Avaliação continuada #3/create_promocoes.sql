CREATE TABLE promocoes (
    id SERIAL PRIMARY KEY,
    nivel INT NOT NULL CHECK (nivel BETWEEN 1 AND 7),
    cpf_funcionario VARCHAR(11) REFERENCES funcionario(cpf),
    cargo VARCHAR(10) NOT NULL,
    data_promocao DATE NOT NULL
);
