import { Router } from "express";
import { crearusuario, eliminarusuario, listarusuario, modificarusuario, mostrarusuario } from "../controllers/controllers.usuario.js";


const rutausuario = Router();

rutausuario.get("/:id", mostrarusuario);
rutausuario.get("/", listarusuario);
rutausuario.post("/", crearusuario);
rutausuario.put("/:id", modificarusuario);
rutausuario.delete("/:id", eliminarusuario);


export default rutausuario;