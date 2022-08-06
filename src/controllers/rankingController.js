import { connection } from '../databases/postgres.js';

export async function getRanking(req, res) {
  try {
    const { rows: ranking } = await connection.query(
      `SELECT users.id, users.name, COUNT(urls.url_link) AS "linksCount", 
      COALESCE(SUM(urls.visit_count),0 ) AS "visitCount"
      FROM users LEFT JOIN urls ON urls.user_id = users.id 
      GROUP BY users.id 
      ORDER BY "visitCount" DESC
      LIMIT 10`
    );

    return res.send(ranking);
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
