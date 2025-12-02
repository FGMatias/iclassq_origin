<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.DriverManager" %>


<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="es"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="es"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="es"> <![endif]-->
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>::ICLASSQ:: Software de Tickets</title>
<!-- Estilos Login -->
  <link rel="stylesheet" href="librerias/acceso/css/loginStyle.css" />
<!-- Estilos Login -->
 

<!-- Generic -->
<link rel="stylesheet" href="librerias/css/genericStyle.css" />
<script src="librerias/essalud/js/jquery.min.js"></script>
<script src="librerias/libBase/common/Util.js"></script>
<!-- Generic -->

  <script src="librerias/libBase/common/selectize.min.js"></script>
  <link rel="stylesheet" href="librerias/libBase/common/selectize.css" />
  <script src="librerias/essalud/css/boostrap.min.css"></script>
  <script src="librerias/acceso/css/ext-all.css"></script>
  
  <script src="librerias/acceso/js/ext-all.js"></script>
  <script src="librerias/acceso/js/loginIp.js"></script>
  
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  
</head>
<body>

   <section class="container">
    <div class="login" id="loginPanel">
		<%
			String IP;
			IP=java.net.InetAddress.getLocalHost().getHostAddress();
		%>    
      <h1>ICLASSQ v.3.6 IP - <%=IP%> </h1>
	  <b><span style="font-size:20px" id="ipcliente"><%=IP%></span></b>
      <div style="width: 50%;float:left;">
      <img src="librerias/imagenes/essalud.png" style="width: 230px;height: 230px;margin: 0px 0px 0px 45px;">
      </div>
      <div style="width: 50%;float:left;">
        <form action="<c:url value='/j_security_check_for_standar'/>" method="post" id="j_form_login">
        <p><input  type="text" name="j_username" id="j_username" class="inputLogin" placeholder="Usuario" required></p>
        <p class="remember_me">
        <span style="color: red;" id="messageValidation" ></span>
        <c:choose>
	        	<c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials'}">
	        		<span class="errorlogin" ><spring:message code="login.error.badcredentials"/> </span>
	            </c:when>
	            <c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User not found'}">
	            	<span class="errorlogin" ><spring:message code="login.error.notfound"/></span>
	            </c:when>
	            <c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Maximum sessions of 1 for this principal exceeded'}">
	                <span class="errorlogin" ><spring:message code="login.error.maximum"/></span>
	            </c:when>
	            <c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User is disabled'}">
	                <span class="errorlogin" ><spring:message code="login.error.disabled"/></span>
	            </c:when>
	         </c:choose>
         
        </p>
        <p class="submit"><input type="button" name="commit" value="Acceder"></p>
      </form> 
      </div>
    </div>
  </section>
  
</body>
<script type="text/javascript">
$(document).ready(function() {	
	var pip=$("#ipcliente").text();

	console.log("Ip obtenido"+pip);

	$.ajax({
		type: 'POST',
		url: 'getIpAcceso.app',
		data: {pip: pip},
		success: function (response) {
			var data = response.data;
			if(data.iUsuarioId>0){
				$("#j_username").val(data.vUsuarioUsername);
				var idUsuario=data.iUsuarioId;
				var iRolEquipo=data.iRolEquipo;
				console.log(data.vUsuarioUsername);
				//window.location.href = 'main.app?usuario='+idUsuario;

			}			
		}
	});	
	
});
</script>
</html>
