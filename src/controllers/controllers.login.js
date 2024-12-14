import { Router } from "express";
import { config } from "dotenv";
import { basededatos } from "../config/mysql.database.js";
import { Acceso, Error } from "../message/mensaje.js";
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"
config();


const loginusuario = async (req, res) => {
    const { usuario, contrasena } = req.body;
    console.log(usuario + contrasena);

    try {
        const rol = await basededatos.query(`CALL SP_VERIFICAR_ROLES(?)`, [usuario]);
        const respuesta = await basededatos.query(`CALL SP_BUSCAR_USUARIO(?)`, [usuario]);
        
        if (respuesta[0][0] == 0) {
            Error(req, res, 404, "El usuario no existe");
            return;
        }

        const match = respuesta[0] && respuesta[0][0] && respuesta[0][0][0] &&
            await bcrypt.compare(contrasena, respuesta[0][0][0].contrasena);

        console.log('respuesta:', (respuesta[0][0][0]));

        if (!match) {
            Error(req, res, 404, "Contraseña Incorrecta");
            return;
        }

        
        let payload = {
            id_usuario: respuesta[0][0][0].id_usuario, 
            usuario: respuesta[0][0][0].usuario,     
            contrasena: respuesta[0][0][0].contrasena, 
            rol: rol[0][0][0].rol                   
        };

        let token = jwt.sign(payload, process.env.TOKEN_PRIVATEKEY, {
            expiresIn: process.env.TOKEN_EXPIRES_IN
        });

        
        if (rol[0][0][0].rol == "Proveedor") {
            Acceso(req, res, 200, { token, "rol": "/principalproveedor" });
        } else if (rol[0][0][0].rol === "Cliente") {
            Acceso(req, res, 200, { token, "rol": "/principalcliente" });
        }

    } catch (e) {
        Error(req, res, 500, "Error en el servidor, por favor intentalo más tarde");
        console.log(e);
    }
}

const validartoken = (req, res) => {
    Acceso(req, res, 200, {"token": "El token es valido"});
}

const obtenerDatosUsuario = async (req, res) => {
    
    const usuarioId = req.usuario.id_usuario;  

    try {
        
        const [respuesta] = await basededatos.query(`SELECT id_usuario, nombre, rol FROM usuarios WHERE id_usuario = ?;`, [usuarioId]);
        
        if (respuesta.length === 0) {
            return res.status(404).json({ error: "Usuario no encontrado" });
        }

        
        const usuario = respuesta[0]; 
        
       
        res.json({
            id_usuario: usuario.id_usuario,
            nombre: usuario.nombre,
            rol: usuario.rol
        });
    } catch (error) {
        console.error("Error al obtener los datos del usuario:", error);
        res.status(500).json({ error: "Error en el servidor" });
    }
};




export {
    loginusuario, validartoken, obtenerDatosUsuario
}