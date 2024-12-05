import { Router } from "express";
import { crearproveedor, eliminarproveedor, listarproveedor, modificarproveedor, mostrarproveedor } from "../controllers/controllers.proveedor.js";


const rutaproveedor = Router();

rutaproveedor.get("/:id", mostrarproveedor);
rutaproveedor.get("/", listarproveedor);
rutaproveedor.post("/", crearproveedor);
rutaproveedor.put("/", modificarproveedor);
rutaproveedor.delete("/", eliminarproveedor);


export default rutaproveedor;