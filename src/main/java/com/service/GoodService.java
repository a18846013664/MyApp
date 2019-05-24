package com.service;

import com.vo.*;

import java.util.List;

public interface GoodService {
    public void saveShop(Shop shop);
    public void saveSrc(ShopSrc shopSrc);
    public void saveUserShop(UserShop userShop);
    public List<UserShop> getUserShopId(int id);
    public int getTotalPage(int id);
    public List<UserShop> pageUse(PageUse pageUse);
    public int shopPageCount();
    public List<UserShop> shopPage(PageUse pageUse);
    public UserShop shopOne(String shopid);
    public ShopSrc shopSrc(String id);
    public void insertCart(C c);
    public List<C> selectCart(int id);
    public List<Location> selectCity();
    public List<Department> selectDepartment(int id);
    public List<Parten> selectParten(int id);
    public void insertOreder(Order order);
    public Location selectAa(int id);
    public Department selectAb(int id);
    public Parten selectAc(int id);
    public List<Order> selectOrder(int id);
    public int orderSize(int id);
    public List<Order> orderPage(PageUse pageUse);

}
