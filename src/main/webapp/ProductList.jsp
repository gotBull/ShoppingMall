<%-- 
    Document   : ProductList
    Created on : 2023年12月22日, 下午12:47:32
    Author     : student
--%>

<%@page import="java.sql.Statement"%>
<%@page import="com.mycompany.shoppingmall.DBConGenerator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
            table, th, td {
              border: 1px solid black;
              padding: 5px;
            }
            table {
              border-spacing: 15px;
            }
            #customers tr:nth-child(even){background-color: #f2f2f2;}

            #customers tr:hover {background-color: #ddd;}

            #customers th {
              padding-top: 12px;
              padding-bottom: 12px;
              text-align: left;
              background-color: #04AA6D;
              color: white;
            }
        </style>
    </head>
    <%! 

//        ResultSet 是 Java 中用於存放資料庫查詢結果的介面（Interface），
//        它用來遍歷或檢索資料庫的結果。
        java.sql.ResultSet rs = null, chqty = null;
        Statement stmt = null;
        String shoppingUrl = "#", productLine = null;
        int count = 0;
    %>
    <%
//        擷取前面商品清單的選擇, 他不一定是數字, 如果p1是null情況, 他就會是字串, 因此先定義為字串, 後面用if去判斷如果非null再轉數字
        String choose = request.getParameter("pl");
        int plType=0;
        if(choose==null){ plType=1; }
        else{ plType = Integer.parseInt(choose); }

//        選好要看的商品清單後就要去查訊資料庫
        String sql = "Select * from classicmodels.products where productLine=";
//        將要抓資料庫的指令獨立分開, 以便之後的更改方便
        DBConGenerator dbg = new DBConGenerator();
        stmt = dbg.getConnection().createStatement();
//         再來要依據選擇的清單在sql語法後面加上選擇的清單編號, 前面已經把p1的數值先轉成字串又轉回數字後放在p1Type裡面
        
        switch(plType){
            case 1 :
                productLine = "Classic Cars";
                sql = sql + "'"+productLine+"'";
                break;
            case 2 :
                productLine = "Motorcycles";
                sql = sql + "'"+productLine+"'";
                break;
            case 3 :
                productLine = "Vintage Cars";
                sql = sql + "'"+productLine+"'";
                break;
            case 4 :
                productLine = "Trucks and Buses";
                sql = sql + "'"+productLine+"'";
                break;
            case 5 :
                productLine = "Trains";
                sql = sql + "'"+productLine+"'";
                break;
            case 6 :
                productLine = "Ships";
                sql = sql + "'"+productLine+"'";
                break;
            case 7 :
                productLine = "Planes";
                sql = sql + "'"+productLine+"'";
                break;
        }
        String chooseQty = "Select count(*) from classicmodels.products where productLine ='"+ productLine+"';";
//        現在我們得到了資料庫的查詢結果, 然後我們需要使用ResultSet來存放他們
            try{ rs = stmt.executeQuery(sql);
                chqty = stmt.executeQuery(chooseQty);
                
                if(chqty.next())
                {
                    count = chqty.getInt(1);
                }
                chqty.close();
        }
            catch(Exception e){}
    %>
    <body>
        <h1>查詢<%= productLine %>的結果共<%= count %>筆</h1>
        <h2><%= choose %></h2>
        <button onclick="location.href='index.html'">回首頁</button>
        <button onclick="location.href='ShoppingCart.jsp'">回到購物車</button>
        <button onclick="location.href='CheckOut.jsp'">結帳</button>
        <table style="width:100%" id="customers">     
            <tr>
              <th>產品代號</th>
              <th>產品名稱</th> 
              <th>模型比例</th>
              <th>庫存數量</th>
              <th>售價</th>
              <th>購物</th>
            </tr>
<!--            這邊要寫個讓商品列表不斷往下寫的迴圈, 然後也要確保迴圈OK,所以要加try-->
                <%
                    try{
//                    這邊re.next的寫法是確認往下是否有值,如果有就會繼續列印
                    while(rs.next())
                    {
                    shoppingUrl = "ShoppingCart.jsp?"+"pid="+rs.getString("productCode")+
                    "&pname=" + rs.getString("productName") + "&pscale=" + rs.getString("productScale")+
                    "&price=" + rs.getBigDecimal("MSRP").toString(); 
                %>
            <tr>
              <td><%= rs.getString("productCode") %></td>
              <td><%= rs.getString("productName") %></td>
              <td><%= rs.getString("productScale") %></td>
              <td><%= rs.getInt("quantityInStock") %></td>
              <td><%= rs.getBigDecimal("MSRP").toString() %></td>
              <td><a href="<%= shoppingUrl %>">加入購物</a> </td>
            </tr>
                
            <%
            //釋放記憶體資源
            rs.close();
            stmt.close();
                }   //這個是while的括號
            }       //這個是try的括號
            catch(Exception e){}
            %>
            
        </table>>
    </body>
</html>
