import { Router } from "express";
import { config } from "dotenv";
import { basededatos } from "../config/mysql.database.js";
import { Acceso, Error } from "../message/mensaje.js";
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"
config();

const loginusuario = async(req, res) => {

    const {usuario, contrasena} = req.body;
    console.log(usuario + contrasena);

    try {
        const rol = await basededatos.query(`CALL SP_VERIFICAR_ROLES(?)`, [usuario]);
        const respuesta = await basededatos.query(`CALL SP_BUSCAR_USUARIO(?)`, [usuario]);
        if(respuesta[0][0] == 0) {
            Error(req, res, 404, "El usuario no existe");
            return;
        }

            const match = respuesta[0] && respuesta[0][0] && respuesta[0][0][0] &&
            await bcrypt.compare(contrasena, respuesta[0][0][0].contrasena);

            console.log('respuesta:', (respuesta[0][0][0]));
        if(!match) {
            Error(req, res, 404, "Contrasena Incorrecta");
            return;
        }
        
        let payload = {
            "usuario": respuesta[0][0][0].usuario,
            "contrasena": respuesta[0][0][0].contrasena
        };

        let token = jwt.sign(payload, process.env.TOKEN_PRIVATEKEY,
            {
                expiresIn : process.env.TOKEN_EXPIRES_IN
        });

        if(rol[0][0][0].rol == "Proveedor") {
            Acceso(req, res, 200, {token, "rol": "/principalproveedor"});
        } else if(rol[0][0][0].rol === "Cliente") {
            Acceso(req, res, 200, {token, "rol": "/principalcliente"})
        }

    } catch (e) {
        Error(req, res, 500, "Error en el servidor, Por favor intentarlo mas tarde");
        console.log(e);
        
    }
}

const validartoken = (req, res) => {
    Acceso(req, res, 200, {"token": "El token es valido"});
}
export {
    loginusuario, validartoken
}