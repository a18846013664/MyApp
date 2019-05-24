package com.vo;

public class UserShop {
    private int id;
    private String shopid;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid;
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

    @Override
    public String toString() {
        return "UserShop{" +
                "id=" + id +
                ", shopid='" + shopid + '\'' +
                ", shopName='" + shopName + '\'' +
                ", shopSimple='" + shopSimple + '\'' +
                ", shopX='" + shopX + '\'' +
                ", shopPrice=" + shopPrice +
                ", shopFile='" + shopFile + '\'' +
                ", shopSize=" + shopSize +
                '}';
    }
}
