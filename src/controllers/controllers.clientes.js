import { basededatos } from "../config/mysql.database.js";
import { config } from "dotenv";
import bcrypt from "bcrypt"
import { Acceso, Error } from "../message/mensaje.js";
config();

const mostrarcliente = async (req, res) => {

    const {idcliente} = req.body;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_MOSTRAR_CLIENTE(?)`, [idcliente]);
        if (respuesta && respuesta.length > 0) {
            res.json(respuesta[0]);
        } else {
            res.status(404).json({ message: "Usuario no encontrado" });
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
const listarcliente = async (req, res) => {

    try {
        const [respuesta] = await basededatos.query(`CALL SP_LISTAR_CLIENTE()`);
        res.json(respuesta[0]);
    } catch (error) {
        res.json({"error": error})
    }
}
const crearcliente = async (req, res) => {

    const {usuario, rol} = req.body;
    const contrasenasincifrar = req.body.contrasena;

    try {
       const hash = await bcrypt.hash(contrasenasincifrar, 2)
       const contrasena = hash;
       const [respuesta] = await basededatos.query(`CALL SP_CREAR_CLIENTE(?,?,?)`,[usuario, contrasena, rol]);
        res.json({"respuesta": "El cliente ha sido creado"})
    } catch (error) {
        res.json({"Error":"El cliente no se pudo crear"})
    }
}
const modificarcliente = async (req, res) => {

    const {idcliente, usuario} = req.body;
    const contrasenasincifrar = req.body.contrasena;
    const contrasena = await bcrypt.hash(contrasenasincifrar, 2);

    try {
        const [respuesta] = await basededatos.query(`CALL SP_MODIFICAR_CLIENTE(?,?,?)`, [idcliente, usuario, contrasena]);

        if (respuesta[0].affectedRows == 1){
            Acceso(req, res, 201,"Cliente modificado");
        }else{
            Error(req, res, 400, "No se pudo modificar el cliente");    
        }
    } catch (error) {
       Error(req, res, 400, error); 
    }
}
const eliminarcliente = async (req, res) => {

    const {idcliente} = req.body;

    try {
     const [respuesta] = await basededatos.query(`CALL SP_ELIMINAR_CLIENTE(?)`, [idcliente]);
        res.json({"respuesta": "El cliente ha sido eliminado"})   
    } catch (error) {
        res.json({"Error": "El usuario no se pudo eliminar"})
    }
}
export {
    mostrarcliente, listarcliente, crearcliente, modificarcliente, eliminarcliente
}