<%-- 
    Document   : Login
    Created on : 2023年12月23日, 上午9:38:32
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
        <h1>登入會員</h1>
        <form method="post" action="CheckLogin">
            帳號:<br/>
            <input type="text" name="username" value="" /><br/>
            密碼:<br/>
            <input type="password" name="password" value="" /><br/>
            <input type="submit" value="登入" />
            <input type="reset" value="清除" />            
        </form>    
    </body>
</html>
