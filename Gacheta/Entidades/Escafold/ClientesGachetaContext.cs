using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Xml;
using Microsoft.EntityFrameworkCore;
using static System.Runtime.InteropServices.JavaScript.JSType;


namespace Gacheta.Entidades.Escafold;

public partial class ClientesGachetaContext : DbContext
{
    public ClientesGachetaContext()
    {
    }

    public ClientesGachetaContext(DbContextOptions<ClientesGachetaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Cliente> Clientes { get; set; }

    public virtual DbSet<Cuarto> Cuartos { get; set; }

    public virtual DbSet<HistoriaCliente> HistoriaClientes { get; set; }

    public virtual DbSet<HistoriaCuarto> HistoriaCuartos { get; set; }

    public virtual DbSet<SerLavanderium> SerLavanderia { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;Database=Clientes_Gacheta;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Cliente>(entity =>
        {
            entity.HasKey(e => e.NDocumento);

            entity.Property(e => e.NDocumento).HasMaxLength(15)
                .ValueGeneratedNever()
                .HasColumnName("N_Documento");
            entity.Property(e => e.Apellido)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Celular).HasMaxLength(10);
            entity.Property(e => e.Nacionalidad)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Sexo)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.TipoDocumento)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Tipo_Documento");
        });

        modelBuilder.Entity<Cuarto>(entity =>
        {
            entity.HasKey(e => e.NumeroCuarto).HasName("PK_Cuarto_1");

            entity.ToTable("Cuarto");

            entity.Property(e => e.NumeroCuarto)
                .ValueGeneratedNever()
                .HasColumnName("Numero_cuarto");
            entity.Property(e => e.Estado).HasColumnName("estado");
        });

        modelBuilder.Entity<HistoriaCliente>(entity =>
        {
            entity.HasKey(e => new { e.IdHistoria, e.NDocumento });

            entity.ToTable("Historia_cliente");

            entity.Property(e => e.IdHistoria)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID_historia");
            entity.Property(e => e.NDocumento).HasColumnName("N_Documento");
            entity.Property(e => e.Apellido)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.FEntrada)
                .HasColumnType("datetime")
                .HasColumnName("F_entrada");
            entity.Property(e => e.FSalida)
                .HasColumnType("datetime")
                .HasColumnName("F_salida");
            entity.Property(e => e.Motivo)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.NCuarto).HasColumnName("N_cuarto");
            entity.Property(e => e.NTLavanderia).HasColumnName("N_T_Lavanderia");
            entity.Property(e => e.NVisitas).HasColumnName("N_visitas");
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.NDocumentoNavigation).WithMany(p => p.HistoriaClientes)
                .HasForeignKey(d => d.NDocumento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Historia_cliente_Clientes");
        });

        modelBuilder.Entity<HistoriaCuarto>(entity =>
        {
            entity.HasKey(e => new { e.IdHistoriaCuarto, e.NumeroCuarto, e.NDocumento });

            entity.ToTable("Historia_cuarto");

            entity.Property(e => e.IdHistoriaCuarto)
                .ValueGeneratedOnAdd()
                .HasColumnName("Id_historia_cuarto");
            entity.Property(e => e.NumeroCuarto).HasColumnName("Numero_cuarto");
            entity.Property(e => e.NDocumento).HasColumnName("N_documento");
            entity.Property(e => e.FechaDesocupado)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_desocupado");
            entity.Property(e => e.FechaOcupado)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_ocupado");
            entity.Property(e => e.NServiciosLavanderia).HasColumnName("N_servicios_lavanderia");


            entity.HasOne(d => d.NDocumentoNavigation).WithMany(p => p.HistoriaCuartos)
                .HasForeignKey(d => d.NDocumento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Historia_cuarto_Clientes");

            entity.HasOne(d => d.NumeroCuartoNavigation).WithMany(p => p.HistoriaCuartos)
                .HasForeignKey(d => d.NumeroCuarto)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Historia_cuarto_Cuarto");
        });

        modelBuilder.Entity<SerLavanderium>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("Ser_Lavanderia");

            entity.Property(e => e.NCuarto).HasColumnName("N_Cuarto");
            entity.Property(e => e.NumeroServiciosLavanderia).HasColumnName("Numero_Servicios_lavanderia");

            entity.HasOne(d => d.NCuartoNavigation).WithMany()
                .HasForeignKey(d => d.NCuarto)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Ser_Lavanderia_Cuarto");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    // para los SP del SQl

    //modificar huesped

    public DbSet<Cliente> Clientee { get; set; }
    public async Task<List<Cliente>> Modificar_Huesped(int NDocumento, string Nombre, string Apellido, string Celular, int Edad, bool Parqueadero, string Sexo, string Nacionalidad, string TipoDocumento)

    {
        return await Clientee.FromSqlRaw("EXEC Modificar_Huesped @Cliente, @Nombre, @Apellido, @Celular, @Edad, @Parqueadero,@Sexo,@Nacionalidad,@Tipo_documento",
            new SqlParameter("@Cliente", NDocumento),
            new SqlParameter("@Nombre", Nombre),
            new SqlParameter("@Apellido", Apellido),
            new SqlParameter("@Celular", Celular),
            new SqlParameter("@Edad", Edad),
            new SqlParameter("@Parqueadero", Parqueadero),
            new SqlParameter("@Sexo", Sexo),
            new SqlParameter("@Nacionalidad", Nacionalidad),
            new SqlParameter("@Tipo_documento", TipoDocumento)).ToListAsync();
    }

    // encontrar huesped
    // Método en la capa de datos
    public async Task<Cliente?> Encontrar_huesped(int Documento)
    {
        // Usamos el parámetro correctamente definido
        var parametro = new SqlParameter("@Documento", Documento);

        // Ejecutamos la consulta y retornamos el primer o único elemento esperado
        var resultado = await Clientee.FromSqlRaw("EXEC Encontrar_huesped @Documento", parametro).ToListAsync();

        // Devuelve el primer elemento o nulo si no encuentra ninguno
        return resultado.FirstOrDefault();
    }





    //nuevo huesped

    public async Task Nuevo_huesped(int NDocumento, string Nombre, string Apellido, string Celular, int Edad, bool Parqueadero, string Sexo, string Nacionalidad, string TipoDocumento)

    {
        await Database.ExecuteSqlRawAsync("EXEC Nuevo_huesped @Cliente, @Nombre, @Apellido, @Celular, @Edad, @Parqueadero,@Sexo,@Nacionalidad,@Tipo_documento",
           new SqlParameter("@Cliente", NDocumento),
           new SqlParameter("@Nombre", Nombre),
           new SqlParameter("@Apellido", Apellido),
           new SqlParameter("@Celular", Celular),
           new SqlParameter("@Edad", Edad),
           new SqlParameter("@Parqueadero", Parqueadero),
           new SqlParameter("@Sexo", Sexo),
           new SqlParameter("@Nacionalidad", Nacionalidad),
           new SqlParameter("@Tipo_documento", TipoDocumento));
    }

    //eliminar huesped
    public async Task eliminae_huesped(int NDocumento)

    {
        await Database.ExecuteSqlRawAsync("EXEC eliminae_huesped @Cliente",
           new SqlParameter("@Cliente", NDocumento));
    }

    //buscar por nombre o apellido

    public async Task<IEnumerable<Cliente?>> Buscar_BY_Nombre(string Nombre, string Apellido)
    {

        IEnumerable<Cliente?> a = await Clientee.FromSqlRaw("EXEC Buscar_BY_Nombre @Nombre, @Apellido", new SqlParameter("@Nombre", Nombre),
                                                                                           new SqlParameter("@Apellido", Apellido)).ToListAsync()!;

        return a;
    }

    //añadir historia de 
    public async Task agregar_historia_huesped_nuevo(int documento, DateTime fEntrada, DateTime fSalida, int nTLavanderia, int nCuarto,string Motivo)
    {
        await Database.ExecuteSqlRawAsync(
            "EXEC agregar_historia_huesped_nuevo @NDocumento, @FEntrada, @Fsalida, @NTLavanderia, @Ncuarto,@Motivo",
            new SqlParameter("@NDocumento", documento),
            new SqlParameter("@FEntrada", fEntrada),
            new SqlParameter("@FSalida", fSalida),
            new SqlParameter("@NTLavanderia", nTLavanderia),
            new SqlParameter("@Ncuarto", nCuarto),
            new SqlParameter("@Motivo", Motivo)
        );
    }


    public async Task agregar_historia_cuarto(int nCuarto, int NDocumento, int NSLavanaderia, DateTime fechaEntrada, DateTime fechaSalida)
    {
        await Database.ExecuteSqlRawAsync(
            "EXEC agregar_historia_cuarto @N_Cuarto,@NDocumento,@NSLavanderia, @Fecha_entrada, @Fecha_salida",
            new SqlParameter("@N_Cuarto", nCuarto),
            new SqlParameter("@NDocumento", NDocumento),
            new SqlParameter("@NSLavanderia", NSLavanaderia),
            new SqlParameter("@Fecha_entrada", fechaEntrada),
            new SqlParameter("@Fecha_salida", fechaSalida)
        );
    }

    public async Task Eliminar_historia(int historiaId)
    {
        await Database.ExecuteSqlRawAsync(
            "EXEC Eliminar_historia @his",
            new SqlParameter("@his", historiaId)
        );
    }

    public async Task eliminar_historia_cuarto(int historiaCuartoId)
    {
        await Database.ExecuteSqlRawAsync(
            "EXEC eliminar_historia_cuarto @id",
            new SqlParameter("@id", historiaCuartoId)
        );
    }

    public async Task<List<HistoriaCliente>> expediente_cliente(int documento)
    {
        return await HistoriaClientes
            .FromSqlRaw("EXEC expediente_cliente @Documento",
                        new SqlParameter("@Documento", documento))
            .ToListAsync();
    }

    public async Task<HistoriaCliente> modificar_historia(int idHistoria, DateTime fEntrada, DateTime fSalida, int nTLavanderia, int nCuarto, string motivo)
    {
        // Ejecutar el procedimiento almacenado para modificar la historia
        await Database.ExecuteSqlRawAsync(
            "EXEC modificar_historia @ID_historia, @F_entrada, @F_salida, @N_T_Lavanderia, @N_cuarto, @motivo",
            new SqlParameter("@ID_historia", idHistoria),
            new SqlParameter("@F_entrada", fEntrada),
            new SqlParameter("@F_salida", fSalida),
            new SqlParameter("@N_T_Lavanderia", nTLavanderia),
            new SqlParameter("@N_cuarto", nCuarto),
            new SqlParameter("@motivo", motivo)
        );

        // Recuperar y devolver la historia modificada
        var historiaModificada = await HistoriaClientes
            .FromSqlRaw("SELECT * FROM Historia_cliente WHERE ID_historia = @ID_historia",
                        new SqlParameter("@ID_historia", idHistoria))
            .FirstOrDefaultAsync();

        return historiaModificada;
    }


partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
