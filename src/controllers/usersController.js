import { connection } from '../databases/postgres.js';

export async function getUserInfo(req, res) {
  const { user } = res.locals;

  try {
    const { rows } = await connection.query(
      `SELECT users.id AS user_id, users.name, urls.id AS url_id, 
      urls.url_link, urls.short_url_link, urls.visit_count 
      FROM users JOIN urls ON urls.user_id = users.id 
      WHERE users.id = $1`,
      [user.id]
    );

    const shortenedUrlsArray = rows
      .map((row) => {
        return {
          id: row.url_id,
          shortUrl: row.short_url_link,
          url: row.url_link,
          visitCount: row.visit_count,
        };
      })
      .sort((a, b) => a.id - b.id);
    const visitCountTotal = shortenedUrlsArray.reduce((acc, curr) => {
      return acc + curr.visitCount;
    }, 0);

    const userInfo = {
      id: user.id,
      name: user.name,
      visitCount: visitCountTotal,
      shortenedUrls: shortenedUrlsArray,
    };

    return res.send(userInfo);
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
