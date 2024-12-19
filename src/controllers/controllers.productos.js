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
    
    const {nombre, unidad_de_medida, disponibilidad, imagen} = req.body;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_CREAR_PRODUCTO(?,?,?,?)`, [nombre, unidad_de_medida, disponibilidad, imagen])
        res.json({"respuesta": "El producto ha sido creado"})
    } catch (error) {
        res.json({"error": "El producto no se pudo crear"})
    }
};
const modificarproducto = async (req, res) => {
    const { nombre } = req.params;  
    const { nombre_nuevo, unidad_de_medida, disponibilidad} = req.body;  

    try {
        const [respuesta] = await basededatos.query(
            `CALL SP_MODIFICAR_PRODUCTO(?, ?, ?, ?)`, 
            [nombre, nombre_nuevo, unidad_de_medida, disponibilidad]
        );

        
        console.log("Respuesta del procedimiento almacenado:", respuesta);

        if (respuesta && respuesta[0]) {
            const resultado = respuesta[0][0]; 
            console.log("Resultado procesado:", resultado);

            if (resultado && resultado.affectedRows > 0) {
                Acceso(req, res, 200, "Producto modificado con éxito");
            } else {
                Error(req, res, 400, "No se pudo modificar el producto, verifique los datos.");
            }
        } else {
            Error(req, res, 500, "Error en la respuesta de la base de datos.");
        }
    } catch (error) {
        console.error("Error al modificar el producto:", error);
        Error(req, res, 500, "Hubo un error al modificar el producto.");
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