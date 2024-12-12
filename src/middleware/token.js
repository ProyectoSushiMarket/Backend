import jwt from "jsonwebtoken";
import { config } from "dotenv";
import { Error, Acceso } from "../message/mensaje.js";
config();

 export const verifytoken = async (req, res, next) => {
    const token = req.headers["x-access-token"];
    if (!token) {
        return Acceso(req, res, 401, "Acceso Denegado");
    }
    
    try {
        const decoded = await jwt.verify(token, process.env.TOKEN_PRIVATEKEY);
        req.usuario = decoded;  // Asigna el objeto decodificado a req.usuario
        
        // Verifica que el valor del usuario esté correcto
        console.log(req.usuario);  

        next();
    } catch (e) {
        Error(req, res, 401, "Falta el acceso del token");
    }
};





