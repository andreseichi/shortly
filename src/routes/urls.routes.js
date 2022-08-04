import { Router } from 'express';

import { authentication } from '../middlewares/authentication.js';
import {
  getUrlById,
  redirectToUrl,
  shortenUrl,
} from '../controllers/urlsController.js';
import { checkShortUrl } from '../middlewares/checkShortUrl.js';

export const urlsRouter = Router();

urlsRouter.post('/urls/shorten', authentication, shortenUrl);
urlsRouter.get('/urls/:id', getUrlById);
urlsRouter.get('/urls/open/:shortUrl', checkShortUrl, redirectToUrl);
