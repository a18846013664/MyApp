package com.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.GoodService;
import com.service.UserService;
import com.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class ShopController {
    @Autowired
    private GoodService goodService;
    @Autowired
    private UserService userService;
    final String a="load/A";
    final String userShop = "user/userShop";
    final String shopPage = "user/enterShop";
    final String shopOperate = "user/shopOperate";
    final String enter = "user/enterShopUser";
    final String carts = "user/cart";
    final String buys = "buy/buy";
    final String Dd = "buy/dingD";
    final String od = "buy/myOrder";
    final String jsd = "user";
    @RequestMapping(value = "/a/upShop",method = RequestMethod.POST)
    public String shopUp(@RequestParam("uid") int uid,
                         @RequestParam("files") MultipartFile []file,
                         @RequestParam("shopName") String shopName,
                         @RequestParam("shopSimple") String shopSimple,
                         @RequestParam("shopX") String shopX,
                         @RequestParam("shopPrice") double shopPrice,
                         @RequestParam("shopSize") int shopSize, HttpSession session){
        UserShop userShop = new UserShop();
        System.out.println("uid========================================="+uid);
        String id = UUID.randomUUID().toString();
        Shop shop = new Shop();
        shop.setId(id);
        shop.setShopName(shopName);
        shop.setShopSimple(shopSimple);
        shop.setShopX(shopX);
        shop.setShopPrice(shopPrice);
        shop.setShopSize(shopSize);
        String fileName = "";
        if(file.length>0&&file!=null){
            System.out.println("进入我这里");
            for (int i = 0 ; i < file.length ; i++){
                String originalFilename = file[i].getOriginalFilename();
                String dirPath = session.getServletContext().getRealPath("/") + "uploaddir/";
                File file1 = new File(dirPath);
                if (!file1.exists()) {
                    file1.mkdirs();
                }
                String newFilename = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
                if (i == 0){
                    shop.setShopFile(newFilename);
                    userShop.setShopFile(newFilename);
                }
                fileName = fileName + newFilename+"/";
                System.out.println("文件名"+newFilename);
                try {
                    file[i].transferTo(new File(dirPath+newFilename));
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            goodService.saveShop(shop);
            ShopSrc shopSrc = new ShopSrc();
            shopSrc.setId(id);
            shopSrc.setHeadfile(fileName);
            goodService.saveSrc(shopSrc);
            userShop.setId(uid);
            userShop.setShopid(id);
            userShop.setShopName(shopName);
            userShop.setShopSimple(shopSimple);
            userShop.setShopX(shopX);
            userShop.setShopPrice(shopPrice);
            userShop.setShopSize(shopSize);
            goodService.saveUserShop(userShop);
        }
        return jsd;
    }
@RequestMapping(value = "/a/page",method = RequestMethod.GET)
public String Page(@RequestParam(value = "currentPage") int currentPage,HttpSession session,HttpServletRequest request){
    User user = (User)session.getAttribute("jsp");
    int id = user.getId();
    int count = goodService.getTotalPage(id);
    System.out.println("==============================================="+count);
    PageUse pageUse = new PageUse();
    PageHelp pageHelp = new PageHelp();
    pageHelp.setTotalCount(count);
    pageHelp.setCurrentPage(currentPage);
    int pageSize = 4;
    pageHelp.setPageSize(pageSize);
    int pageStart = currentPage*pageSize;
    System.out.println("pageStart:"+pageStart);
    pageUse.setPageNow(pageStart);
    pageUse.setPageEnd(pageSize);
    pageUse.setId(id);
    List<UserShop> userShops = goodService.pageUse(pageUse);
    int totalPage = count/pageSize;
    System.out.println("count/pageSize================================="+count/pageSize);
    pageHelp.setTotalPage(totalPage);
    System.out.println("useShopSize================================:"+userShops.size());
    pageHelp.setUserShops(userShops);
    session.setAttribute("p",pageHelp);
    return userShop;
}
@RequestMapping(value = "/a/shopPage")
public String shopPage(@RequestParam(value = "currentPage") int currentPage,HttpSession session){
    int count = goodService.shopPageCount();
    System.out.println("==============================================="+count);
    PageUse pageUses = new PageUse();
    PageHelp pageHelps = new PageHelp();
    pageHelps.setTotalCount(count);
    pageHelps.setCurrentPage(currentPage);
    int pageSize = 12;
    pageHelps.setPageSize(pageSize);
    int pageStart = currentPage*pageSize;
    System.out.println("pageStart:"+pageStart);
    pageUses.setPageNow(pageStart);
    pageUses.setPageEnd(pageSize);
    List<UserShop> userShops = goodService.shopPage(pageUses);
    int totalPage = count/pageSize;
    System.out.println("count/pageSize================================="+count/pageSize);
    pageHelps.setTotalPage(totalPage);
    System.out.println("useShopSize================================:"+userShops.size());
    pageHelps.setUserShops(userShops);
    session.setAttribute("pp",pageHelps);
    return shopPage;
}
@RequestMapping(value = "/a/shopOperate",method = RequestMethod.GET)
public String shopOperate(@RequestParam(value = "shopid") String shopid,HttpSession session){
        UserShop userShop = goodService.shopOne(shopid);
        ShopSrc shopSrc = goodService.shopSrc(shopid);
        String[] a = shopSrc.getHeadfile().split("/");
        System.out.println("=================================="+a.length);
        List<String> shopSrcs = new ArrayList<String>();
        for (int i = 0 ; i < a.length ; i++){
            shopSrcs.add(a[i]);
        }
        session.setAttribute("shop",userShop);
        session.setAttribute("shopSrcs",shopSrcs);
        return shopOperate;
}
@RequestMapping(value = "/a/shopEnterss",method = RequestMethod.GET)
public String shopUsersa(@RequestParam("currentPage") int currentPage,HttpSession session){
    UserShop shopUsers = (UserShop) session.getAttribute("shop");
    System.out.println(shopUsers.getShopid()+"=====================================================usershop");
    System.out.println("======================usershop"+shopUsers.getShopid());
    String shopid = shopUsers.getShopid();
    System.out.println("=======================shopid="+shopid);
    UserShop shopUser = goodService.shopOne(shopid);
    System.out.println("shopUser == == == == =="+shopUser.getId());

    int id = shopUser.getId();
    System.out.println("id=====================id=:"+id);
    User user = userService.SelectById(id);
    session.setAttribute("ju",user);
    System.out.println("user=========================================="+id);
    int count = goodService.getTotalPage(id);
    System.out.println("==============================================="+count);
    PageUse pageUse = new PageUse();
    PageHelp pageHelp = new PageHelp();
    pageHelp.setTotalCount(count);
    pageHelp.setCurrentPage(currentPage);
    int pageSize = 4;
    pageHelp.setPageSize(pageSize);
    int pageStart = currentPage*pageSize;
    System.out.println("pageStart:"+pageStart);
    pageUse.setPageNow(pageStart);
    pageUse.setPageEnd(pageSize);
    pageUse.setId(id);
    List<UserShop> userShops = goodService.pageUse(pageUse);
    int totalPage = count/pageSize;
    System.out.println("count/pageSize================================="+count/pageSize);
    pageHelp.setTotalPage(totalPage);
    System.out.println("useShopSize================================:"+userShops.size());
    pageHelp.setUserShops(userShops);
    session.setAttribute("p",pageHelp);
        return enter;
}
@RequestMapping(value = "/a/shopEnter",method = RequestMethod.GET)
public String enterUser(@RequestParam(value = "currentPage") int currentPage,
                        HttpSession session){
        UserShop shopUsers = (UserShop) session.getAttribute("shop");
        System.out.println(shopUsers.getShopid()+"=====================================================usershop");
        System.out.println("======================usershop"+shopUsers.getShopid());
        String shopid = shopUsers.getShopid();
        System.out.println("=======================shopid="+shopid);
        UserShop shopUser = goodService.shopOne(shopid);
        System.out.println("shopUser == == == == =="+shopUser.getId());

    int id = shopUser.getId();
    System.out.println("id=====================id=:"+id);
    User user = userService.SelectById(id);
    session.setAttribute("ju",user);
    System.out.println("user=========================================="+id);
    int count = goodService.getTotalPage(id);
    System.out.println("==============================================="+count);
    PageUse pageUse = new PageUse();
    PageHelp pageHelp = new PageHelp();
    pageHelp.setTotalCount(count);
    pageHelp.setCurrentPage(currentPage);
    int pageSize = 4;
    pageHelp.setPageSize(pageSize);
    int pageStart = currentPage*pageSize;
    System.out.println("pageStart:"+pageStart);
    pageUse.setPageNow(pageStart);
    pageUse.setPageEnd(pageSize);
    pageUse.setId(id);
    List<UserShop> userShops = goodService.pageUse(pageUse);
    int totalPage = count/pageSize;
    System.out.println("count/pageSize================================="+count/pageSize);
    pageHelp.setTotalPage(totalPage);
    System.out.println("useShopSize================================:"+userShops.size());
    pageHelp.setUserShops(userShops);
    session.setAttribute("p",pageHelp);

    return enter;
}
//添加购物项到购物车
    @RequestMapping(value = "/a/addCart")
    public void addCart(HttpSession session, @RequestParam("shopid") String shopid, @RequestParam("num") int num, HttpServletResponse response){
        System.out.println("您已经进入===========================addcart");
        //从session获取购物车
        Cart cart = (Cart) session.getAttribute("carts");
        if(cart == null) {
            //如果获取不到，创建购物车对象，放在session中
            cart = new Cart();
            session.setAttribute("carts",cart);
        }
        //如果获取到使用即可
        //获取到商品id，数量
        //通过商品id查询商品对象
        UserShop shop = goodService.shopOne(shopid);
        //获取到待购买的购物项
        CartItem cartItem = new CartItem();
        cartItem.setNum(num);
        cartItem.setUserShop(shop);
        //调用购物车上的方法
        cart.addCartItemToCart(cartItem);
        //重定向到页面

        try {
            response.sendRedirect("/view/jsp/user/shopOperate.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping(value = "/a/removeCartItem")
    public String removeCartItem(@RequestParam("shopid")String shopid,HttpServletResponse response,HttpSession session){
        System.out.println("您已进入发明合法==============================");
        //获取待删除商品的id
        //获取到购物车
        Cart cart = (Cart) session.getAttribute("carts");
        //调用购物车删除购物项方法
        cart.removeCartItem(shopid);
        //重定向到 response.sendRedirect("/views/jsp/user/cart.jsp");
        try {
            response.sendRedirect("/view/jsp/user/cart.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping(value = "/a/clearCart")
    public void clearCart(HttpSession session,HttpServletResponse response){
        //获取购物车
        Cart cart = (Cart) session.getAttribute("carts");
        //调用购物车上的清空购物车的方法
        cart.clearCart();
        //重定向到jsp
        try {
            response.sendRedirect("/view/jsp/user/cart.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/a/buy")
    public String buy(){
        return buys;
    }

    @RequestMapping(value = "/apple")
    public Location apple(@RequestParam("locationId") Integer locationId,HttpServletResponse response){
        System.out.println("进入apple页面===============================");
        List<Department> departments = goodService.selectDepartment(locationId);
        System.out.println("==============="+departments.size());
        ObjectMapper objectMapper = new ObjectMapper();
        String result = null;
        try {
            result = objectMapper.writeValueAsString(departments);
            System.out.println(result);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/javaScript");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().print(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/pear")
    public Parten pear(@RequestParam("depid") int depid,HttpServletResponse response){
        System.out.println("进入pear页面===============================");
        List<Parten> partens = goodService.selectParten(depid);
        System.out.println("==============="+partens.size());
        ObjectMapper objectMapper = new ObjectMapper();
        String result = null;
        try {
            result = objectMapper.writeValueAsString(partens);
            System.out.println(result);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/javaScript");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().print(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/a/ding")
    public String downOrders(@RequestParam("shopid")String shopid,
                       @RequestParam("num") String num,
                       @RequestParam("province") int province,
                       @RequestParam("dept") int dept,
                       @RequestParam("parten") int parten,
                       @RequestParam("address") String address,
                       @RequestParam("phone") long phone,
                       HttpSession session){
        System.out.println("===============欢迎来到订单后台");
        System.out.println("===============欢迎来到订单后台"+phone);
        User user = (User) session.getAttribute("jsp");
        Location location = goodService.selectAa(province);
        Department depts = goodService.selectAb(dept);
        Parten partent = goodService.selectAc(parten);
        String dress = location.getCity()+" "+depts.getName()+" "+partent.getName()+" "+address;
        UserShop userShop = goodService.shopOne(shopid);
        Order order = new Order();
        order.setId(user.getId());
        order.setUserid(userShop.getId());
        order.setShopid(shopid);
        order.setDress(dress);
        order.setNum(Integer.parseInt(num));
        order.setPhone(phone);
        order.setShopname(userShop.getShopName());
        order.setShopfile(userShop.getShopFile());
        goodService.insertOreder(order);
        return buys;
    }

    @RequestMapping(value = "/a/Order")
    public String myOrder(@RequestParam(value = "currentPage") int currentPage,HttpSession session){
        System.out.println("============欢迎进入订单列表=============");
        User user = (User) session.getAttribute("jsp");
        List<Order> orders = goodService.selectOrder(user.getId());
        int count = goodService.orderSize(user.getId());
        System.out.println("=========================="+count);
        PageUse pageUse = new PageUse();
        PageHelp pageHelp = new PageHelp();
        pageHelp.setTotalCount(count);
        pageHelp.setCurrentPage(currentPage);
        int pageSize = 4;
        pageHelp.setPageSize(pageSize);
        int pageStart = currentPage*pageSize;
        System.out.println("===pageStart===:"+pageStart);
        pageUse.setPageNow(pageStart);
        pageUse.setPageEnd(pageSize);
        pageUse.setId(user.getId());
        List<Order> orderList = goodService.orderPage(pageUse);
        int totalPage = count/pageSize;
        System.out.println("count/pageSize=========="+count/pageSize);
        pageHelp.setTotalPage(totalPage);
        pageHelp.setOrders(orderList);
        session.setAttribute("ps",pageHelp);
        return od;
    }
}
