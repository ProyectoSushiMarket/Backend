import jwt from 'jsonwebtoken';
import { config } from 'dotenv';
import { Error, Acceso } from '../message/mensaje.js';
config();

export const verifytoken = async (req, res, next) => {
  const token = req.headers['x-access-token'];  

  if (!token) {
    console.error('Token no proporcionado');
    return Acceso(req, res, 401, 'Acceso Denegado');
  }

  try {
    
    const decoded = await jwt.verify(token, process.env.TOKEN_PRIVATEKEY);

    
    req.usuario = decoded;

    
    console.log('Token decodificado correctamente:', req.usuario);

    
    next();
  } catch (e) {
    console.error('Error al verificar el token:', e.message);
    return Error(req, res, 401, 'Falta el acceso del token');
  }
};
