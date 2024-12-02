import { Router } from "express";
import { listarusuario, mostrarusuario } from "../controllers/controllers.usuario";

const rutausuario = Router();

rutausuario.get("/:id", mostrarusuario)
rutausuario.get("/usuario", listarusuario)


export default rutausuario;