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
        
        <style>
            table {
              border-collapse: collapse;
              width: 85%;
              margin-left: auto;
              margin-right: auto;
            }

            th, td {
              padding: 8px;
              text-align: left;
              border-bottom: 1px solid #ddd;
            }

            tr:hover {background-color:#f5ff5f;}
            
            input[type=button], input[type=submit], input[type=reset] {
              background-color: #00FFFF;
              border: none;
              color: white;
              padding: 16px 32px;
              text-decoration: none;
              margin: 4px 2px;
              cursor: pointer;
            }
        </style>
        
    </head>
    <%!
        Map<String,CartItem> ShopItem = null;
        String pid, pname = null, pscale = null,price = null;
    %>
    <%
        //檢查使用者狀態
        String user = (String)session.getAttribute("username");
        
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
        Map<String,CartItem> Item = (Map<String,CartItem>) session.getAttribute("cart");

    %>
    
    <body>
        <h1>購物車</h1>
        <h2>購物車有<%= ShopItem.size() %>項商品</h2>
        
<!--        如果使用者未登入時會跳出來提醒-->
        <% if(user == null){%>
        <p>尚未登入<button onclick="location.href='Login.jsp'">點我登入</button></p>
        <button onclick="goBack()">回上一頁</button>
        <button onclick="location.href='index.html'">回首頁</button>
        <% } %>
        
<!--        判斷是否有購入商品, if內部有商品-->
        <% if( Item != null && Item.size()>0 ){ %>
        <form action="/ShoppingMall/CheckOut.jsp">
            <table>
             <tr>
                <th>商品編號</th>
                <th>商品名稱</th>
                <th>商品規格</th>
                <th>商品價格</th>
                <th>商品數量</th>
              </tr>
              <% for( String pid: Item.keySet() ){ %>
              <tr>
                <td><%= pid %></td>
                <td><%= Item.get(pid).getProductName()%></td>
                <td><%= Item.get(pid).getProductScale()%></td>
                <td><%= Item.get(pid).getMSRP()%></td>
    <!--            <td><%= Item.get(pid).getQuantity()%></td>-->
                <td><input type="number" id="quantity" name="Quantity" value="<%= Item.get(pid).getQuantity()%>" min="1" max="10"></td>
              </tr> 
              <% } %>
            </table>
            <input type="submit" value="結帳">
        </form>
<!--        <button onclick="location.href='CheckOut.jsp'">結帳</button>-->
        <% }else{ %>
        <h2>此購物車是空的</h2>
        <button onclick="goBack()">回上一頁</button>
        <button onclick="location.href='index.html'">回首頁</button>
<!--        <button onclick="location.href='ProductList.jsp'">回商品列表</button>-->
        <% } %>
        <script>
            function goBack() {
              window.history.back();
            }
        </script>
    </body>
</html>
