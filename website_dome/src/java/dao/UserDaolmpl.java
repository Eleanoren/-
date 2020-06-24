package java.dao;

import java.dao.NewsDao;
import java.dao.UserDao;
import java.dao.UserDaolmpl;
import java.dean.News;
import java.dean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class NewsServicelmpl implements NewsDao{
    public User login(User user) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            // 1.获取数据库连接
            con = BaseDao.getConnection();
            // 2.写sql
            String sql = "select * from user where name = ? and password = ?";
            // 3.预编译
            ps = con.prepareStatement(sql);
            // 4.设置值
            ps.setObject(1,user.getName());
            ps.setObject(2,user.getPassword());
            rs = ps.executeQuery();
            User users = null;
            if(rs.next()){
                users = new User();
                // 从数据库中获取值到实体类的setter方法中

                users.setName(rs.getString("name"));
                users.setPassword(rs.getString("password"));

                return users;

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // 关闭资源，避免出现异常
            BaseDao.close(con,ps,rs);
        }
        return null;
    }
    @Override
    public boolean register(User user) {
        String sql = "insert into user values ('name','password')";
        List<Object> list = new ArrayList<Object>();
        list.add(user.getName());
        list.add(user.getPassword());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }
    @Override
    public List<User> selectUser(String sql, Object[] arr) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 1.连接数据库
            con = BaseDao.getConnection();
            // 2.预编译
            ps = con.prepareStatement(sql);
            if(arr != null){
                for (int i = 0; i < arr.length; i++) {
                    ps.setObject(i+1,arr[i]);
                }
            }
            // 3.执行sql
            rs = ps.executeQuery();
            // 4.保存查询出来的数据到list
            List<User> list = new ArrayList<User>();
            while(rs.next()){
                User user = new User();
                // 从数据库中获取值到实体类的setter方法中
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));

                // 测试数据
                System.out.println("Dao层测试日志，显示用户信息：");
                System.out.println(user);
                // 将对象保存到list中
                list.add(user);
            }
            return list;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            // 关闭资源，避免出现异常
            BaseDao.close(con,ps,rs);
        }
        return null;
    }
}

