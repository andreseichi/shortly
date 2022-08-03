import bcrypt from 'bcrypt';
import { connection } from '../databases/postgres.js';

export async function createUser(req, res) {
  const { user } = res.locals;
  const { password } = user;

  const passwordEncrypted = await bcrypt.hash(password, 10);

  try {
    await connection.query(
      'INSERT INTO users (name, email, password) VALUES ($1, $2, $3)',
      [user.name, user.email, passwordEncrypted]
    );

    res.sendStatus(201);
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
