package com.vo;

public class ShopCar {
    private int id;
    private int userid;
    private String shopid;
    private String shopName;
    private String shopSimple;
    private String shopX;
    private int shopSize;
    private double shopPrice;
    private String shopFile;

    public String getShopFile() {
        return shopFile;
    }

    public void setShopFile(String shopFile) {
        this.shopFile = shopFile;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
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

    public int getShopSize() {
        return shopSize;
    }

    public void setShopSize(int shopSize) {
        this.shopSize = shopSize;
    }

    public double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(double shopPrice) {
        this.shopPrice = shopPrice;
    }

    @Override
    public String toString() {
        return "ShopCar{" +
                "id=" + id +
                ", userid=" + userid +
                ", shopid='" + shopid + '\'' +
                ", shopName='" + shopName + '\'' +
                ", shopSimple='" + shopSimple + '\'' +
                ", shopX='" + shopX + '\'' +
                ", shopSize=" + shopSize +
                ", shopPrice=" + shopPrice +
                ", shopFile='" + shopFile + '\'' +
                '}';
    }
}
