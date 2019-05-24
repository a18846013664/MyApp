package com.dao;



import com.vo.User;

import java.util.List;

public interface UserDao {
    public void insert(User user);
    public List<User> selectUser();
    public List<User> selectByName(String username);
    public User Selectone(String username);
    public void updateUser(User user);
    public User selectByid(int id);
    public void updateAccount(User user);
    public void deletefile(User user);
    public void updateUserFile(User user);
    public void updateUs(User user);
    public void updatePassword(User user);
}
