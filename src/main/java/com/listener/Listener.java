package com.listener;

import com.service.GoodService;
import com.vo.*;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.util.List;

@WebListener
public class Listener implements HttpSessionListener, HttpSessionAttributeListener, ServletContextListener {
    @Autowired
    private GoodService goodService;
    public int count=0;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        /*HttpServletRequest request = null;
        goodService = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext()).getBean(GoodService.class);
        User user = (User) request.getSession().getAttribute("jsp");
        UserShop userShop = new UserShop();
        CartItem cartItem = new CartItem();
        int a = goodService.shopPageCount();
        if(user == null){
            System.out.println("user为空,===============================");
        }
        System.out.println("count ========== size"+a+user.getUsername());
        System.out.println("Create ========= userid"+user.getId());
        List<C> c = goodService.selectCart(user.getId());
        System.out.println("========================"+c.size()+" "+user.getId());
        System.out.println("c.getShopName==================="+c.get(0).getShopid());
        for (int i = 0 ; i < c.size() ; i++){
            System.out.println("getId==============="+c.get(i).getId());
            System.out.println("shopId==============="+c.get(i).getShopid());
            System.out.println("shopSize==============="+c.get(i).getShopSize());
            System.out.println("shopFile==============="+c.get(i).getShopFile());
            System.out.println("shopPrice==============="+c.get(i).getShopPrice());
            System.out.println("shopX==============="+c.get(i).getShopX());
            System.out.println("shopSimple==============="+c.get(i).getShopSimple());
            System.out.println("shopName==============="+c.get(i).getShopName());
            System.out.println("UsergetId==============="+user.getId());
            System.out.println("subTotal==============="+c.get(i).getSubTotal());
            System.out.println("Num==============="+c.get(i).getNum());
        }
        Cart cart = new Cart();
        for (int i = 0 ; i < c.size() ; i++){
            userShop.setId(c.get(i).getId());
            userShop.setShopid(c.get(i).getShopid());
            userShop.setShopSize(c.get(i).getShopSize());
            userShop.setShopFile(c.get(i).getShopFile());
            userShop.setShopPrice(c.get(i).getShopPrice());
            userShop.setShopX(c.get(i).getShopX());
            userShop.setShopSimple(c.get(i).getShopSimple());
            userShop.setShopName(c.get(i).getShopName());
            cartItem.setUserid(user.getId());
            cartItem.setSubTotal(c.get(i).getSubTotal());
            cartItem.setNum(c.get(i).getNum());
            cartItem.setUserShop(userShop);
            cart.addCartItemToCart(cartItem);
        }
        request.getSession().setAttribute("cart",cart);
        System.out.println("您已经进入了session创建===============================================");*/
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
/*System.out.println("Session Created = === =:"+httpSessionBindingEvent.getSession().getAttribute("jsp"));
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(
                httpSessionBindingEvent.getSession().getServletContext());
        goodService = applicationContext.getBean(GoodService.class);
        User user = (User) httpSessionBindingEvent.getSession().getAttribute("jsp");

        UserShop userShop = new UserShop();
        CartItem cartItem = new CartItem();
        int a = goodService.shopPageCount();
        if(user == null){
            System.out.println("user为空,===============================");
        }
        System.out.println("count ========== size"+a+user.getUsername());
        System.out.println("Create ========= userid"+user.getId());
        List<C> c = goodService.selectCart(user.getId());
        System.out.println("========================"+c.size()+" "+user.getId());
        System.out.println("c.getShopName==================="+c.get(0).getShopid());
        for (int i = 0 ; i < c.size() ; i++){
            System.out.println("getId==============="+c.get(i).getId());
            System.out.println("shopId==============="+c.get(i).getShopid());
            System.out.println("shopSize==============="+c.get(i).getShopSize());
            System.out.println("shopFile==============="+c.get(i).getShopFile());
            System.out.println("shopPrice==============="+c.get(i).getShopPrice());
            System.out.println("shopX==============="+c.get(i).getShopX());
            System.out.println("shopSimple==============="+c.get(i).getShopSimple());
            System.out.println("shopName==============="+c.get(i).getShopName());
            System.out.println("UsergetId==============="+user.getId());
            System.out.println("subTotal==============="+c.get(i).getSubTotal());
            System.out.println("Num==============="+c.get(i).getNum());
        }
        Cart cart = new Cart();
        for (int i = 0 ; i < c.size() ; i++){
            userShop.setId(c.get(i).getId());
            userShop.setShopid(c.get(i).getShopid());
            userShop.setShopSize(c.get(i).getShopSize());
            userShop.setShopFile(c.get(i).getShopFile());
            userShop.setShopPrice(c.get(i).getShopPrice());
            userShop.setShopX(c.get(i).getShopX());
            userShop.setShopSimple(c.get(i).getShopSimple());
            userShop.setShopName(c.get(i).getShopName());
            cartItem.setUserid(user.getId());
            cartItem.setSubTotal(c.get(i).getSubTotal());
            cartItem.setNum(c.get(i).getNum());
            cartItem.setUserShop(userShop);
            cart.addCartItemToCart(cartItem);
        }
        httpSessionBindingEvent.getSession().setAttribute("cart",cart);
        System.out.println("您已经进入了session创建===============================================");*/
    }

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {

    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent httpSessionBindingEvent) {
        System.out.println("Session Created = === =:"+httpSessionBindingEvent.getSession().getAttribute("jsp"));
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(
                httpSessionBindingEvent.getSession().getServletContext());
        goodService = applicationContext.getBean(GoodService.class);
        System.out.println("wowowowowow======================="+count);
        if (httpSessionBindingEvent.getSession().getAttribute("jsp")!=null&&count==0){
            User user = (User) httpSessionBindingEvent.getSession().getAttribute("jsp");


            int a = goodService.shopPageCount();
            if(user == null){
                System.out.println("user为空,===============================");
            }
            System.out.println("count ========== size"+a+user.getUsername());
            System.out.println("Create ========= userid"+user.getId());
            List<C> c = goodService.selectCart(user.getId());
            System.out.println("999999999999999========================"+c.size()+" "+user.getId());
            System.out.println("c.getShopName==================="+c.get(0).getShopid());
            Cart carts = new Cart();
            for (int j = 0 ; j < c.size() ; j++){
                System.out.println("这里是购物车啊"+j+" 在这里");
                UserShop userShop = new UserShop();
                CartItem cartItem = new CartItem();
                userShop.setId(c.get(j).getId());
                userShop.setShopid(c.get(j).getShopid());
                userShop.setShopSize(c.get(j).getShopSize());
                userShop.setShopFile(c.get(j).getShopFile());
                userShop.setShopPrice(c.get(j).getShopPrice());
                userShop.setShopX(c.get(j).getShopX());
                userShop.setShopSimple(c.get(j).getShopSimple());
                userShop.setShopName(c.get(j).getShopName());
                cartItem.setUserid(user.getId());
                cartItem.setSubTotal(c.get(j).getSubTotal());
                cartItem.setNum(c.get(j).getNum());
                cartItem.setUserShop(userShop);
                carts.addCartItemToCart(cartItem);
            }
            System.out.println("555555555555555555555555"+  carts.getList().size());
            for (int i = 0 ; i < carts.getList().size() ; i++){
                System.out.println("-----------------------"+carts.getList().get(i).getSubTotal());
                System.out.println("000000000000000000000000000000000000000000000000000000000000");
            }
            httpSessionBindingEvent.getSession().setAttribute("carts",carts);
            System.out.println("您已经进入了session创建===============================================");
            count = count + 1;
        }

    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent) {

    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(
                httpSessionEvent.getSession().getServletContext());
        goodService = applicationContext.getBean(GoodService.class);
        count=0;
        System.out.println("销毁后count的值为"+count);
        System.out.println("您已经进入了session销毁===============================================");
        User user = (User) httpSessionEvent.getSession().getAttribute("jsp");
        System.out.println("user====="+user.getId());
        Cart cart = (Cart) httpSessionEvent.getSession().getAttribute("carts");
        List<C> cs = goodService.selectCart(user.getId());
        List<String> cid = new ArrayList<String>();
        for (int i = 0 ; i < cs.size() ; i++){
            cid.add(cs.get(i).getShopid());
        }
        if(cart != null){
            for (int i = 0;i<cart.getList().size();i++){
                C c = new C();
                CartItem cartItem = new CartItem();
                cartItem.setUserid(user.getId());
                System.out.println("id====================="+cartItem.getUserid());
                cartItem.setUserShop(cart.getList().get(i).getUserShop());
                cartItem.setNum(cart.getList().get(i).getNum());
                cartItem.setSubTotal(cart.getList().get(i).getSubTotal());
               System.out.println(cart.getList().get(i).getUserShop().toString());
               c.setUserid(user.getId());
               c.setNum(cart.getList().get(i).getNum());
               c.setSubTotal(cart.getList().get(i).getSubTotal());
               c.setId(cart.getList().get(i).getUserShop().getId());
               c.setShopid(cart.getList().get(i).getUserShop().getShopid());
               c.setShopName(cart.getList().get(i).getUserShop().getShopName());
               c.setShopPrice(cart.getList().get(i).getUserShop().getShopPrice());
               c.setShopSimple(cart.getList().get(i).getUserShop().getShopSimple());
               c.setShopFile(cart.getList().get(i).getUserShop().getShopFile());
               c.setShopX(cart.getList().get(i).getUserShop().getShopX());
               c.setShopSize(cart.getList().get(i).getUserShop().getShopSize());
               if (cid.contains(c.getShopid())){
                   System.out.println("这件商品曾经加入过购物车！！！");
               }
               else {
                   goodService.insertCart(c);
               }

            }

        }


    }
}
