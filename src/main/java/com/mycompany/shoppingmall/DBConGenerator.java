/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.shoppingmall;
import java.sql.*;
/**
 *
 * @author student
 */
public class DBConGenerator {

    String username="root";
    String passwd="12345";
    String cstring = "jdbc:mariadb://127.0.0.1/webdb";
//    這邊使用建構元是為了初始化物件(驅動程式 也就是reset), 這邊的用法是確保驅動程式能夠正確地被加載
    public DBConGenerator() {
        try{
//            這邊是註冊驅動程式
            Class.forName("org.mariadb.jdbc.Driver");            
        }catch(Exception e ) {            
        }
    }
//    這是一個叫做getConnection的fuction, 而Connection是JAVA的介面, 
//    它是用來建立與資料庫的連接並提供操作資料庫的方法,cstring是資料庫連接字串
//    DriverManager, 用來建立資料庫的連線, 也是JDBC API的一個主要類別, 他也可以處理已註冊的 JDBC 驅動程式列表
    public Connection getConnection() {
        Connection con;
        try{
            con = DriverManager.getConnection(cstring,username,passwd);
            return con;
        } catch( Exception e) {
            return null;
        }        
    } 
}
