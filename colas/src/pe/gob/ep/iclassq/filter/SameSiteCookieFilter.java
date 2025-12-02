package pe.gob.ep.iclassq.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class SameSiteCookieFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
				throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		boolean isSecure = httpRequest.isSecure() || 
                "https".equalsIgnoreCase(httpRequest.getScheme()) ||
                "443".equals(String.valueOf(httpRequest.getServerPort()));
		
		HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(httpResponse) {
			@Override
			public void addHeader(String name, String value) {
				if ("Set-Cookie".equalsIgnoreCase(name) && value.contains("JSESSIONID")) {
					value = addSameSiteAttribute(value, isSecure);
				}
				super.addHeader(name, value);
			}
			
			@Override
			public void setHeader(String name, String value) {
				if ("Set-Cookie".equalsIgnoreCase(name) && value.contains("JSESSIONID")) {
					value = addSameSiteAttribute(value, isSecure);
				}
				super.setHeader(name, value);
			}
			
			private String addSameSiteAttribute(String cookie, boolean secure) {
				if (cookie.contains("JSESSIONID")) {
                    // Para HTTPS (producción)
                    if (secure) {
                        if (!cookie.contains("SameSite=")) {
                            cookie += "; SameSite=Lax";
                        }
                        if (!cookie.contains("Secure")) {
                            cookie += "; Secure";
                        }
                    } 
                    // Para HTTP (desarrollo)
                    else {
                        if (!cookie.contains("SameSite=")) {
                            cookie += "; SameSite=Lax";
                        }
                    }
                    
                    if (!cookie.contains("HttpOnly")) {
                        cookie += "; HttpOnly";
                    }
                }
                return cookie;
			}
		};
		
		chain.doFilter(request, responseWrapper);
	}
	
	@Override
	public void destroy() {}
}
