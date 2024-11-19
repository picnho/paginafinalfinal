using System;
using System.Collections.Generic;

namespace Gacheta.Entidades.Escafold;

public partial class Cuarto
{
    public int NumeroCuarto { get; set; }

    public bool Estado { get; set; }

    public virtual ICollection<HistoriaCuarto> HistoriaCuartos { get; set; } = new List<HistoriaCuarto>();
}
