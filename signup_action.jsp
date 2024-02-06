<%-- 
    Document   : signup_action
    Created on : Oct 3, 2023, 3:27:14 PM
    Author     : mohamed irfaan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","Irfaan@779");
            Statement st = con.createStatement();
            int x = st.executeUpdate("insert into luxecart_users values('"+name+"','"+email+"','"+password+"')");
            session.setAttribute("current_user",email);
            %>
            <jsp:forward page="index.jsp"/>
            <%
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        }
    %>
</html>
