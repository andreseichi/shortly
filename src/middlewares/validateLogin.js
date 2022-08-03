import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

import { connection } from '../databases/postgres.js';
import { signInSchema } from '../schemas/signInSchema.js';

export async function validateLogin(req, res, next) {
  const login = req.body;
  const { password } = login;

  const { error } = signInSchema.validate(login, { abortEarly: false });

  if (error) {
    const errorsMessageArray = error.details.map((error) => error.message);

    console.log(errorsMessageArray);
    return res.status(422).send(errorsMessageArray);
  }

  try {
    const { rows } = await connection.query(
      'SELECT * FROM users WHERE email = $1',
      [login.email]
    );
    const userDB = rows[0];

    if (userDB && bcrypt.compareSync(password, userDB.password)) {
      const { rows } = await connection.query(
        'SELECT * FROM sessions WHERE user_id = $1',
        [userDB.id]
      );
      const sessionDB = rows[0];

      const token = uuid();
      if (sessionDB) {
        await connection.query(
          'UPDATE sessions SET token = $1, created_at = $2 WHERE user_id = $3',
          [token, new Date(), userDB.id]
        );
      }
      const user = {
        token,
        name: userDB.name,
      };

      res.locals.user = user;

      next();
    } else {
      return res.status(401).send('Usuário ou senha incorretos');
    }
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
