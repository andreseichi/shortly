import { connection } from '../databases/postgres.js';

export async function validateShortUrl(req, res, next) {
  const { id } = req.params;
  const { user } = res.locals;

  try {
    const { rows: url } = await connection.query(
      `SELECT urls.id AS url_id, sessions.token 
      FROM urls 
      JOIN sessions ON sessions.user_id = urls.user_id 
      WHERE urls.id = $1`,
      [id]
    );

    if (url.length === 0) {
      return res.status(404).send('Url not found');
    }

    if (url.token !== user.token) {
      return res.status(401).send('Unauthorized');
    }

    res.locals.url = url[0];

    next();
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
