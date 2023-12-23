/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.shoppingmall;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class CheckLogin extends HttpServlet {

    Connection dbcon;
    DBConGenerator dbGen;
    Statement stmt;
    String username, password, sql, from;
    ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        dbGen = new DBConGenerator();
        dbcon = dbGen.getConnection();
        //取得使用者的帳號密碼
        username =  request.getParameter("username");
        password = request.getParameter("password");
        //把帳號密碼蒐集後變成sql語法
        sql = "Select * from webdb.user where name='"+username+"and passwd='"+password+"';";
        
        try{
        //dbcon取得資料庫連線後創建一個statement物件為stmt, 然後executeQuery把sql指令下達變成rs儲存在ResultSet
            stmt = dbcon.createStatement();
            rs = stmt.executeQuery(sql);
            if(rs.next())
            {
            //這邊rs.next通過代表帳密正確, 新增原本伺服器給的Session一個新屬性username並且賦予username這個值
                session.setAttribute("username",username);
                Object o = session.getAttribute("from");
                if(o != null){
                    from = o.toString();
                    response.sendRedirect(from);
                }
                else{
                //如果造訪者是直接通過網址的方式或駭入的方式近來, 就會被轉到首頁, 
                //dispatcher是把控制權交給指定對象, 這邊是給首頁
                    RequestDispatcher disp = request.getRequestDispatcher("index.html");
                    disp.forward(request,response);
                }
            }
            else
            {
                request.setAttribute("errorlog", "帳號或密碼錯誤");
                request.setAttribute("errmsg","請聯絡客服0800-989-987");
                request.getRequestDispatcher("errorlogin.jsp").forward(request,response);
            }
            rs.close();
            stmt.close();
        }
        catch(Exception e){
        out.print(e.getMessage());
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
