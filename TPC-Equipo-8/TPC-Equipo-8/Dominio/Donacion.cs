﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPC_Equipo_8.Dominio
{
    public class Donacion
    {
        public string nombre { get; set; }
        public string apellido { get; set; }
        public DateTime fechaRealizada { get; set; }
        public string nombreFilial { get; set; }
    }
}