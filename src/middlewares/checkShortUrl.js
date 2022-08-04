import { connection } from '../databases/postgres.js';

export async function checkShortUrl(req, res, next) {
  const { shortUrl } = req.params;

  try {
    const { rows: url } = await connection.query(
      'SELECT url_link AS url FROM urls WHERE short_url_link = $1',
      [shortUrl]
    );

    if (url.length === 0) {
      return res.status(404).send('Url not found');
    }

    res.locals.shortUrl = shortUrl;
    res.locals.url = url[0].url;

    next();

    // return res.redirect(url[0].url);
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
