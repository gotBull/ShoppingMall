<%-- 
    Document   : errorlogin
    Created on : 2023年12月23日, 下午6:15:46
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3> <% request.getAttribute("errorlog"); %> </h3>
        <h3> <% request.getAttribute("errmsg"); %> </h3>
    </body>
</html>
