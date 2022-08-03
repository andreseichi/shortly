import { Router } from 'express';

import { createUser } from '../controllers/authController.js';
import { validateCreateUser } from '../middlewares/validateCreateUser.js';

export const authRouter = Router();

authRouter.post('/signup', validateCreateUser, createUser);
