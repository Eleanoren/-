package java.dao;

import java.dean.News;
import java.dean.User;
import java.dao.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDaolmpl implements UserDao{
    @Override
    public List<News> select(String sql, Object[] arr) {
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
                    // 传入sql的参数
                    ps.setObject(i+1,arr[i]);
                }
            }
            // 3.执行sql
            rs = ps.executeQuery();
            // 4.保存查询出来的数据到list
            List<News> list = new ArrayList<News>();
            while (rs.next()){
                News news=new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setAuthor(rs.getString("author"));
                news.setTime(rs.getString("time"));
                news.setSource(rs.getString("source"));
                news.setContent(rs.getString("content"));


                list.add(news);
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

    @Override
    public News getNews(Integer id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            // 1.连接数据库
            con = BaseDao.getConnection();
            // 2.预编译
            String sql = "select * from newslist.newslist where id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            // 3.执行sql
            rs = ps.executeQuery();
            while (rs.next()){
                News news=new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setAuthor(rs.getString("author"));
                news.setTime(rs.getString("time"));
                news.setSource(rs.getString("source"));
                news.setContent(rs.getString("content"));

                return news;
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
    public boolean addNews(News news) {
        String sql = "insert into book values (0,?,?,?,null,?)";
        List<Object> list = new ArrayList<Object>();
        list.add(news.getId());
        list.add(news.getTitle());
        list.add(news.getAuthor());
        list.add(news.getTime());
        list.add(news.getSource());
        list.add(news.getContent());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 更新图书
     * @param book
     * @return
     */
    @Override
    public boolean updateNews(News news) {
        String sql = "update book set bookname=?,price=?,author=?,publish=? where bookid=?";
        List<Object> list = new ArrayList<Object>();
        list.add(news.getId());
        list.add(news.getTitle());
        list.add(news.getAuthor());
        list.add(news.getTime());
        list.add(news.getSource());
        list.add(news.getContent());

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 删除图书
     * @param bookid
     * @return
     */
    @Override
    public boolean deleteNews(Integer bookid) {
        String sql = "delete from book where bookid=?";
        List<Object> list = new ArrayList<Object>();
        list.add(bookid);

        boolean flag = BaseDao.addUpdateDelete(sql,list.toArray());
        if(flag){
            return true;
        }else {
            return false;
        }
    }

}