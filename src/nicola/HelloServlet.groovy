package nicola

import javax.servlet.http.*

class HelloServlet extends HttpServlet {
	
	@Override
	void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		def out = res.getOutputStream();
		out.write("ok".getBytes("UTF-8"));
		out.flush();
		out.close();
	}
}