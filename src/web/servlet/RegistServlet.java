package web.servlet;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistServlet extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username=request.getParameter("username");
		String password1=request.getParameter("password1");
		String password2=request.getParameter("password2");

		String s1="[a-zA-Z]([a-zA-Z0-9]{5,})";//需要以字母开头后跟字母或数字长度至少6位
		String s2="[0-9]{6,10}";//全数字且长度在6-10位
		if(!(Pattern.matches(s1,username))){
			response.getWriter().print("1");
		}else if (!(password1.equals(password2))){
			response.getWriter().print("2");
		}else if(!(Pattern.matches(s2,password1))){
			response.getWriter().print("3");
		}
	}

}
