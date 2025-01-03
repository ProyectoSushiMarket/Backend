import express from "express";
import { config } from "dotenv";
import ruta from "./routes/index.js";
import cors from "cors";
import morgan from "morgan";
import ejs from "ejs";
import { dirname } from 'path';

config();

const __filename = process.cwd();
const __dirname = dirname(__filename);
const server = express();

// Configuración de middlewares
server.use(express.json());
server.use(express.urlencoded({ extended: true }));

// Configuración de CORS
const corsOptions = {
    origin: ['https://siembrafresca.com', 'https://www.siembrafresca.com'], // Dominios permitidos
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'], // Métodos permitidos
    allowedHeaders: ['Content-Type', 'Authorization'], // Encabezados permitidos
    credentials: true // Permitir envío de cookies o credenciales
};
server.use(cors(corsOptions));

// Middleware de registro HTTP
server.use(morgan("dev"));

// Configuración del motor de vistas
server.set("view engine", "ejs");
server.set("port", process.env.PORT || 4100);

// Rutas
server.use("/", ruta);

export default server;
