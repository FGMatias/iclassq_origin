//package pe.gob.ep.iclassq.job;
//
//import java.time.LocalTime;
//import java.time.format.DateTimeParseException;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.Random;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import pe.gob.ep.iclassq.entidad.BeanUsuarioEstadoGestion;
//import pe.gob.ep.iclassq.negocio.bean.Ticket;
//import pe.gob.ep.iclassq.seguridad.service.UsuarioService;
//import pe.gob.ep.iclassq.ticket.service.TicketService;
//
//@Component
//public class AutoAssignTicketJob {
//
//	@Autowired
//	private TicketService ticketService;
//	
//	@Autowired
//	private UsuarioService usuarioService;
//	
//	@Scheduled(fixedDelay = 5000)
//	public void assignTicket() {
//		try {
//			List<BeanUsuarioEstadoGestion> agentes = usuarioService.getAvailableAgents();
//			
//			if (agentes == null || agentes.isEmpty()) {
//				return;
//			}
//			
//			for (BeanUsuarioEstadoGestion agente : agentes) {
//				Integer idVentanilla = agente.getIdVentanilla();
//				
//				if (idVentanilla == null || idVentanilla <= 0) {
//					continue;
//				}
//				
//				String duracion = agente.getDuracionActual();
//				
//				if (duracion == null) { 
//					continue;
//				}
//				
//				try {
//					LocalTime tiempo = LocalTime.parse(duracion);
//					
//					if (tiempo.toSecondOfDay() < 30) {
//						continue;
//					}
//				} catch (DateTimeParseException e) {
//					continue;
//				}
//				
//				Ticket ticket = ticketService.getOldestWaitingTicket(agente.getIdSucursal(), agente.getIdRolEquipo());
//				
//				if (ticket != null) {
//					try {
//						ticketService.getNextTicket(
//							agente.getIdUsuario(), 
//							agente.getIdSucursal(), 
//							agente.getIdRolEquipo(), 
//							idVentanilla
//						);
//						ticketService.activarLlamadoXAudio(ticket.getId());
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//}
