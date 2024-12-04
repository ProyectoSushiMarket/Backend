import { Router } from "express";
import { crearcliente, eliminarcliente, listarcliente, modificarcliente, mostrarcliente } from "../controllers/controllers.clientes.js";

const rutacliente = Router();

rutacliente.get("/", mostrarcliente);
rutacliente.get("/", listarcliente);
rutacliente.post("/", crearcliente);
rutacliente.put("/", modificarcliente);
rutacliente.delete("/", eliminarcliente)


export default rutacliente;