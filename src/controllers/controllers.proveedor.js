import { basededatos} from "../config/mysql.database.js";
import { config } from "dotenv";
import bcrypt from "bcrypt"
import { Acceso, Error } from "../message/mensaje.js";
config();

const mostrarproveedor = async (req, res) => {

    const { id } = req.params;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_MOSTRAR_PROVEEDOR(?)`, [id]);
        if (respuesta && respuesta.length > 0) {
            res.json(respuesta[0]);
        } else {
            res.status(404).json({ message: "Usuario no encontrado" });
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
const listarproveedor = async (req, res) => {
    
    try {
        const [respuesta] = await basededatos.query(`CALL SP_LISTAR_PROVEEDOR()`);
        res.json(respuesta[0]);
    } catch (error) {
        res.json({"error": error})
    }
}
const crearproveedor = async (req, res) => {

    const {nombre, usuario, rol } = req.body;
    const contrasenasincifrar = req.body.contrasena;

    try {
        const hash = await bcrypt.hash(contrasenasincifrar, 2)
        const contrasena = hash;
        const respuesta = await basededatos.query(`CALL SP_CREAR_PROVEEDOR (?,?,?,?)`, [nombre, usuario, contrasena, rol]);
        res.json({"respuesta":"El usuario ha sido creado"})
    } catch (error) {
        console.log(error);

    }
}
const modificarproveedor = async (req, res) => {

    const {id} = req.body;
    const {nombre, usuario, rol} = req.body;
    const contrasenasincifrar = req.body.contrasena;
    const contrasena = await bcrypt.hash(contrasenasincifrar, 2);

    try {
        const respuesta = await basededatos.query(`CALL SP_MODIFICAR_PROVEEDOR (?,?,?,?,?)`,[id,nombre, usuario, contrasena, rol]);

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
const eliminarproveedor = async (req, res) => {

    const {id} = req.body;

    try {
        const respuesta = await basededatos.query(`CALL SP_ELIMINAR_PROVEEDOR (?)`, [id])
        res.json({"respuesta": "Usuario Eliminado"})
    } catch (error) {
        res.json({"respuesta": "El usuario no se pudo eliminar"})
    }
}
export {
    mostrarproveedor, listarproveedor, crearproveedor, modificarproveedor, eliminarproveedor
}
