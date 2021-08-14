final deleteAll = "DELETE * FROM secao;";

final dropTable = "DROP TABLE secao;";

final createTable = """
  CREATE TABLE secao(
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cor VARCHAR(100) NOT NULL
  )
""";

final createTarefaTable = """
  CREATE TABLE tarefa(
    id INTEGER NOT NULL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao VARCHAR(100),
    finalizado INTEGER,
    secao_id INTEGER,
    FOREIGN KEY (secao_id) REFERENCES secao (id) ON DELETE CASCADE ON UPDATE NO ACTION
  )
""";

final insert1Tarefa = """
  INSERT INTO tarefa(id, titulo, descricao, finalizado, secao_id) VALUES (1, 'titulo1Tarefa', 'descricao1Tarefa', 1, 1)
""";

final insert1 = """
  INSERT INTO secao(id, nome, cor) VALUES(1, 'To Do', 'blue')
""";

final insert2 = """
  INSERT INTO secao(id, nome, cor) VALUES(2, 'Doing', 'green')
""";

final insert3 = """
  INSERT INTO secao(id, nome, cor) VALUES(3, 'Done', 'red')
""";