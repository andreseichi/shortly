import { Router } from 'express';

import { createUser, signIn } from '../controllers/authController.js';
import { validateCreateUser } from '../middlewares/validateCreateUser.js';
import { validateLogin } from '../middlewares/validateLogin.js';

export const authRouter = Router();

authRouter.post('/signup', validateCreateUser, createUser);
authRouter.post('/signin', validateLogin, signIn);
