package pe.gob.ep.iclassq.seguridad.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class ValidacionAspect {
	
	 @Pointcut("@target(org.springframework.stereotype.Controller)")
	    public void controllerPointcutter() {
	 }

	    @Pointcut("execution(* *(..))")
	    public void methodPointcutter() {}

	    @Before("controllerPointcutter()")
	    public void beforeMethodInController(JoinPoint jp){
	        System.out.println("### before controller call...");
	    }

	    @AfterReturning("controllerPointcutter() && methodPointcutter() ")
	    public void afterMethodInController(JoinPoint jp) {
	        System.out.println("### after returning...");
	    }

	    @Before("methodPointcutter()")
	    public void beforeAnyMethod(JoinPoint jp){
	        System.out.println("### before any call...");
	    }
}
