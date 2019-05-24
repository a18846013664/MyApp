package com.dao;

import com.vo.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ShopDao")
public class ShopDaoImpl implements ShopDao {
    @Autowired
    private SqlSessionTemplate sqlSession;
    @Override
    public void InsertShop(Shop shop) {
        sqlSession.insert("vo.shopper.InsertShop",shop);
    }

    @Override
    public void InsertShopSrc(ShopSrc shopSrc) {
        sqlSession.insert("vo.shopper.InsertFile",shopSrc);
    }

    @Override
    public void InsertUserShop(UserShop userShop) {
        sqlSession.insert("vo.shopper.InsertUserShop",userShop);
    }

    @Override
    public List<UserShop> selectShopId(int id) {
        List<UserShop> userShops = sqlSession.selectList("vo.shopper.UserShopServlet",id);
        return userShops;
    }

    @Override
    public int SelectTotalCount(int id) {
        int total = sqlSession.selectOne("vo.shopper.getTotalCount",id);
        return total;
    }

    @Override
    public List<UserShop> SelectPage(PageUse pageUse) {
        List<UserShop> userShops = sqlSession.selectList("vo.shopper.page",pageUse);
        return userShops;
    }

    @Override
    public int selectShopCount() {
        int total = sqlSession.selectOne("vo.shopper.shopPageCount");
        return total;
    }

    @Override
    public List<UserShop> selectShopPage(PageUse pageUse) {
        List<UserShop> userShops = sqlSession.selectList("vo.shopper.shopPage",pageUse);
        return userShops;
    }

    @Override
    public UserShop selectShopid(String shopid) {
        UserShop userShop = sqlSession.selectOne("vo.shopper.selectShopOne",shopid);
        return userShop;
    }

    @Override
    public ShopSrc selectShopSrc(String id) {
        return sqlSession.selectOne("vo.shopper.selectShopSrc",id);
    }

    @Override
    public void insertCart(C c) {
        sqlSession.insert("vo.shopper.insertCart",c);
    }

    @Override
    public List<C> selectCart(int id) {
        return sqlSession.selectList("vo.shopper.selectCart",id);
    }

    @Override
    public List<Location> selectCity() {
        return sqlSession.selectList("vo.shopper.selectCity");
    }

    @Override
    public List<Department> selectDepartment(int id) {
        return sqlSession.selectList("vo.shopper.selectDepartment",id);
    }

    @Override
    public List<Parten> selectParten(int id) {
        return sqlSession.selectList("vo.shopper.selectParten",id);
    }

    @Override
    public void insertOrder(Order order) {
         sqlSession.insert("vo.shopper.insertOreder",order);
    }

    @Override
    public Location selectAa(int id) {
        return sqlSession.selectOne("vo.shopper.selectAa",id);
    }

    @Override
    public Department selectAb(int id) {
        return sqlSession.selectOne("vo.shopper.selectAb",id);
    }

    @Override
    public Parten selectAc(int id) {
        return sqlSession.selectOne("vo.shopper.selectAc",id);
    }

    @Override
    public List<Order> selectOrder(int id) {
        return sqlSession.selectList("vo.shopper.selectOrder",id);
    }

    @Override
    public int selectOrderCount(int id) {
        return sqlSession.selectOne("vo.shopper.orderSize",id);
    }

    @Override
    public List<Order> pageOrder(PageUse pageUse) {
        List<Order> orders = sqlSession.selectList("vo.shopper.pageOrder",pageUse);
        return orders;
    }
}
