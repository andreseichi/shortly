import { nanoid } from 'nanoid';

import { connection } from '../databases/postgres.js';

import { urlSchema } from '../schemas/url.js';

export async function shortenUrl(req, res) {
  const { url } = req.body;
  const { user } = res.locals;

  const { error } = urlSchema.validate(req.body);
  if (error) {
    const errorsMessageArray = error.details.map((error) => error.message);

    console.log(errorsMessageArray);
    return res.status(422).send(errorsMessageArray);
  }

  const shortUrl = nanoid(8);

  try {
    await connection.query(
      'INSERT INTO urls (url_link, short_url_link, user_id) VALUES ($1, $2, $3)',
      [url, shortUrl, user.id]
    );

    return res.status(201).send({ shortUrl });
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}

export async function getUrlById(req, res) {
  const { id } = req.params;

  try {
    const { rows: url } = await connection.query(
      'SELECT id, short_url_link AS "shortUrl", url_link AS url FROM urls WHERE id = $1',
      [id]
    );

    if (url.length === 0) {
      return res.status(404).send('Url not found');
    }

    return res.status(200).send(url[0]);
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}

export async function redirectToUrl(req, res) {
  const { shortUrl } = res.locals;
  const { url } = res.locals;

  try {
    await connection.query(
      'UPDATE urls SET visit_count = visit_count + 1 WHERE short_url_link = $1',
      [shortUrl]
    );

    return res.redirect(url);
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}
