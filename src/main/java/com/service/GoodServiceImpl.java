package com.service;

import com.dao.ShopDao;
import com.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodService")
public class GoodServiceImpl implements GoodService {
    @Autowired
    private ShopDao shopDao;
    @Override
    public void saveShop(Shop shop) {
        shopDao.InsertShop(shop);
    }

    @Override
    public void saveSrc(ShopSrc shopSrc) {
        shopDao.InsertShopSrc(shopSrc);
    }

    @Override
    public void saveUserShop(UserShop userShop) {
        shopDao.InsertUserShop(userShop);
    }

    @Override
    public List<UserShop> getUserShopId(int id) {
        List<UserShop> userShops = shopDao.selectShopId(id);
        return userShops;
    }

    @Override
    public int getTotalPage(int id) {
        return shopDao.SelectTotalCount(id);
    }

    @Override
    public List<UserShop> pageUse(PageUse pageUse) {
        return shopDao.SelectPage(pageUse);
    }

    @Override
    public int shopPageCount() {
        return shopDao.selectShopCount();
    }

    @Override
    public List<UserShop> shopPage(PageUse pageUse) {
        return shopDao.selectShopPage(pageUse);
    }

    @Override
    public UserShop shopOne(String shopid) {
        return shopDao.selectShopid(shopid);
    }

    @Override
    public ShopSrc shopSrc(String id) {
        return shopDao.selectShopSrc(id);
    }

    @Override
    public void insertCart(C c) {
        shopDao.insertCart(c);
    }

    @Override
    public List<C> selectCart(int id) {
        return shopDao.selectCart(id);
    }

    @Override
    public List<Location> selectCity() {
        return shopDao.selectCity();
    }

    @Override
    public List<Department> selectDepartment(int id) {
        return shopDao.selectDepartment(id);
    }

    @Override
    public List<Parten> selectParten(int id) {
        return shopDao.selectParten(id);
    }

    @Override
    public void insertOreder(Order order) {
        shopDao.insertOrder(order);
    }

    @Override
    public Location selectAa(int id) {
        return shopDao.selectAa(id);
    }

    @Override
    public Department selectAb(int id) {
        return shopDao.selectAb(id);
    }

    @Override
    public Parten selectAc(int id) {
        return shopDao.selectAc(id);
    }

    @Override
    public List<Order> selectOrder(int id) {
        return shopDao.selectOrder(id);
    }

    @Override
    public int orderSize(int id) {
        return shopDao.selectOrderCount(id);
    }

    @Override
    public List<Order> orderPage(PageUse pageUse) {
        return shopDao.pageOrder(pageUse);
    }
}