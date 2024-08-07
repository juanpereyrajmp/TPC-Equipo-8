﻿using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TPC_Equipo_8.Dominio;

namespace TPC_Equipo_8.Manager
{
    public class UsuarioManager
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_Loguear");
                datos.setearParametro("@Email", usuario.email);
                datos.setearParametro("@Pass", usuario.pass);
                datos.ejecutarLectura();




                while (datos.Lector.Read())
                {
                    usuario.idUsuario = (int)datos.Lector["IdUsuario"];
                    usuario.Username = (string)datos.Lector["Username"];

                    int rol = (int)datos.Lector["IdRol"];

                    switch (rol)
                    {
                        case 1:
                            usuario.TipoUsuario = TipoUsuario.ADMIN;
                            break;

                        case 2:
                            usuario.TipoUsuario = TipoUsuario.DONANTE;
                            break;

                        case 3:
                            usuario.TipoUsuario = TipoUsuario.FILIAL;
                            break;

                    }


                    return true; 
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void insertarNuevo(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_Registro");
                datos.setearParametro("@Username", nuevo.Username);
                datos.setearParametro("@Email", nuevo.email);
                datos.setearParametro("@Pass", nuevo.pass);
                datos.setearParametro("@Dni", nuevo.dni);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
            
        }

        
        public void RegistrarFilial(Filial nueva) 
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_RegistroFilial");
                datos.setearParametro("@Nombre", nueva.nombre);
                datos.setearParametro("@Telefono", nueva.telefono);
                datos.setearParametro("@Provincia", nueva.direccion.provincia);
                datos.setearParametro("@Ciudad", nueva.direccion.ciudad);
                datos.setearParametro("@Localidad", nueva.direccion.localidad);
                datos.setearParametro("@CodigoPostal", nueva.direccion.codigoPostal);
                datos.setearParametro("@Calle", nueva.direccion.calle);
                datos.setearParametro("@Altura", nueva.direccion.altura);
                datos.setearParametro("@Email", nueva.email);
                datos.setearParametro("@Pass", nueva.pass);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        

    }
}