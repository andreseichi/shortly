import { connection } from '../databases/postgres.js';

export async function authentication(req, res, next) {
  const { authorization } = req.headers;

  const token = authorization?.replace('Bearer ', '');

  if (!token) {
    return res.sendStatus(401);
  }

  try {
    const { rows: user } = await connection.query(
      `SELECT users.name, users.email FROM SESSIONS 
      JOIN USERS ON sessions.user_id = users.id 
      WHERE sessions.token = $1`,
      [token]
    );

    if (!user[0]) {
      return res.sendStatus(401);
    }

    res.locals.user = user;

    next();
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
