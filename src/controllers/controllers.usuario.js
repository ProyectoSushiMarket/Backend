import { basededatos} from "../config/mysql.database.js";
import { config } from "dotenv";
import bcrypt from "bcrypt"
import { Acceso, Error } from "../message/mensaje.js";
config();

export const mostrarusuario = async (req, res) => {

    const { id } = req.params;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_MOSTRAR_USUARIO(?)`, [id]);
        if (respuesta && respuesta.length > 0) {
            res.json(respuesta[0]);
        } else {
            res.status(404).json({ message: "Usuario no encontrado" });
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
export const listarusuario = async (req, res) => {
    try {
        const [respuesta] = await basededatos.query(`CALL SP_LISTAR_USUARIO()`);
        res.json(respuesta[0]);
    } catch (error) {
        res.json({"error": error})
    }
}
export const crearusuario = async (req, res) => {

    const {nombre, usuario, rol } = req.body;
    const contrasenasincifrar = req.body.contrasena;

    try {
        const hash = await bcrypt.hash(contrasenasincifrar, 2)
        const contrasena = hash;
        const respuesta = await basededatos.query(`CALL SP_CREAR_USUARIO (?,?,?,?)`, [nombre, usuario, contrasena, rol]);
        res.json({"respuesta":"El usuario ha sido creado"})
    } catch (error) {
        console.log(error);

    }
}
export const modificarusuario = async (req, res) => {

    const {id} = req.params;
    const {nombre, usuario, rol} = req.body;
    const contrasenasincifrar = req.body.contrasena;
    const contrasena = await bcrypt.hash(contrasenasincifrar, 2);

    try {
        const respuesta = await basededatos.query(`CALL SP_MODIFICAR_USUARIO (?,?,?,?,?)`,[id,nombre, usuario, contrasena, rol]);

        const resultado = respuesta[0];

        if (resultado.affectedRows == 1) {
            Acceso(req, res, 201, "Usuario Modificado");
        } else {
            Error(req, res, 400, "No se pudo modificar el usuario");
        }

    } catch (error) {
        Error(req, res, 400, error)
    }
}
export const eliminarusuario = async (req, res) => {

    const {id} = req.body;

    try {
        const respuesta = await basededatos.query(`CALL SP_ELIMINAR_USUARIO (?)`, [id])
        res.json({"respuesta": "Usuario Eliminado"})
    } catch (error) {
        res.json({"respuesta": "El usuario no se pudo eliminar"})
    }
}
