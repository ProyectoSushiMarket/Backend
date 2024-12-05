import { Router } from "express";
import { config } from "dotenv";
import { loginusuario, validartoken } from "../controllers/controllers.login.js";
import { verifytoken } from "../middleware/token.js";
config();

const rutalogin = Router();

rutalogin.post("/loginusuario", loginusuario);
rutalogin.post("/oauth", verifytoken, validartoken);

export default rutalogin;