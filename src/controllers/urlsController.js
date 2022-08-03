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
