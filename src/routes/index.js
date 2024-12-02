import { Router } from "express";
import rutausuario from "./routes.usuario";

const ruta = Router();

ruta.use("/usuario", rutausuario);

export default ruta;