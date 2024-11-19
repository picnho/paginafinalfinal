using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Gacheta.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Clientes",
                columns: table => new
                {
                    N_Documento = table.Column<int>(type: "int", nullable: false),
                    Nombre = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    Apellido = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    Celular = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    Edad = table.Column<int>(type: "int", nullable: false),
                    Parqueadero = table.Column<bool>(type: "bit", nullable: false),
                    Sexo = table.Column<string>(type: "char(1)", unicode: false, fixedLength: true, maxLength: 1, nullable: false),
                    Nacionalidad = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    Tipo_Documento = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Clientes", x => x.N_Documento);
                });

            migrationBuilder.CreateTable(
                name: "Cuarto",
                columns: table => new
                {
                    Numero_cuarto = table.Column<int>(type: "int", nullable: false),
                    estado = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cuarto_1", x => x.Numero_cuarto);
                });

            migrationBuilder.CreateTable(
                name: "Historia_cliente",
                columns: table => new
                {
                    ID_historia = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    N_Documento = table.Column<int>(type: "int", nullable: false),
                    N_visitas = table.Column<int>(type: "int", nullable: false),
                    F_entrada = table.Column<DateTime>(type: "datetime", nullable: false),
                    F_salida = table.Column<DateTime>(type: "datetime", nullable: false),
                    N_T_Lavanderia = table.Column<int>(type: "int", nullable: false),
                    N_cuarto = table.Column<int>(type: "int", nullable: false),
                    Nombre = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    Apellido = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    Motivo = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Historia_cliente", x => new { x.ID_historia, x.N_Documento });
                    table.ForeignKey(
                        name: "FK_Historia_cliente_Clientes",
                        column: x => x.N_Documento,
                        principalTable: "Clientes",
                        principalColumn: "N_Documento");
                });

            migrationBuilder.CreateTable(
                name: "Historia_cuarto",
                columns: table => new
                {
                    Id_historia_cuarto = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Numero_cuarto = table.Column<int>(type: "int", nullable: false),
                    N_documento = table.Column<int>(type: "int", nullable: false),
                    N_servicios_lavanderia = table.Column<int>(type: "int", nullable: false),
                    Reserva_inicio = table.Column<DateTime>(type: "datetime", nullable: true),
                    Reserva_fin = table.Column<DateTime>(type: "datetime", nullable: true),
                    Fecha_ocupado = table.Column<DateTime>(type: "datetime", nullable: true),
                    Fecha_desocupado = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Historia_cuarto", x => new { x.Id_historia_cuarto, x.Numero_cuarto, x.N_documento });
                    table.ForeignKey(
                        name: "FK_Historia_cuarto_Clientes",
                        column: x => x.N_documento,
                        principalTable: "Clientes",
                        principalColumn: "N_Documento");
                    table.ForeignKey(
                        name: "FK_Historia_cuarto_Cuarto",
                        column: x => x.Numero_cuarto,
                        principalTable: "Cuarto",
                        principalColumn: "Numero_cuarto");
                });

            migrationBuilder.CreateTable(
                name: "Ser_Lavanderia",
                columns: table => new
                {
                    N_Cuarto = table.Column<int>(type: "int", nullable: false),
                    Numero_Servicios_lavanderia = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.ForeignKey(
                        name: "FK_Ser_Lavanderia_Cuarto",
                        column: x => x.N_Cuarto,
                        principalTable: "Cuarto",
                        principalColumn: "Numero_cuarto");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Historia_cliente_N_Documento",
                table: "Historia_cliente",
                column: "N_Documento");

            migrationBuilder.CreateIndex(
                name: "IX_Historia_cuarto_N_documento",
                table: "Historia_cuarto",
                column: "N_documento");

            migrationBuilder.CreateIndex(
                name: "IX_Historia_cuarto_Numero_cuarto",
                table: "Historia_cuarto",
                column: "Numero_cuarto");

            migrationBuilder.CreateIndex(
                name: "IX_Ser_Lavanderia_N_Cuarto",
                table: "Ser_Lavanderia",
                column: "N_Cuarto");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Historia_cliente");

            migrationBuilder.DropTable(
                name: "Historia_cuarto");

            migrationBuilder.DropTable(
                name: "Ser_Lavanderia");

            migrationBuilder.DropTable(
                name: "Clientes");

            migrationBuilder.DropTable(
                name: "Cuarto");
        }
    }
}
