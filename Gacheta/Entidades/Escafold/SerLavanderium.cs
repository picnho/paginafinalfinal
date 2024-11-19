using System;
using System.Collections.Generic;

namespace Gacheta.Entidades.Escafold;

public partial class SerLavanderium
{
    public int NCuarto { get; set; }

    public int NumeroServiciosLavanderia { get; set; }

    public virtual Cuarto NCuartoNavigation { get; set; } = null!;
}
