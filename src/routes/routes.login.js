import { Router } from "express";
import { config } from "dotenv";
import { loginusuario, obtenerDatosUsuario, validartoken } from "../controllers/controllers.login.js";
import { verifytoken } from "../middleware/token.js";

config();

const rutalogin = Router();

// Ruta de login
rutalogin.post("/loginusuario", loginusuario);

// Ruta para validar el token y devolver los datos del usuario
rutalogin.post("/oauth", verifytoken, validartoken);

// Ruta para obtener los datos del usuario autenticado
rutalogin.get("/datosusuario", verifytoken, obtenerDatosUsuario);

export default rutalogin;
