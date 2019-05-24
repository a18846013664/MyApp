package com.vo;

import java.util.List;

public class PageHelp {
    private int currentPage;
    private int pageSize;
    private int totalCount;
    private int totalPage;
    private List<UserShop> userShops;
    private List<Order> orders;

    /**
     * Constructs a new object.
     */
    public PageHelp() {
        super();
    }

    public PageHelp(int currentPage,int pageSize,int totalCount,int totalPage,List<UserShop> userShops) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.userShops = userShops;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
        this.totalPage = this.totalCount%this.pageSize==0?this.totalCount/this.pageSize:this.totalCount/this.pageSize+1;
    }

    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount){
        this.totalCount = totalCount;
    }


    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<UserShop> getUserShops() {
        return userShops;
    }

    public void setUserShops(List<UserShop> userShops) {
        this.userShops = userShops;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
