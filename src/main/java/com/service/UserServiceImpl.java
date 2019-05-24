package com.service;

import com.dao.UserDao;
import com.vo.MsgVo;
import com.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public void save(User user) {
        System.out.println("UserServiceImpl的save()方法");
        userDao.insert(user);
    }

    @Override
    public List<User> select() {
        return userDao.selectUser();
    }

    @Override
    public User modify(String username) {
        User user = userDao.Selectone(username);
        return user;
    }


    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public MsgVo login(User user) {
        MsgVo result = new MsgVo();
        List<User> users = userDao.selectByName(user.getUsername());
        if(users.size() > 0){
            boolean b =false;
            for(User u : users){
                if(u.getPassword().equals(user.getPassword())){
                    result.setMsgCode(0);
                    b = true;
                }
            }
            if(!b){
                result.setMsgCode(1);
                result.setMsg("密码不匹配");
            }

        }else{

            result.setMsgCode(2);
            result.setMsg("用户名不存在");
        }
        return result;
    }

    @Override
    public User selectOne(String username) {
        return userDao.Selectone(username);
    }

    @Override
    public void updateAccount(User user) {
        userDao.updateAccount(user);
    }

    @Override
    public User SelectById(int id) {
        return userDao.selectByid(id);
    }

    @Override
    public void deletefile(User user) {
        userDao.deletefile(user);
    }

    @Override
    public void updateUserFile(User user) {
        userDao.updateUserFile(user);
    }

    @Override
    public void updateUs(User user) {
        userDao.updateUs(user);
    }

    @Override
    public void updatePassword(User user) {
        userDao.updatePassword(user);
    }
}

