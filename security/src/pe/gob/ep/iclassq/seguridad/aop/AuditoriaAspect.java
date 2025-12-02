package pe.gob.ep.iclassq.seguridad.aop;

import java.util.Date;





import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import pe.gob.ep.iclassq.seguridad.bean.Auditoria;
import pe.gob.ep.iclassq.seguridad.bean.UserSecurity;



@Aspect
public class AuditoriaAspect {
	protected final Log log = LogFactory.getLog(getClass());
		
	@Pointcut("execution(* app.*.service.*.insert*(..)))")
	public void onSaveInDaoLayer() {
	}
	
	@Pointcut("execution(* app.*.service.*.update*(..)))")
	public void onUpdateInDaoLayer() {
	}
	
	@Pointcut("execution(* app.*.*.service.*.insert*(..)))")
	public void onSaveInDaoLayer1() {
	}
	
	@Pointcut("execution(* app.*.*.service.*.update*(..)))")
	public void onUpdateInDaoLayer1() {
	}
	
	@Before("pe.gob.ep.iclassq.seguridad.aop.AuditoriaAspect.onSaveInDaoLayer() and args(record)")
	public void insert1(Auditoria record){
		insert(record);
	}
	@Before("pe.gob.ep.iclassq.seguridad.aop.AuditoriaAspect.onUpdateInDaoLayer() and args(record)")
	public void update1(Auditoria record) {
		update(record);
	}
	@Before("pe.gob.ep.iclassq.seguridad.aop.AuditoriaAspect.onSaveInDaoLayer1() and args(record)")
	public void insert2(Auditoria record){
		insert(record);
	}
	@Before("pe.gob.ep.iclassq.seguridad.aop.AuditoriaAspect.onUpdateInDaoLayer1() and args(record)")
	public void update2(Auditoria record) {
		update(record);
	}
	public void insert(Auditoria record) {
		log.debug("AuditoriaAspect.insert");
		UserSecurity userSecurity = null;
		Authentication authentication = ((SecurityContext)SecurityContextHolder.getContext()).getAuthentication();
		
		Object principal = (authentication!=null?authentication.getPrincipal():null);
		String username = null;
		String remoteAddress = null;
		if(principal != null){
			if (principal instanceof UserSecurity) {
				userSecurity = (UserSecurity)principal;
				username = userSecurity.getUsername();
				remoteAddress =  userSecurity.getRemoteAddress();
			} else {
			  username = principal.toString();
			}	
		}
		
		record.setDesipregistra(remoteAddress);
		if(username!=null && !username.equals("")  && !username.equals("anonymousUser"))
			record.setDesusuregistra(username);
		record.setFecregistra(new Date());
	}
	
	public void update(Auditoria record) {
		log.debug("AuditoriaAspect.update");
		UserSecurity userSecurity = null;
		Authentication authentication = ((SecurityContext)SecurityContextHolder.getContext()).getAuthentication();
		Object principal = (authentication!=null?authentication.getPrincipal():null);
		String username = null;
		String remoteAddress = null;
		if(principal!=null){
			if (principal instanceof UserSecurity) {
				userSecurity = (UserSecurity)principal;
				username = userSecurity.getUsername();
				remoteAddress =  userSecurity.getRemoteAddress();
			} else {
			  username = principal.toString();
			}	
		}
		
		record.setDesipmodifica(remoteAddress);
		if(username!=null && !username.equals("") && !username.equals("anonymousUser"))
			record.setDesusumodifica(username);
		record.setFecmodifica(new Date());
	}
	
	
}