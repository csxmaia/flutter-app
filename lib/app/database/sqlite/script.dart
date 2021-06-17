final createTable = """
  CREATE TABLE secao(
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cor VARCHAR(100) NOT NULL
  )
""";

final insert1 = """
  INSERT INTO secao(nome, cor) VALUES("To Do", "blue")
""";

final insert2 = """
  INSERT INTO secao(nome, cor) VALUES("Doing", "green")
""";

final insert3 = """
  INSERT INTO secao(nome, cor) VALUES("Done", "red")
""";