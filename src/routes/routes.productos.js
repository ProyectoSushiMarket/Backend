import { Router } from "express";
import { crearproducto, eliminarproducto, listarproducto, modificarproducto, mostrarproducto } from "../controllers/controllers.productos.js";

const rutaproducto = Router();

rutaproducto.get("/:id", mostrarproducto)
rutaproducto.get("/", listarproducto)
rutaproducto.post("/", crearproducto)
rutaproducto.put("/", modificarproducto)
rutaproducto.delete("/", eliminarproducto)

export default rutaproducto;