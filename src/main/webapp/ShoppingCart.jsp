<%-- 
    Document   : ShoppingCart
    Created on : 2023年12月22日, 下午4:13:23
    Author     : student
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.mycompany.shoppingmall.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        Map<String,CartItem> ShopItem = null;
        String pid = null, pname = null, pscale = null,price = null;
    %>
    <%
        ShopItem = (Map<String,CartItem>) session.getAttribute("cart");
//        確認有沒有購物車, 如果沒有就給他一個
        if(ShopItem==null)
        {
            ShopItem = new HashMap<>();
            session.setAttribute("cart", ShopItem);
        }
        pid = request.getParameter("pid");
        pname = request.getParameter("pname");
        pscale = request.getParameter("pscale");
        price = request.getParameter("price");
        //檢查商品是否已經放入購物車
        if(ShopItem.size()==0){
 //           CartItem citem = new CartItem(pid,pname,pscale,1); 
            
        }
    
    %>
    
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
