USE [master]
GO
/****** Object:  Database [Clientes_Gacheta]    Script Date: 3/11/2024 12:03:12 p. m. ******/
CREATE DATABASE [Clientes_Gacheta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clientes_Gacheta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Clientes_Gacheta.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Clientes_Gacheta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Clientes_Gacheta_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Clientes_Gacheta] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clientes_Gacheta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clientes_Gacheta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clientes_Gacheta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clientes_Gacheta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clientes_Gacheta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clientes_Gacheta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clientes_Gacheta] SET  MULTI_USER 
GO
ALTER DATABASE [Clientes_Gacheta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clientes_Gacheta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clientes_Gacheta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clientes_Gacheta] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Clientes_Gacheta] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Clientes_Gacheta] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Clientes_Gacheta] SET QUERY_STORE = ON
GO
ALTER DATABASE [Clientes_Gacheta] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Clientes_Gacheta]
GO
/****** Object:  UserDefinedDataType [dbo].[Cliente]    Script Date: 3/11/2024 12:03:12 p. m. ******/
CREATE TYPE [dbo].[Cliente] FROM [int] NOT NULL
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 3/11/2024 12:03:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[N_Documento] [dbo].[Cliente] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Celular] [nvarchar](10) NOT NULL,
	[Edad] [int] NOT NULL,
	[Parqueadero] [bit] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Nacionalidad] [varchar](50) NOT NULL,
	[Tipo_Documento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[N_Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuarto]    Script Date: 3/11/2024 12:03:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuarto](
	[Numero_cuarto] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Cuarto_1] PRIMARY KEY CLUSTERED 
(
	[Numero_cuarto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historia_cliente]    Script Date: 3/11/2024 12:03:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historia_cliente](
	[ID_historia] [int] IDENTITY(1,1) NOT NULL,
	[N_Documento] [int] NOT NULL,
	[N_visitas] [int] NOT NULL,
	[F_entrada] [datetime] NOT NULL,
	[F_salida] [datetime] NOT NULL,
	[N_T_Lavanderia] [int] NOT NULL,
	[N_cuarto] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Motivo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Historia_cliente] PRIMARY KEY CLUSTERED 
(
	[ID_historia] ASC,
	[N_Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historia_cuarto]    Script Date: 3/11/2024 12:03:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historia_cuarto](
	[Id_historia_cuarto] [int] IDENTITY(1,1) NOT NULL,
	[Numero_cuarto] [int] NOT NULL,
	[N_documento] [int] NOT NULL,
	[N_servicios_lavanderia] [int] NOT NULL,
	[Reserva_inicio] [datetime] NULL,
	[Reserva_fin] [datetime] NULL,
	[Fecha_ocupado] [datetime] NULL,
	[Fecha_desocupado] [datetime] NULL,
 CONSTRAINT [PK_Historia_cuarto] PRIMARY KEY CLUSTERED 
(
	[Id_historia_cuarto] ASC,
	[Numero_cuarto] ASC,
	[N_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ser_Lavanderia]    Script Date: 3/11/2024 12:03:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ser_Lavanderia](
	[N_Cuarto] [int] NOT NULL,
	[Numero_Servicios_lavanderia] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([N_Documento], [Nombre], [Apellido], [Celular], [Edad], [Parqueadero], [Sexo], [Nacionalidad], [Tipo_Documento]) VALUES (123, N'faruko', N'brr', N'3130856752', 54, 0, N'M', N'colombia', N'falsificado')
INSERT [dbo].[Clientes] ([N_Documento], [Nombre], [Apellido], [Celular], [Edad], [Parqueadero], [Sexo], [Nacionalidad], [Tipo_Documento]) VALUES (1234, N'alexander dj', N'd-d-d-dj', N'3130856752', 54, 0, N'M', N'colombia', N'falsificado')
GO
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (101, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (102, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (103, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (104, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (105, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (106, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (107, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (108, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (109, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (201, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (202, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (203, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (204, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (205, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (206, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (207, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (208, 0)
INSERT [dbo].[Cuarto] ([Numero_cuarto], [estado]) VALUES (209, 0)
GO
SET IDENTITY_INSERT [dbo].[Historia_cliente] ON 

INSERT [dbo].[Historia_cliente] ([ID_historia], [N_Documento], [N_visitas], [F_entrada], [F_salida], [N_T_Lavanderia], [N_cuarto], [Nombre], [Apellido], [Motivo]) VALUES (1, 1234, 1, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-10-05T00:00:00.000' AS DateTime), 2, 101, N'alexander dj', N'd-d-d-dj', N'pa culiar')
INSERT [dbo].[Historia_cliente] ([ID_historia], [N_Documento], [N_visitas], [F_entrada], [F_salida], [N_T_Lavanderia], [N_cuarto], [Nombre], [Apellido], [Motivo]) VALUES (3, 123, 1, CAST(N'2024-10-02T00:00:00.000' AS DateTime), CAST(N'2024-10-06T00:00:00.000' AS DateTime), 3, 102, N'faruko', N'brr', N'sapo hp no pregunte, dijo el señor :(')
SET IDENTITY_INSERT [dbo].[Historia_cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Historia_cuarto] ON 

INSERT [dbo].[Historia_cuarto] ([Id_historia_cuarto], [Numero_cuarto], [N_documento], [N_servicios_lavanderia], [Reserva_inicio], [Reserva_fin], [Fecha_ocupado], [Fecha_desocupado]) VALUES (4, 101, 1234, 0, CAST(N'2024-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-10T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Historia_cuarto] OFF
GO
ALTER TABLE [dbo].[Historia_cliente]  WITH CHECK ADD  CONSTRAINT [FK_Historia_cliente_Clientes] FOREIGN KEY([N_Documento])
REFERENCES [dbo].[Clientes] ([N_Documento])
GO
ALTER TABLE [dbo].[Historia_cliente] CHECK CONSTRAINT [FK_Historia_cliente_Clientes]
GO
ALTER TABLE [dbo].[Historia_cuarto]  WITH CHECK ADD  CONSTRAINT [FK_Historia_cuarto_Clientes] FOREIGN KEY([N_documento])
REFERENCES [dbo].[Clientes] ([N_Documento])
GO
ALTER TABLE [dbo].[Historia_cuarto] CHECK CONSTRAINT [FK_Historia_cuarto_Clientes]
GO
ALTER TABLE [dbo].[Historia_cuarto]  WITH CHECK ADD  CONSTRAINT [FK_Historia_cuarto_Cuarto] FOREIGN KEY([Numero_cuarto])
REFERENCES [dbo].[Cuarto] ([Numero_cuarto])
GO
ALTER TABLE [dbo].[Historia_cuarto] CHECK CONSTRAINT [FK_Historia_cuarto_Cuarto]
GO
ALTER TABLE [dbo].[Ser_Lavanderia]  WITH CHECK ADD  CONSTRAINT [FK_Ser_Lavanderia_Cuarto] FOREIGN KEY([N_Cuarto])
REFERENCES [dbo].[Cuarto] ([Numero_cuarto])
GO
ALTER TABLE [dbo].[Ser_Lavanderia] CHECK CONSTRAINT [FK_Ser_Lavanderia_Cuarto]
GO
/****** Object:  StoredProcedure [dbo].[agregar_historia_cuarto]    Script Date: 3/11/2024 12:03:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agregar_historia_cuarto](
    @N_Cuarto INT,
    @Fecha_entrada DATETIME, -- Se pasa la fecha de entrada
    @Fecha_salida DATETIME   -- La fecha de salida es obligatoria
)
AS
BEGIN
    -- Variables para manejar fechas actuales del sistema
    DECLARE @Fecha_actual DATETIME = GETDATE();
    DECLARE @N_Documento INT;
    DECLARE @F_entrada DATETIME;

    -- Verificar si el cuarto está desocupado (estado = 0)
    IF EXISTS (
        SELECT 1 
        FROM Cuarto 
        WHERE Numero_cuarto = @N_Cuarto AND estado = 0
    )
    BEGIN
        -- Obtener los datos del cliente de la tabla Historia_cliente
        SELECT TOP 1 
            @N_Documento = N_Documento,
            @F_entrada = F_entrada
        FROM Historia_cliente 
        WHERE N_cuarto = @N_Cuarto
        ORDER BY F_entrada DESC;

        -- Verificar que la fecha de salida no sea anterior a la fecha actual o nula
        IF @Fecha_salida IS NULL OR @Fecha_salida <= @Fecha_entrada
        BEGIN
            PRINT 'Error: La fecha de salida debe ser mayor que la fecha de entrada y no puede ser nula.';
            RETURN;
        END

        -- Verificar si existe una reserva que se solape con las fechas actuales
        IF EXISTS (
            SELECT 1 
            FROM Historia_cuarto 
            WHERE Numero_cuarto = @N_Cuarto 
            AND (
                (Reserva_inicio <= @Fecha_entrada AND Reserva_fin >= @Fecha_entrada) OR
                (Reserva_inicio <= @Fecha_salida AND Reserva_fin >= @Fecha_salida)
            )
        )
        BEGIN
            PRINT 'Error: No se puede registrar la historia, ya existe una reserva que se solapa con las fechas actuales.';
            RETURN;
        END
        
        -- Insertar un nuevo registro en la tabla Historia_cuarto con las fechas según la lógica
        IF @Fecha_entrada = @Fecha_actual
        BEGIN
            -- Si la fecha de entrada es hoy, entonces ocupa el cuarto inmediatamente
            INSERT INTO Historia_cuarto (Numero_cuarto, N_documento, N_servicios_lavanderia, Fecha_ocupado, Fecha_desocupado)
            VALUES (@N_Cuarto, @N_Documento, 0, @Fecha_actual, @Fecha_salida);

            -- Actualizar el estado del cuarto a ocupado (1)
            UPDATE Cuarto
            SET estado = 1
            WHERE Numero_cuarto = @N_Cuarto;

            PRINT 'Historia de cuarto agregada correctamente y el cuarto ha sido ocupado hoy.';
        END
        ELSE IF @Fecha_entrada > @Fecha_actual
        BEGIN
            -- Si la fecha de entrada es en el futuro, entonces es una reserva
            INSERT INTO Historia_cuarto (Numero_cuarto, N_documento, N_servicios_lavanderia, Reserva_inicio, Reserva_fin)
            VALUES (@N_Cuarto, @N_Documento, 0, @Fecha_entrada, @Fecha_salida);

            PRINT 'Reserva futura agregada correctamente.';
        END
    END
    ELSE
    BEGIN
        PRINT 'Error: El cuarto no está disponible para agregar una nueva historia.';
    END

    
END;
GO
/****** Object:  StoredProcedure [dbo].[agregar_historia_huesped_nuevo]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agregar_historia_huesped_nuevo](
    @N_Documento INT,
    @F_entrada DATETIME,
    @F_salida DATETIME,
    @N_T_Lavanderia INT,
    @N_cuarto INT,
	@motivo varchar(50)
)
AS
BEGIN
    -- Variables para almacenar el nombre, apellido y número de visitas del cliente
    DECLARE @Nombre VARCHAR(50);
    DECLARE @Apellido VARCHAR(50);
    DECLARE @N_visitas INT;

    -- Verificar si el cliente existe en la tabla Cliente
    IF EXISTS (SELECT * FROM Clientes WHERE N_Documento = @N_Documento)
    BEGIN
        -- Recuperar nombre y apellido del cliente desde la tabla Cliente
        SELECT @Nombre = Nombre, @Apellido = Apellido
        FROM Clientes
        WHERE N_Documento = @N_Documento;

        -- Verificar si el cliente ya tiene una historia en la tabla Historia_cliente
        IF EXISTS (SELECT * FROM Historia_cliente WHERE N_Documento = @N_Documento)
        BEGIN
            -- Si ya existe una historia, aumentar el número de visitas
            SELECT @N_visitas = MAX(N_visitas) + 1
            FROM Historia_cliente
            WHERE N_Documento = @N_Documento;
        END
        ELSE
        BEGIN
            -- Si no existe una historia, inicializar las visitas en 1
            SET @N_visitas = 1;
        END

        -- Insertar un nuevo registro en la tabla Historia_cliente
        INSERT INTO Historia_cliente (N_Documento, N_visitas, F_entrada, F_salida, N_T_Lavanderia, N_cuarto, Nombre, Apellido,Motivo)
        VALUES (@N_Documento, @N_visitas, @F_entrada, @F_salida, @N_T_Lavanderia, @N_cuarto, @Nombre, @Apellido,@motivo);

        PRINT 'La historia del cliente ha sido creada exitosamente. Número de visitas actualizado.';
    END
    ELSE
    BEGIN
        -- Si el cliente no existe, no se crea el registro y se da un mensaje de error
        PRINT 'No se puede crear la historia del cliente porque el cliente no está registrado.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[añadir_historia_huesped_nuevo]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[añadir_historia_huesped_nuevo](
    @Documento INT,
    @N_visitas INT,
    @F_entrada DATETIME,
    @F_salida DATETIME,
    @N_T_Lavanderia INT,
    @N_cuarto INT,
    @nombre VARCHAR(50),
    @apellido VARCHAR(50)
)
AS
BEGIN
    DECLARE @nombreExistente VARCHAR(50);
    DECLARE @apellidoExistente VARCHAR(50);

    IF EXISTS (SELECT * FROM Historia_cliente WHERE N_Documento = @Documento AND N_cuarto = @N_cuarto)
    BEGIN
        SELECT @nombreExistente = nombre, @apellidoExistente = apellido
        FROM Historia_cliente
        WHERE N_Documento = @Documento AND N_cuarto = @N_cuarto;

        UPDATE Historia_cliente
        SET N_visitas = N_visitas + 1,
            nombre = @nombreExistente,
            apellido = @apellidoExistente
        WHERE N_Documento = @Documento AND N_cuarto = @N_cuarto;
    END
    ELSE
    BEGIN
        INSERT INTO Historia_cliente (N_Documento, N_visitas, F_entrada, F_salida, N_T_Lavanderia, N_cuarto, nombre, apellido)
        VALUES (@Documento, 1, @F_entrada, @F_salida, @N_T_Lavanderia, @N_cuarto, @nombre, @apellido);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_BY_Nombre]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------
--encontrar huesped por el nombre

CREATE proc [dbo].[Buscar_BY_Nombre]
(@nombre varchar(50), @apellido varchar(50))
as begin
	if exists(select * from Clientes where nombre = @nombre   or apellido = @apellido)	
	begin 
		select * from Clientes where nombre = @nombre or apellido = @apellido
	end
	else 
	begin 
		print concat('no se encontro ningun huesped con el nombre ',@nombre , ' o apellido ', @apellido)
	end

end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--pruebas
exec Nuevo_huesped 123,'alexander dj','d-d-d-dj',3130856752,54,5,'m','colombia','falsificado','escape de los gota a gota'

exec Encontrar_huesped 123

exec eliminae_huesped 123

EXEC Modificar_Huesped 123,
    @Nombre = 'Maria',
    @Apellido = 'Lopez',
    @Celular = '3009876543',
    @Edad = 28,
    @parqueadero = 'N',
    @sexo = 'F',
    @nacionalidad = 'Mexican',
    @tipo_documento = 'Passport',
    @motivo = 'Business'

exec Buscar_BY_Nombre 'alexander dj' , ''

select * from clientes
GO
/****** Object:  StoredProcedure [dbo].[consultar_historia_Cliente]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[consultar_historia_Cliente](
@Documento int
)
AS
BEGIN
	select * from Historia_cliente where @documento=N_Documento
END
GO
/****** Object:  StoredProcedure [dbo].[eliminae_huesped]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------

--para eliminar huesped

CREATE proc [dbo].[eliminae_huesped] (@cedula cliente)
as begin 
	if exists (select * from clientes where N_Documento=@cedula)
	begin 
			delete  from Clientes where N_Documento=@cedula 
			print concat('se ha eliminado correctamente el huesped con cedula ', @cedula)

	end
	else 
	begin 
			print concat( 'no se encuentra ningun huesped con la cedula ' , @cedula)
	end
end 
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_historia]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Eliminar_historia](@his int )
as begin
	if exists(select * from Historia_cliente where ID_historia=@his)
	begin 
	delete from Historia_cliente where ID_historia=@his
	end
end
GO
/****** Object:  StoredProcedure [dbo].[eliminar_historia_cuarto]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_historia_cuarto](@id int)
as begin 
	if exists (select * from Historia_cuarto where Id_historia_cuarto=@id)
	delete from Historia_cuarto where Id_historia_cuarto=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Encontrar_huesped]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- para encontrar un solo huesped

CREATE proc [dbo].[Encontrar_huesped] (@huesped cliente)
as begin 

select * from Clientes where @huesped= N_Documento

end
GO
/****** Object:  StoredProcedure [dbo].[expediente_cliente]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[expediente_cliente](@Doc int)
as begin 
	select * from Historia_cliente where N_Documento=@Doc
end 
GO
/****** Object:  StoredProcedure [dbo].[modificar_historia]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modificar_historia](
    @ID_historia INT,
    @F_entrada DATETIME,
    @F_salida DATETIME,
    @N_T_Lavanderia INT,
    @N_cuarto INT,
	@motivo varchar(50)
)
AS
BEGIN
    -- Verificar si existe la historia del cliente
    IF EXISTS (SELECT * FROM Historia_cliente WHERE ID_historia = @ID_historia)
    BEGIN
        -- Actualizar solo los campos permitidos
        UPDATE Historia_cliente
        SET 
            F_entrada = @F_entrada,
            F_salida = @F_salida,
            N_T_Lavanderia = @N_T_Lavanderia,
            N_cuarto = @N_cuarto,
			motivo = @motivo
        WHERE ID_historia = @ID_historia;

        -- Mensaje de confirmación de la modificación
        PRINT 'La historia del cliente fue correctamente modificada con el ID ' + CAST(@ID_historia AS VARCHAR(10));
        
        -- Mostrar la historia modificada
        SELECT * FROM Historia_cliente WHERE ID_historia = @ID_historia;
    END
    ELSE
    BEGIN
        -- Mensaje de error si no existe la historia
        PRINT 'No existe ninguna historia de cliente con el ID ' + CAST(@ID_historia AS VARCHAR(10));
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[Modificar_Huesped]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Modificar_Huesped] 
(
    @cliente cliente, 
    @Nombre varchar(50),
    @Apellido varchar(50),
    @Celular nvarchar(10),
    @Edad int,
    @parqueadero varchar(2),
	@sexo char(1),
	@nacionalidad varchar(50),
	@tipo_documento varchar(50)
)
AS
BEGIN
    
    IF EXISTS (SELECT * FROM Clientes WHERE N_Documento = @cliente)
    BEGIN
        
        UPDATE Clientes
        SET 
            Nombre = @Nombre,
            Apellido = @Apellido,
            Celular = @Celular,
            Edad = @Edad,
            Parqueadero = upper(@parqueadero),
			Sexo=upper(@sexo),
			Nacionalidad=@nacionalidad,
			Tipo_Documento=@tipo_documento
			
			
        WHERE N_Documento = @cliente;
		print concat('cliente modificado correctamente con numero de documento ',@cliente)
		select * from  Clientes where N_Documento=@cliente
    END
    ELSE
    BEGIN
     
        PRINT concat('No existe ningún huésped con el número de cédula ' , @cliente)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Nuevo_huesped]    Script Date: 3/11/2024 12:03:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Nuevo_huesped]
(
    @cliente cliente, 
    @Nombre varchar(50),
    @Apellido varchar(50),
    @Celular nvarchar(10),
    @Edad int,
    @parqueadero bit,
	@sexo char(1),
	@nacionalidad varchar(50),
	@tipo_documento varchar(50)
	
)
AS 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Clientes WHERE N_Documento = @cliente)
    BEGIN
        INSERT INTO Clientes (N_Documento, Nombre, Apellido, Celular, Edad, Parqueadero, Sexo, Nacionalidad, Tipo_Documento)
        VALUES (@cliente, @Nombre, @Apellido, @Celular, @Edad, @parqueadero, UPPER(@sexo), @nacionalidad, @tipo_documento);
		print concat('cliente agregado correctamente con numero de documento ' ,@cliente)
    END
    ELSE
    BEGIN
		print concat('Ya existe un huesped con numero de documento ', @cliente)
    END
END
GO
USE [master]
GO
ALTER DATABASE [Clientes_Gacheta] SET  READ_WRITE 
GO
