package pe.gob.ep.iclassq.filter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import pe.gob.ep.iclassq.seguridad.bean.UserSecurity;
import pe.gob.ep.iclassq.util.SucursalHolder;

public class CustomAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	
	@Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException  {
		String username = obtainUsername(request);
        String password = obtainPassword(request);

        if (username == null) {
            username = "";
        }
        if (password == null) {
            password = "";
        }
        username = username.trim();

        String sucursalParam = request.getParameter("sucursal");
        Integer idSucursal = 0;
        if (sucursalParam != null && !sucursalParam.trim().isEmpty()) {
            try {
                idSucursal = Integer.parseInt(sucursalParam.trim());
            } catch (NumberFormatException e) {
                idSucursal = 0;
            }
        }
        SucursalHolder.setSucursal(idSucursal);

        // Crear el token de autenticación
        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
        setDetails(request, authRequest);
        return this.getAuthenticationManager().authenticate(authRequest);
    }
}
