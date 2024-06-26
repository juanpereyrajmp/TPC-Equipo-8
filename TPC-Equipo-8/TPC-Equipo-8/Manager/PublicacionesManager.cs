﻿using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TPC_Equipo_8.Dominio;

namespace TPC_Equipo_8.Manager
{
    public class PublicacionesManager
    {
        public AccesoDatos datos = new AccesoDatos();

        public List<Publicacion> ListarPublicaciones(int idFilial = -1, bool soloActivas = false)
        {

            List<Publicacion> lista = new List<Publicacion>();

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_ListarPublicaciones");
                datos.setearParametro("@IdFilial", idFilial);
                datos.setearParametro("@SoloActivas", soloActivas);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Publicacion aux = new Publicacion();

                    aux.idPublicacion = (int)datos.Lector["IdPublicacion"];
                    aux.filial = (string)datos.Lector["NombreFilial"];

                    if (!Convert.IsDBNull(datos.Lector["NombreReceptor"]))
                    {
                        aux.nombreReceptor = (string)datos.Lector["NombreReceptor"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Grupo"]))
                    {
                        aux.grupoSanguineo = (string)datos.Lector["Grupo"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["PosiblesDonantes"]))
                    {
                        aux.posiblesDonantes = (string)datos.Lector["PosiblesDonantes"];
                    }

                    aux.urgencia = (string)datos.Lector["DescripcionUrgencia"];

                    if (!Convert.IsDBNull(datos.Lector["DonantesNecesarios"]))
                    {
                        aux.donantesNecesarios = (int)(datos.Lector["DonantesNecesarios"]);
                    }

                    if (!Convert.IsDBNull(datos.Lector["Horario"]))
                    {
                        aux.horarios = (string)datos.Lector["Horario"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["FechaLimite"]))
                    {
                        aux.fechaLimite = (DateTime)datos.Lector["FechaLimite"];
                    }
                    
                    aux.estado = (bool)datos.Lector["Estado"];

                    lista.Add(aux);
                }
                return lista;
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

        public List<Publicacion> RecargarPublicaciones(int idFilial = -1, bool soloActivas = true)
        {
            return ListarPublicaciones(idFilial, soloActivas);
        }


        public List<Publicacion> ListarUnaPublicacion(int idPublicacion)
        {

            List<Publicacion> lista = new List<Publicacion>();

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_ObtenerUnaPublicacionPorId");

               datos.setearParametro("@IdPublicacion", idPublicacion);

               datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Publicacion aux = new Publicacion();

                    aux.idPublicacion = (int)datos.Lector["IdPublicacion"];
                    aux.filial = (string)datos.Lector["NombreFilial"];

                    if (!Convert.IsDBNull(datos.Lector["NombreReceptor"]))
                    {
                        aux.nombreReceptor = (string)datos.Lector["NombreReceptor"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["Grupo"]))
                    {
                        aux.grupoSanguineo = (string)datos.Lector["Grupo"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["DonantesNecesarios"]))
                    {
                        aux.donantesNecesarios = (int)datos.Lector["DonantesNecesarios"];
                    }

                    aux.urgencia = (string)datos.Lector["Urgencia"];

                 
                    if (!Convert.IsDBNull(datos.Lector["Horario"]))
                    {
                        aux.horarios = (string)datos.Lector["Horario"];
                    }

                    if (!Convert.IsDBNull(datos.Lector["FechaLimite"]))
                    {
                        aux.fechaLimite = (DateTime)datos.Lector["FechaLimite"];
                    }

                    aux.estado = (bool)datos.Lector["Estado"];

                    lista.Add(aux);
                }
                return lista;
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



        public void AgregarPublicacion(Publicacion publicacion)
        {
            
            int idFilial = int.Parse(publicacion.filial);
            int idGrupoSanguineo = int.Parse(publicacion.grupoSanguineo);
            int idUrgencia = int.Parse(publicacion.urgencia);



            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_AgregarPublicacion");
                datos.setearParametro("@IdFilial", idFilial);
                datos.setearParametro("@NombreReceptor", publicacion.nombreReceptor);
                datos.setearParametro("@IdGrupoSanguineo", idGrupoSanguineo);
                datos.setearParametro("@IdUrgencia", idUrgencia);
                datos.setearParametro("@DonantesNecesarios", publicacion.donantesNecesarios);
                datos.setearParametro("@Horario", publicacion.horarios);
                datos.setearParametro("@FechaLimite", publicacion.fechaLimite);
                datos.setearParametro("@Estado", publicacion.estado);

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


        public void ModificarPublicacion(Publicacion publicacion)
        {

            int idGrupoSanguineo = int.Parse(publicacion.grupoSanguineo);
            int idUrgencia = int.Parse(publicacion.urgencia);

            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_ModificarPublicacion");
                datos.setearParametro("@IdPublicacion", publicacion.idPublicacion);
                datos.setearParametro("@NombreReceptor", publicacion.nombreReceptor);
                datos.setearParametro("@IdGrupoSanguineo", idGrupoSanguineo);
                datos.setearParametro("@IdUrgencia", idUrgencia);
                datos.setearParametro("@DonantesNecesarios", publicacion.donantesNecesarios);
                datos.setearParametro("@Horario", publicacion.horarios);
                datos.setearParametro("@FechaLimite", publicacion.fechaLimite);
                datos.setearParametro("@Estado", publicacion.estado);

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

        public void DesactivarPublicacion(int idPublicacion)
        {
            try
            {
                datos.comando.Parameters.Clear();
                datos.setearProcedimiento("SP_DesactivarPublicacion");
                datos.setearParametro("@IdPublicacion", idPublicacion);
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