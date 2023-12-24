<%-- 
    Document   : CheckOut
    Created on : 2023年12月24日, 下午10:32:55
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<style>
            input[type=text], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
          }

          input[type=submit] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
          }

          input[type=submit]:hover {
            background-color: #45a049;
          }

          div {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
          }
          
          .container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
</style>
    </head>
    <%
        //沒登入=否 等於 已經登入
        boolean notLogin = false;
        String member = null;
        if( session.getAttribute("username")==null ){
            notLogin = true;
        }
        else{
            member = session.getAttribute("username").toString();
        }
        
    %>
    <body>
        <h1>結帳</h1>
        <div>
            <form action="/LoginDemo/OrderProcess">
              <label for="recipient">收件人</label>
              <input type="text" id="recipient" name="recipient" placeholder="Your name..">

                  <div id="customModal" style="display: block; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; padding: 20px; border: 1px solid black;">
                    <p>尚未登入，將在<span id="countdown">5</span>秒後送往登入頁面</p>
                    </div>
              
              <label for="address">地址</label>
              <input type="text" id="address" name="address" placeholder="宅配請輸入您的收貨地址">
              <h5>付款方式</h5>
              <label class="container">ATM轉帳
                  <input type="radio" checked="checked" name="payment" value="a">
                  <span class="checkmark"></span>
                </label>
                <label class="container">貨到付款
                  <input type="radio" name="payment" value="b">
                  <span class="checkmark"></span>
                </label>
                <label class="container">超商繳費
                  <input type="radio" name="payment" value="c">
                  <span class="checkmark"></span>
                </label>
                <label class="container">線上刷卡
                  <input type="radio" name="payment" value="d">
                  <span class="checkmark"></span>
                </label>

              <label for="shipping">出貨方式</label>
              <select id="shipping" name="shipping">
                <option value="post">宅配(貨到付款)</option>
                <option value="family">全家</option>
                <option value="711">7-11</option>
              </select>

              <input type="submit" value="送出訂單">
            </form>
        </div>
        <% if(notLogin){%>
        <script>
            
                var countdown = 5;
                var counting = window.setInterval(function() {
                    document.getElementById("countdown").innerHTML = countdown;
                    if (countdown-- == 0) {
                        window.clearInterval(counting);
                        location.href = 'Login.jsp';
                    }
                }, 1000);

                // 使用 setTimeout 在 5 秒後自動執行
                setTimeout(function() {
                    window.clearInterval(counting);
                    location.href = 'Login.jsp';
                }, 5000);
            
        </script>
        <%}%>
    </body>
</html>
