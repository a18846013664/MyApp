package com.vo;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    //总计/积分
    private double total = 0;
    //个数不确定的购物项
    private List<CartItem> list = new ArrayList<CartItem>();

    //添加购物项到购物车
    //当用户点击加入购车后，可以将当前要购买的商品id，商品数量发送到服务器服务端根据商品id查询到商品信息
    //有了商品userShop对象，有了购买商品数量，当前的购物项也就获取到了
    public void addCartItemToCart(CartItem cartItem){
        //将当前的购物项加入购物车之前，判断之前是否买过这类商品
        //如果没有买过 list.add(cartItem)
        //如果买过；获取到原先的数量，获取到本次数量，相加之后设置到原先的购物项
        //设置变量
        boolean flag = false;
        //存储原先的购物项
        CartItem old = null;
        for (CartItem cartItem2:list){
            if(cartItem2.getUserShop().getShopid().equals(cartItem.getUserShop().getShopid())){
                flag = true;
                old = cartItem2;
            }
        }
        if (flag == false){
            list.add(cartItem);
        }
        else {
            //获取到原先的数量，获取到本次的数量，相加之后设置到原先的购物项上
            old.setNum(old.getNum()+cartItem.getNum());
        }
    }

    //移除购物项
    //用户点击移除购物想链接，可以将当前的购物类别的商品id发送到服务端
    public void removeCartItem( String shopid){
    //遍历list，看每个CartItem上的usershop对象上的id是否和服务端获取的shopid相等，如果想等，删除当前购物项
    for(int i = 0 ; i < list.size() ; i++){
        if (list.get(i).getUserShop().getShopid().equals(shopid)){
            //删除当前的cartItem;
            //直接调用list.remove(cartItem);无法删除当前的cartItem需要通过迭代器删除
            list.remove(list.get(i));
        }
    }
    }
    //清空购物车
    public void clearCart(){
        list.clear();
    }
    //总计可以经过计算
    public double getTotal() {
        total = 0;
        for (CartItem cartItem :list){
            total += cartItem.getSubTotal();
        }
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List<CartItem> getList() {
        return list;
    }

    public void setList(List<CartItem> list) {
        this.list = list;
    }
}
