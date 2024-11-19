using System;
using System.Collections.Generic;

namespace Gacheta.Entidades.Escafold;

public partial class HistoriaCliente
{
    public int IdHistoria { get; set; }

    public int NDocumento { get; set; }

    public int NVisitas { get; set; }

    public DateTime FEntrada { get; set; }

    public DateTime FSalida { get; set; }

    public int NTLavanderia { get; set; }

    public int NCuarto { get; set; }

    public string Nombre { get; set; } = null!;

    public string Apellido { get; set; } = null!;

    public string Motivo { get; set; } = null!;

    public virtual Cliente NDocumentoNavigation { get; set; } = null!;
}
