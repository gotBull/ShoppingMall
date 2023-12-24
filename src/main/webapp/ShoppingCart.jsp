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
        if (ShopItem.containsKey(pid)) {
            // 商品已存在，取出原有CartItem
            CartItem existingItem = ShopItem.get(pid);
            existingItem.setQuantity(existingItem.getQuantity() + 1);
            // 進行數量的增加或其他操作，這裡你可以自行定義

            // 更新購物車中的商品
            ShopItem.put(pid, existingItem);
        } else {
            // 商品不存在，新增CartItem
            CartItem newItem = new CartItem(pname, pscale, price);
            newItem.setProductName(pname);
            newItem.setProductScale(pscale);
            newItem.setMSRP(price);
            newItem.setQuantity(1);
            // 放入購物車
            ShopItem.put(pid, newItem);
        } 
    %>
    
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
