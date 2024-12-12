import { Router } from "express";
import { config } from "dotenv";
import { loginusuario, obtenerDatosUsuario, validartoken } from "../controllers/controllers.login.js";
import { verifytoken } from "../middleware/token.js";

config();

const rutalogin = Router();


rutalogin.post("/loginusuario", loginusuario);
rutalogin.post("/oauth", verifytoken, validartoken);
rutalogin.get("/datosusuario", verifytoken, obtenerDatosUsuario);


export default rutalogin;
