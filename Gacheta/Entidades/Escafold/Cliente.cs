using System;
using System.Collections.Generic;
namespace Gacheta.Entidades.Escafold;

public partial class Cliente
{
    public int NDocumento { get; set; } 

    public string Nombre { get; set; } = null!;

    public string Apellido { get; set; } = null!;

    public string Celular { get; set; } = null!;

    public int Edad { get; set; }

    public bool Parqueadero { get; set; }

    public string Sexo { get; set; } = null!;

    public string Nacionalidad { get; set; } = null!;

    public string TipoDocumento { get; set; } = null!;

    public virtual ICollection<HistoriaCliente> HistoriaClientes { get; set; } = new List<HistoriaCliente>();

    public virtual ICollection<HistoriaCuarto> HistoriaCuartos { get; set; } = new List<HistoriaCuarto>();
}
