import { Router } from "express";
import { crearproducto, eliminarproducto, listarproducto, modificarproducto, mostrarproducto } from "../controllers/controllers.productos.js";

const rutaproducto = Router();

rutaproducto.get("/:id", mostrarproducto)
rutaproducto.get("/", listarproducto)
rutaproducto.post("/", crearproducto)
rutaproducto.put("/:id", modificarproducto)
rutaproducto.delete("/:id", eliminarproducto)

export default rutaproducto;