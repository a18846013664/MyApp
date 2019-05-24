package com.vo;

public class Shop {
    private String id;
    private String shopName;
    private String shopSimple;
    //商品类型
    private String shopX;
    private double shopPrice;
    private String shopFile;
    private int shopSize;

    public int getShopSize() {
        return shopSize;
    }

    public void setShopSize(int shopSize) {
        this.shopSize = shopSize;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopSimple() {
        return shopSimple;
    }

    public void setShopSimple(String shopSimple) {
        this.shopSimple = shopSimple;
    }

    public String getShopX() {
        return shopX;
    }

    public void setShopX(String shopX) {
        this.shopX = shopX;
    }

    public double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public String getShopFile() {
        return shopFile;
    }

    public void setShopFile(String shopFile) {
        this.shopFile = shopFile;
    }
}
