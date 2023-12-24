/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.shoppingmall;

/**
 *
 * @author student
 */

public class CartItem{
//    private String productCode;
    private String productName;
    private String productScale;
    private String MSRP;
    private int quantity;

//    public void setProductCode(String productCode) {
//        this.productCode = productCode;
//    }

    public CartItem(String productName, String productScale, String MSRP) {
        this.productName = productName;
        this.productScale = productScale;
        this.MSRP = MSRP;
        this.quantity = 0;
    }
    
    public void setQuantity(int quantity) {
    // 此處你可以進行一些數量的合法性檢查
        this.quantity = quantity;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setProductScale(String productScale) {
        this.productScale = productScale;
    }

    public void setMSRP(String MSRP) {
        this.MSRP = MSRP;
    }

//    public String getProductCode() {
//        return productCode;
//    }

    public String getProductName() {
        return productName;
    }

    public String getProductScale() {
        return productScale;
    }

    public String getMSRP() {
        return MSRP;
    }
    public int getQuantity() {
        return this.quantity;
    }
}    
//    public Map<String, Object> toMap(){
//        Map<String, Object> map = new HashMap<>();
//        map.put("productCode",this.productCode);
//        map.put("productName",this.productName);
//        map.put("productScale",this.productScale);
//        map.put("MSRP",this.MSRP);   
//        return map;
//    }
    
//public class CartItem {
//    String productCode;
//    String productName;
//    String productScale;
//    double MSRP;
//    
//    public CartItem(String productCode, String productName, String productScale, double MSRP)
//    {
//        this.productCode = productCode;
//        this.productName = productName;
//        this.productScale = productScale;
//        this.MSRP = MSRP;
//    }
//
//    public void setProductCode(String productCode) {
//        this.productCode = productCode;
//    }
//
//    public void setProductName(String productName) {
//        this.productName = productName;
//    }
//
//    public void setProductScale(String productScale) {
//        this.productScale = productScale;
//    }
//
//    public void setMSRP(double MSRP) {
//        this.MSRP = MSRP;
//    }
//
//    public String getProductCode() {
//        return productCode;
//    }
//
//    public String getProductName() {
//        return productName;
//    }
//
//    public String getProductScale() {
//        return productScale;
//    }
//
//    public double getMSRP() {
//        return MSRP;
//    }   
//}
