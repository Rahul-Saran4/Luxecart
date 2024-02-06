<%-- 
    Document   : login_action
    Created on : Oct 3, 2023, 3:25:28 PM
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
        String password = request.getParameter("password");
        try{
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","Irfaan@779");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select 1 from luxecart_users where email='"+name+"' and password='"+password+"'");
        int x=0;
        while(rs.next())
        {
            x=rs.getInt(1);
        }
        if(x==1){
        session.setAttribute("current_user",name);
    %>
    <script>
        window.location.href="index.jsp";
    </script>
        <%} 
else{
out.println(x);
}
}
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
    %>
    <body>
        <h1>Invalid username and password combination</h1>
    </body>
</html>
