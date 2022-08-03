import { Router } from 'express';

import { authentication } from '../middlewares/authentication.js';
import { shortenUrl } from '../controllers/urlsController.js';

export const urlsRouter = Router();

urlsRouter.post('/urls/shorten', authentication, shortenUrl);
