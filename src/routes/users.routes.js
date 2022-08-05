import { Router } from 'express';
import { getUserInfo } from '../controllers/usersController.js';
import { authentication } from '../middlewares/authentication.js';
import { checkUserExist } from '../middlewares/checkUserExist.js';

export const usersRouter = Router();

usersRouter.get('/users/me', authentication, checkUserExist, getUserInfo);
