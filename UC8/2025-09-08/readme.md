# Aula 08/09/2025

### Atualizando registros
```sql
UPDATE colaboradores SET peso = 60.0 WHERE nome = 'Maria';
UPDATE colaboradores SET nacionalidade = 'Brasil' WHERE nacionalidade IS NULL;
```

### Removendo registros
```sql
DELETE FROM colaboradores WHERE nome = 'Endrik';
DELETE FROM colaboradores WHERE peso < 60;
```

### Adicionando uma chave primária em cursos
```sql
ALTER TABLE cursos ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
```

### Relacionando colaboradores e cursos (exemplo de tabela de matrícula)
```sql
CREATE TABLE matriculas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    colaborador_id INT,
    curso_id INT,
    data_matricula DATE,
    FOREIGN KEY (colaborador_id) REFERENCES colaboradores(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
) DEFAULT CHARSET = utf8;
```