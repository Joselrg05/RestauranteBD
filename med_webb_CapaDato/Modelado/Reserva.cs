//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace med_webb_CapaDato.Modelado
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reserva
    {
        public int Id { get; set; }
        public Nullable<int> ClienteId { get; set; }
        public Nullable<int> MesaId { get; set; }
        public System.DateTime FechaReserva { get; set; }
        public int CantidadPersonas { get; set; }
        public string EstadoReserva { get; set; }
    
        public virtual Cliente Cliente { get; set; }
        public virtual Mesa Mesa { get; set; }
    }
}
