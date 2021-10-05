package net.servlets.admin;

import java.io.IOException;  
import java.io.PrintWriter;  
import java.util.List;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.classes.ClientBean;
import net.queries.database.DeleteSellerDao;


@WebServlet("/AdminSellerViewDeleteServlet")
public class AdminSellerViewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object username = session.getAttribute("username"); 
        session.setAttribute("username",username);
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();   
        out.print("<html>");
        out.print("<head>");
          out.print("<link rel='stylesheet' type='text/css' href='css/ClientsViewDelete.css'>");

        out.print("<title>Delete client</title>");
        out.print("</head>");
        out.print("<body>");
        out.print("<ul>");
        out.print("<li class='dropdown'>");
        out.print("    <a class='dropbtn'>Register</a>");
        out.print("  <div class='dropdown-content'>");
        out.print("    <a href='admin_register_client.jsp' >Client</a>");
        out.print("    <a href='admin_register_seller.jsp'>Seller</a>");
        out.print("    <a href='admin_register_admin.jsp'>Admin</a>");
        out.print("  </div>");
        out.print("</li>");

        out.print("  <li class='dropdown'>");
        out.print("    <a class='dropbtn'>Edit Profile</a>");
        out.print("  <div class='dropdown-content'>");
        out.print("    <a href='AdminClientsViewServlet' >Client</a>");
        out.print("    <a href='AdminSellersViewServlet'>Seller</a>");
        out.print("  </div>");
        out.print("</li>");

        out.print("  <li class='dropdown'>");
        out.print("    <a  class='dropbtn1'>Delete Profile</a>");
        out.print("    <div class='dropdown-content'>");
        out.print("      <a href='AdminClientsViewDeleteServlet'>Client</a>");
        out.print("      <a class='seller'>Seller</a>");
        out.print("    </div>");
        out.print("  </li>");

        out.print("  <li class='dropdown'>");
        out.print("    <a  class='dropbtn'>Plan</a>");
        out.print("    <div class='dropdown-content'>");
        out.print("      <a href='admin_create_plan.jsp'>Create</a>");
        out.print("      <a href='PlansViewServlet'>Edit</a>");
        out.print("      <a href='PlansViewDeleteServlet'>Delete</a>");
        out.print("    </div>");
        out.print("  </li>");
        out.print("<li>"); 
        out.print("<a href='login.jsp'>Logout</a>");
        out.print("</li>");
        out.print("</ul>");

          out.print("<br>");
          out.print("<br>");
        out.print("<form class='form1'>"); 
        out.print("<div class='container'>");
        out.println("<h1  class='register' >Seller List</h1>");  
        DeleteSellerDao deleteSellerDao = new DeleteSellerDao();
        List<ClientBean> list = deleteSellerDao.getAllSellers();  
        out.print("<table>");  
        out.print("<tr><th>Name</th><th>Surname</th><th>Delete</th></tr>");  
        for(ClientBean e:list) {
        	out.print("<tr><td>"+e.getName()+"</td><td>"+e.getSurname()+"</td><td class='center'><a class='center' href='AdminDeleteSellerServlet?username="+e.getUsername()+"'> <img class='image' src='icons/trush.png'></a></td></tr>");
        }
        out.print("</table>");
        out.print("<br>");
        out.print("</div>");
        out.print("</form>");
        out.close();  
    }  


}
