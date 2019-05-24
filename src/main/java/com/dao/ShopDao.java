package com.dao;

import com.vo.*;

import java.util.List;

public interface ShopDao {
    public void InsertShop(Shop shop);
    public void InsertShopSrc(ShopSrc shopSrc);
    public void InsertUserShop(UserShop userShop);
    public List<UserShop> selectShopId(int id);
    public int SelectTotalCount(int id);
    public List<UserShop> SelectPage(PageUse pageUse);
    public int selectShopCount();
    public List<UserShop> selectShopPage(PageUse pageUse);
    public UserShop selectShopid(String shopid);
    public ShopSrc selectShopSrc(String id);
    public void insertCart(C c);
    public List<C> selectCart(int id);
    public List<Location> selectCity();
    public List<Department> selectDepartment(int id);
    public List<Parten> selectParten(int id);
    public void insertOrder(Order order);
    public Location selectAa(int id);
    public Department selectAb(int id);
    public Parten selectAc(int id);
    public List<Order> selectOrder(int id);
    public int selectOrderCount(int id);
    public List<Order> pageOrder(PageUse pageUse);


}
