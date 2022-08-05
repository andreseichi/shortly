import { connection } from '../databases/postgres.js';

export async function checkUserExist(req, res, next) {
  const { user } = res.locals;

  try {
    const { rows: userDB } = await connection.query(
      `SELECT * FROM users WHERE users.id = $1`,
      [user.id]
    );

    if (userDB.length === 0) {
      return res.status(404).send('User not found');
    }

    next();
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
