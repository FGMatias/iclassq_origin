package pe.gob.ep.iclassq.job;

import java.sql.Connection;
import java.sql.DriverManager;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.PreparedStatement;

import pe.gob.ep.iclassq.ticket.service.TicketService;

@Service("scheduledProcessor")
public class ScheduledProcessor {

	@Autowired
	private TicketService ticketService;
	
	protected final Log log = LogFactory.getLog(getClass());
	
	//todos los dias a las 21:18:30 
	@Scheduled(cron="00 55 20 ? * *")
	public void ScheduledStartServerControlFisca() throws Exception{
//		log.debug("ScheduledStartServerControlFisca()");
		System.out.println("ejecutando JOB->>>");
		//cadena de cnx
		String cadenaConeccion = ticketService.parametroDescripcion("002");
		String[] aux =cadenaConeccion.split(",");
		//localhost,3306,root,,dbiclassq_es
		String ip= aux[0];
		String puerto = aux[1];
		String user = aux[2];
		String clave = aux[3];
		String bd = aux[4];
		int retorno;
		String sDriver = "com.mysql.jdbc.Driver";
		String sURL = "jdbc:mysql://"+ip+":"+puerto+"/"+bd;
		System.out.println("sURL->>>"+sURL);

		Class.forName(sDriver).newInstance();
		Connection con = DriverManager.getConnection(sURL,user,clave);
		System.out.println("Conecto db");
		

		PreparedStatement stmt;
		stmt = (PreparedStatement) con.prepareStatement("DELETE FROM tbl_secuencia");
		retorno = stmt.executeUpdate();
		stmt = (PreparedStatement) con.prepareStatement("UPDATE tbl_monitor_cajas SET nombre_ventanilla='--' , id_ticket=NULL , estado=0, ticket_texto='--'");
		retorno = stmt.executeUpdate();
		System.out.println("Query 1 y 2");
		stmt = (PreparedStatement) con.prepareStatement("UPDATE tbl_ticket SET estado=80 where  estado in (0,30,31,40,41)");
		retorno = stmt.executeUpdate();
		stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_ticket_historico select *,sysdate() from tbl_ticket tk where tk.ID not in (select tkh.ID FROM tbl_ticket_historico tkh)");
		retorno = stmt.executeUpdate();
		stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_ticket_adicionales_historico select * from tbl_ticket_adicionales tka where tka.id_ticket not in (select tkh.id_ticket FROM tbl_ticket_adicionales_historico tkh)");
		retorno = stmt.executeUpdate();
		stmt = (PreparedStatement) con.prepareStatement("DELETE FROM tbl_ticket");
		retorno = stmt.executeUpdate();
		stmt = (PreparedStatement) con.prepareStatement("DELETE FROM tbl_ticket_adicionales");
		retorno = stmt.executeUpdate();
		stmt = (PreparedStatement) con.prepareStatement("INSERT INTO tbl_ticket_clasificador_historico select *,sysdate() from tbl_ticket_clasificador tc where tc.ID not in (select tch.ID FROM tbl_ticket_clasificador_historico tch)");
		retorno = stmt.executeUpdate();
		stmt = (PreparedStatement) con.prepareStatement("DELETE FROM tbl_ticket_clasificador");
		retorno = stmt.executeUpdate();
	}
}
