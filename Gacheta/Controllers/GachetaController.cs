using Microsoft.AspNetCore.Mvc;
using Gacheta.Entidades.Escafold;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System;
using Microsoft.AspNetCore.Cors;

namespace Gacheta.Controllers
{
    // Controlador para Clientes

    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("AllowAllOrigins")]
    public class ClienteController : ControllerBase
    {
        private readonly ClientesGachetaContext _context;

        public ClienteController(ClientesGachetaContext context)
        {
            _context = context;
        }

        // Modificar huésped
        [HttpPut("modificar/{documento}")]
        public async Task<ActionResult<List<Cliente>>> ModificarHuesped([FromBody]Cliente cliente)
        {
            var resultado = await _context.Modificar_Huesped(cliente.NDocumento, cliente.Nombre,
                cliente.Apellido, 
                cliente.Celular, 
                cliente.Edad, 
                cliente.Parqueadero, 
                cliente.Sexo, 
                cliente.Nacionalidad, 
                cliente.TipoDocumento);
            return resultado == null ? NotFound() : Ok(resultado);
        }
        [HttpGet("buscar/{Documento}")]
        public async Task<ActionResult<Cliente>> Encontrar_huesped(int Documento)
        {
            Cliente? huesped = await _context.Encontrar_huesped(Documento);
            return huesped == null ? NotFound() : Ok(huesped);
        }


        // Crear nuevo huésped
        [HttpPost("nuevo")]
        public async Task<IActionResult> NuevoHuesped([FromBody] Cliente cliente)
        {
            if (cliente == null)
            {
                return BadRequest("Datos del huésped no proporcionados.");
            }

            // Log para verificar los datos recibidos
            Console.WriteLine($"Recibido cliente: {cliente.NDocumento}, {cliente.Nombre}, {cliente.Apellido}");

            try
            {
                await _context.Nuevo_huesped(
                    cliente.NDocumento,
                    cliente.Nombre,
                    cliente.Apellido,
                    cliente.Celular,
                    cliente.Edad,
                    cliente.Parqueadero,
                    cliente.Sexo,
                    cliente.Nacionalidad,
                    cliente.TipoDocumento
                );

                return Ok("Huésped registrado exitosamente.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al registrar huésped: {ex.Message}");
            }
        }


        // Eliminar huésped
        [HttpDelete("eliminar/{documento}")]
        public async Task<IActionResult> EliminarHuesped(int documento)
        {
            await _context.eliminae_huesped(documento);
            return Ok("Huésped eliminado exitosamente");
        }

        // Buscar huésped por nombre y apellido
        [HttpGet("buscarByNombre/{nombre}/{apellido}")]
        public async Task<ActionResult<Cliente>> BuscarPorNombre(string nombre, string apellido)
        {
            IEnumerable<Cliente?> huesped = await _context.Buscar_BY_Nombre(nombre, apellido);
            return huesped.Take(1).FirstOrDefault() == null ? NotFound() : Ok(huesped);
        }
    }

    // Controlador para Historia de Cliente
    [Route("api/[controller]")]
    [ApiController]
    public class HistoriaClienteController : ControllerBase
    {
        private readonly ClientesGachetaContext _context;

        public HistoriaClienteController(ClientesGachetaContext context)
        {
            _context = context;
        }

        // Obtener expediente completo del cliente
        [HttpGet("expediente/{documento}")]
        public async Task<ActionResult<List<HistoriaCliente>>> ObtenerExpedienteCliente(int documento)
        {
            var expediente = await _context.expediente_cliente(documento);
            return expediente == null ? NotFound() : Ok(expediente);
        }

        // Agregar nueva historia para un cliente
        [HttpPost("agregar")]
        public async Task<IActionResult> agregar_historia_huesped_nuevo(int documento, DateTime fEntrada, DateTime fSalida, int nTLavanderia, int nCuarto,string Motivo)
        {
            await _context.agregar_historia_huesped_nuevo(documento, fEntrada, fSalida, nTLavanderia, nCuarto,Motivo);
            return Ok("Historia de cliente añadida exitosamente");
        }


        // Modificar historia de cliente
        [HttpPut("modificar/{idHistoria}")]
        public async Task<ActionResult<HistoriaCliente>> ModificarHistoriaCliente(int idHistoria, DateTime fEntrada, DateTime fSalida, int nTLavanderia, int nCuarto, string motivo)
        {
            var historiaModificada = await _context.modificar_historia(idHistoria, fEntrada, fSalida, nTLavanderia, nCuarto, motivo);
            return historiaModificada == null ? NotFound() : Ok(historiaModificada);
        }

        // Eliminar historia de cliente
        [HttpDelete("eliminar/{idHistoria}")]
        public async Task<IActionResult> EliminarHistoriaCliente(int idHistoria)
        {
            await _context.Eliminar_historia(idHistoria);
            return Ok("Historia eliminada exitosamente");
        }
    }

    // Controlador para Historia de Cuarto
    [Route("api/[controller]")]
    [ApiController]
    public class HistoriaCuartoController : ControllerBase
    {
        private readonly ClientesGachetaContext _context;

        public HistoriaCuartoController(ClientesGachetaContext context)
        {
            _context = context;
        }

        // Agregar nueva historia para un cuarto
        [HttpPost("agregar")]
        public async Task<IActionResult> agregar_historia_cuarto([FromBody]HistoriaCuarto historiaCuarto)
        {
            await _context.agregar_historia_cuarto(
                historiaCuarto.NumeroCuarto, 
                historiaCuarto.NDocumento, 
                historiaCuarto.NServiciosLavanderia, 
                historiaCuarto.FechaOcupado, 
                historiaCuarto.FechaDesocupado);
            return Ok("Historia de cuarto añadida exitosamente");
        }

        // Eliminar historia de cuarto
        [HttpDelete("eliminar/{historiaCuartoId}")]
        public async Task<IActionResult> EliminarHistoriaCuarto(int historiaCuartoId)
        {
            await _context.eliminar_historia_cuarto(historiaCuartoId);
            return Ok("Historia de cuarto eliminada exitosamente");
        }
    }
}
