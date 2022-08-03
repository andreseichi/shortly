CREATE DATABASE "shortly";
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
);
INSERT INTO users(name, email, password)
VALUES('test', 'teste@teste.com', 'password'),
  ('test2', 'teste2@teste.com', 'password2');
CREATE TABLE sessions(
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES "users"("id"),
  token TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);