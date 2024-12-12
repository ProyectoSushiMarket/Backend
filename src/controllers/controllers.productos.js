import { basededatos } from "../config/mysql.database.js";
import { config } from "dotenv";
import { Acceso, Error } from "../message/mensaje.js";
config();


const mostrarproducto = async (req, res) => {

    const {id} = req.params;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_MOSTRAR_PRODUCTO(?)`, [id]);
        if (respuesta && respuesta.length > 0) {
            res.json(respuesta[0]);
        } else {
            res.status(404).json({ message: "Usuario no encontrado" });
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
const listarproducto = async (req, res) => {

    try {
        const [respuesta] = await basededatos.query(`CALL SP_LISTAR_PRODUCTO()`)
        res.json(respuesta[0])
    } catch (error) {
        res.json({"error": error})
    }
};
const crearproducto = async (req, res) => {
    
    const {nombre, imagen} = req.body;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_CREAR_PRODUCTO(?,?)`, [nombre, imagen])
        res.json({"respuesta": "El producto ha sido creado"})
    } catch (error) {
        res.json({"error": "El producto no se pudo crear"})
    }
};
const modificarproducto = async (req, res) => {

    const {id} = req.params
    const {nombre, imagen} = req.body;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_MODIFICAR_PRODUCTO (?,?,?)`,[id,nombre, imagen]);

        const resultado = respuesta[0];

        if (resultado.affectedRows == 1) {
            Acceso(req, res, 201, "Producto Modificado");
        } else {
            Error(req, res, 400, "No se pudo modificar el producto");
        }

    } catch (error) {
        Error(req, res, 400, error)
    }
};
const eliminarproducto = async (req, res) => {

    const {nombre} = req.params;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_ELIMINAR_PRODUCTO(?)`, [nombre])
        res.json({"respuesta": "El producto ha sido eliminado"})
    } catch (error) {
        res.json({"respuesta": "El Producto no se pudo eliminar"})
    } 
};
export {
    mostrarproducto, listarproducto, crearproducto, modificarproducto, eliminarproducto
}