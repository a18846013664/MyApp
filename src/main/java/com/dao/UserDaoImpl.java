package com.dao;

import com.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public void insert(User user) {
        sqlSession.insert("vo.mapper.add",user);
    }

    @Override
    public List<User> selectUser() {
        /*Student student = new Student();
        User user = new User();
        student.setId(2);
        student.setUsername("yanglu");
        student.setPassword("12306");
        student.setSex(1);
        student.setRoom("class7");*/

        //sqlSession.insert("vo.mapper.add",student);
        //sqlSession.delete("vo.mapper.remove",2);
        return sqlSession.selectList("vo.mapper.selectAll");
    }

    @Override
    public List<User> selectByName(String username) {
        return sqlSession.selectList("vo.mapper.selectByName",username);
    }

    @Override
    public User Selectone(String username) {
        User user = sqlSession.selectOne("vo.mapper.selectByNameOne",username);
        return user;
    }

    @Override
    public void updateUser(User user) {
        sqlSession.update("vo.mapper.updateUser",user);
    }

    @Override
    public User selectByid(int id) {
        User user = sqlSession.selectOne("vo.mapper.selectById",id);
        return user;
    }

    @Override
    public void updateAccount(User user) {
        sqlSession.update("vo.mapper.updateAccount",user);
    }

    @Override
    public void deletefile(User user) {
        sqlSession.delete("vo.mapper.deleteFile",user.getId());
    }

    @Override
    public void updateUserFile(User user) {
        sqlSession.update("vo.mapper.upUserfile",user);
    }

    @Override
    public void updateUs(User user) {
        sqlSession.update("vo.mapper.updateUser",user);
    }

    @Override
    public void updatePassword(User user) {
        sqlSession.update("vo.mapper.updatePass",user);
    }
}
