const express = require('express');
const mysql = require('mysql');
const app = express();
const PORT = 3000;

// Conexão com o MySQL
const db = mysql.createConnection({
  host: 'db',          // nome do serviço no docker-compose
  user: 'usuario',
  password: 'usuario123',
  multipleStatements: true
});

// Criar o banco e a tabela se não existirem
db.connect(err => {
  if (err) {
    console.error('Erro ao conectar no MySQL:', err.message);
    return;
  }

  const sqlInit = `
    CREATE DATABASE IF NOT EXISTS exemplo;
    USE exemplo;
    CREATE TABLE IF NOT EXISTS pessoas (
      id INT AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(50)
    );
  `;

  db.query(sqlInit, (err) => {
    if (err) {
      console.error('Erro ao criar banco/tabela:', err.message);
    } else {
      console.log('Banco e tabela prontos!');
    }
  });
});

// Inserir uma pessoa
app.get('/inserir', (req, res) => {
  const nome = req.query.nome || 'Fulano';
  const sql = 'INSERT INTO exemplo.pessoas (nome) VALUES (?)';

  db.query(sql, [nome], (err) => {
    if (err) return res.status(500).send('Erro ao inserir: ' + err.message);
    res.send(`Nome ${nome} inserido com sucesso!`);
  });
});

// Listar pessoas
app.get('/listar', (req, res) => {
  const sql = 'SELECT * FROM exemplo.pessoas';

  db.query(sql, (err, results) => {
    if (err) return res.status(500).send('Erro ao listar: ' + err.message);
    res.json(results);
  });
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});