package com.vo;

public class CartItem {
    //携带购物项的参数
    private UserShop userShop;
    //当前类别商品数量
    private int num;
    //小计
    private double subTotal;

    private int userid;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public UserShop getUserShop() {
        return userShop;
    }

    public void setUserShop(UserShop userShop) {
        this.userShop = userShop;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
    //小计是经过计算可以获取到的
    public double getSubTotal() {
        return userShop.getShopPrice()*num;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }
}
