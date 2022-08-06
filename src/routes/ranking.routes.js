import { Router } from 'express';
import { getRanking } from '../controllers/rankingController.js';

export const rankingRouter = Router();

rankingRouter.get('/ranking', getRanking);
