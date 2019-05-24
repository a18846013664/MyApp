package com.service;

import com.vo.MsgVo;
import com.vo.User;

import java.util.List;

public interface UserService {
    public void save(User user);
    public List<User> select();
    public User modify(String username);
    public void updateUser(User user);
    public MsgVo login(User user);
    public User selectOne(String username);
    public void updateAccount(User user);
    public User SelectById(int id);
    public void deletefile(User user);
    public void updateUserFile(User user);
    public void updateUs(User user);
    public void updatePassword(User user);
}
