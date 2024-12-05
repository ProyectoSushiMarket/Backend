import jwt from "jsonwebtoken"
import { config } from "dotenv"
import { Error, Acceso } from "../message/mensaje.js";
config();

export const verifytoken = async (req, res, next) => {

    const token = req.headers["x-access-token"];
    if(!token) {
        return Acceso (req, res, 401, "Acceso Denegado")
    }
    try {
        const valida = await jwt.verify(
            token, process.env.TOKEN_PRIVATEKEY
        );
        next();
    } catch (e) {
        Error(req, res, 401, "Falta el acceso del token")
    }
}