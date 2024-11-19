using System;
using System.Collections.Generic;

namespace Gacheta.Entidades.Escafold;

public partial class HistoriaCuarto
{
    public int IdHistoriaCuarto { get; set; }

    public int NumeroCuarto { get; set; }

    public int NDocumento { get; set; }

    public int NServiciosLavanderia { get; set; }

    public DateTime FechaOcupado { get; set; }

    public DateTime FechaDesocupado { get; set; }

    public virtual Cliente NDocumentoNavigation { get; set; } = null!;

    public virtual Cuarto NumeroCuartoNavigation { get; set; } = null!;
}
