package pe.gob.ep.iclassq.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Authenticator;
import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;

public class URLConnectionProxy {

    private static final String AGENT = "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)";

    private Proxy proxy;
    public void setProxy(String ip, int port) {
    	this.proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(ip, port));
    }

    public void setProxy(String ip, int port, String username, String password) {
		this.proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(ip, port));
		Authenticator authenticator = new Authenticator() {
	
		    public PasswordAuthentication getPasswordAuthentication() {
			return (new PasswordAuthentication(username, password.toCharArray()));
		    }
		};
		Authenticator.setDefault(authenticator);

    }

    private InputStream getContent(String domain) throws Exception {

	URL url = new URL(domain);
	URLConnection connection = null;
	if (this.proxy != null)
	    connection = url.openConnection(this.proxy);
	else
	    connection = url.openConnection();

	connection.setRequestProperty("User-Agent", AGENT);
	return connection.getInputStream();
    }

    public String getString(String domain) throws Exception {
		InputStream is = getContent(domain);
		StringBuilder sb = new StringBuilder();
	
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String line;
		try {
		    while ((line = br.readLine()) != null) {
			sb.append(line);
		    }
		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
		    /** finally block to close the {@link BufferedReader} */
		    if (br != null) {
			try {
			    br.close();
			} catch (IOException e) {
			    e.printStackTrace();
			}
		    }
		}
		return sb.toString();
    }
}