package com.controller;

import com.service.GoodService;
import com.service.UserService;
import com.vo.Location;
import com.vo.MsgVo;
import com.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

@SessionAttributes(value = {"user"},types = {String.class})
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private GoodService goodService;
    final String userLocation = "user/user";
    final String loadSuccess = "web";
    final String loadfail = "load/dologin";
    final String userAccount = "user";
    final String user = "user";
    final String userS = "user";
    final String A = "load/A";
    final String B = "load/B";
    /*可以使用params和headers来更加精确请求（支持简单的表达式）
    @RequestMapping(value = "/registerSuccess",method = RequestMethod.POST,params = "username")*/

    //注册第一阶段(此处未被使用)
    @RequestMapping(value = "/egisterSuccess",method = RequestMethod.POST)
    public String registerSuccess(
            @RequestParam(value = "username") String username,
            @RequestParam(value = "password") String password,
            @RequestParam(value = "sex") int sex,
            @RequestParam(value = "phone") long phone,
            @RequestParam(value = "file")  MultipartFile []files,
            HttpSession session,HttpServletRequest request){
        if (files!=null&&files.length>0){
            for (int i = 0 ; i < files.length ; i++){
                MultipartFile file = files[i];
                System.out.println("----------------------------------------------------");
                saveFile(file,request,session);
                System.out.println( "getOriginalFilename"+file.getOriginalFilename());
            }
        }
        User user = new User();
        String headfile = files[0].getOriginalFilename().toString();
        user.setHeadfile(headfile);
        user.setUsername(username);
        user.setPassword(password);
        user.setSex(sex);
        user.setPhone(phone);
        userService.save(user);
       System.out.println("username:"+user.getUsername());
       session.setAttribute("jsp",user);
        return userS;
    }
   /* @RequestMapping(value = "/testFileUpload",method = RequestMethod.POST)
    public String testFileUpload(@RequestParam("desc") String desc,@RequestParam("file") MultipartFile []files,HttpServletRequest request)throws IOException {
        if (files!=null&&files.length>0){
            for (int i = 0 ; i < files.length ; i++){
                MultipartFile file = files[i];
                System.out.println("----------------------------------------------------");
                saveFile(file,request);
                System.out.println( "getOriginalFilename"+file.getOriginalFilename());
            }
        }
        System.out.println("desc:" + desc);
        return userLocation;
    }*/
    private boolean saveFile(MultipartFile file, HttpServletRequest request,HttpSession session){
        if (!file.isEmpty()){
            try {
                /*String filePath = request.getSession().getServletContext().getRealPath("/")+"uploaddir\\";*/
                String filePath = session.getServletContext().getRealPath("/")+"uploaddir\\";
                String fileName = file.getOriginalFilename();
                String filePaths = filePath + fileName;
                System.out.println("filePath"+filePath);
                System.out.println("fileName"+file.getOriginalFilename());
                file.transferTo(new File(filePaths));
                return true;
            }catch (IOException e){
                e.printStackTrace();
            }
        }

        return false;
    }

    //判断用户名是否重复
    @ResponseBody
    @RequestMapping(value = "/load",method = RequestMethod.POST)
    public List<User> load(@RequestParam(value = "userName") String username, HttpServletResponse response){
        System.out.println("进入LOAD页面============================================");
        List<User> users = userService.select();
        String result = null;
        List<String> userNames = new ArrayList<String>();
        for(User user: users){
            userNames.add(user.getUsername());
        }
        if(userNames.contains(username)){
            result = "<font color='green'>用户名已占用</font>";
        }else {
            result = "<font color='green'>用户名未占用</font>";
        }
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().print(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    //用于登陆
    @RequestMapping(value = "/loginSuccess",method = RequestMethod.POST)
    public String loginSuccess(@RequestParam(value = "username") String username,@RequestParam(value = "password") String password,HttpServletRequest request,HttpSession session){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        MsgVo result = userService.login(user);
        if(result.getMsgCode() == 0){
            User users = userService.selectOne(user.getUsername());
            List<Location> locations = goodService.selectCity();
            session.setAttribute("locations",locations);
            session.setAttribute("jsp",users);
            return userS;
        }
        else{
            if(result.getMsgCode() == 1){
                request.setAttribute("errPass", result.getMsg());
            }else{
                request.setAttribute("errUser", result.getMsg());
            }
                return loadfail;
        }
    }
    @RequestMapping(value = "/registerSuccess",method = RequestMethod.POST)
    public String testFileUpload(
                                 @RequestParam(value = "username") String username,
                                 @RequestParam(value = "password") String password,
                                 @RequestParam(value = "sex") int sex,
                                 @RequestParam(value = "phone") long phone,
                                 @RequestParam("file")MultipartFile file,
                                  HttpSession session)throws IOException {
        if(file.getSize()>0&&file!=null){
            String originalFilename = file.getOriginalFilename();
            String dirPath = session.getServletContext().getRealPath("/") + "resource/image/";
           // String dirPath="C:\\Users\\17149\\IdeaProjects\\ssm_app\\src\\main\\webapp\\resource\\image\\";
            File file1 = new File(dirPath);
            if (!file1.exists()) {
                file1.mkdirs();
            }
            String newFilename = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setHeadfile(newFilename);
            user.setSex(sex);
            user.setPhone(phone);
            try {
                file.transferTo(new File(dirPath+newFilename));
                userService.save(user);
                session.setAttribute("jsp",user);
            }catch (Exception e){
                e.printStackTrace();
                return userAccount;
            }
        }

        return userS;
    }
    @RequestMapping(value = "/a/updateAccount",method = RequestMethod.POST)
    public String updateAccount(User user,HttpSession session){
        userService.updateAccount(user);
        User NewUser = userService.SelectById(user.getId());
        session.setAttribute("jsp",NewUser);
        return userAccount;
    }
    @RequestMapping(value = "/zx")
    public String web(HttpSession session){
        session.invalidate();
        return loadfail;
    }
    @RequestMapping(value = "/a/updateUser",method = RequestMethod.POST)
    public String updateUser(@RequestParam(value = "uid") int id,
                             @RequestParam(value = "username") String username,
                             @RequestParam(value = "sex") int sex,
                             @RequestParam(value = "phone") long phone,
                             @RequestParam("file")MultipartFile file,HttpSession session){
        if(file.getSize()>0&&file!=null){
            String originalFilename = file.getOriginalFilename();
            String dirPath = session.getServletContext().getRealPath("/") + "resource/image/";
            // String dirPath="C:\\Users\\17149\\IdeaProjects\\ssm_app\\src\\main\\webapp\\resource\\image\\";
            File file1 = new File(dirPath);
            if (!file1.exists()) {
                file1.mkdirs();
            }
            String newFilename = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
            User user = new User();
            user.setId(id);
            user.setUsername(username);
            user.setPhone(phone);
            user.setHeadfile(newFilename);
            user.setSex(sex);
            userService.updateUserFile(user);
            try {
                file.transferTo(new File(dirPath+newFilename));
                User user1 = userService.SelectById(id);
                session.setAttribute("jsp",user1);
            }catch (Exception e){
                e.printStackTrace();
                return userAccount;
            }
        }
        else {
            User user2 = new User();
            user2.setId(id);
            user2.setSex(sex);
            user2.setPhone(phone);
            user2.setUsername(username);
            userService.updateUs(user2);
            User user3 = userService.SelectById(id);
            session.setAttribute("jsp",user3);
        }
        return user;
    }
    @RequestMapping(value = "/password",method = RequestMethod.POST)
    public User password(@RequestParam("id") int id,@RequestParam("passWord") String password,HttpServletResponse response){
        System.out.println("进入password页面====================================");
        String result = null;
        User user = userService.SelectById(id);
        System.out.println("用户输入的密码"+user.getPassword());
        System.out.println("用户密码"+user.getPassword());
        System.out.println("789"+user.getPassword()==password);
        String p = user.getPassword();
        if (p.equals(password)){
            result ="密码正确";
        }else {
            result ="密码错误";
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        try {
            response.getWriter().print(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping(value = "/a/password",method = RequestMethod.POST)
    public String apassword(@RequestParam("id") int id,@RequestParam("password") String password,HttpSession session){
        User up = new User();
        up.setId(id);
        up.setPassword(password);
        userService.updatePassword(up);
        User upp = userService.SelectById(id);
        session.setAttribute("jsp",upp);
        return user;
    }

}
