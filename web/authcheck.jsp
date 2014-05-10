<%@ page import="javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession,javax.servlet.http.HttpServletResponse" %>
<%
            HttpSession sn = request.getSession();
           
           Object admin = sn.getAttribute("admin");
           //session.setAttribute("admin","admin");
           if (admin == null) {
               response.sendRedirect("/login.html");
           }
%>