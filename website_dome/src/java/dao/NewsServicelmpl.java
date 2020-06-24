package java.dao;

import java.dao.NewsDao;
import java.dao.UserDao;
import java.dao.NewsDaolmpl;
import java.dean.News;
import java.dean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class NewsServiceImpl implements NewsService {

    private NewsDao dao = new NewsDaoImpl();

    @Override
    public List<News> select(News news) {
        StringBuffer sql = new StringBuffer("select * from newslist.newslist where 1 = 1 ");
        List<Object> list = new ArrayList<Object>();
        if(news != null){
            // 根据bookid来查找对应的书籍
            if(news.getId() != null && news.getId() != 0){
                sql.append(" and id = ?");
                list.add(news.getId());
            }

            // 根据bookname来查找对应的书籍
            if(news.getTitle() != null){
                System.out.println("图书名称："+news.getTitle());
                sql.append(" and bookname = ?");
                list.add(news.getTitle());
            }
        }
        return dao.select(sql.toString(),list.toArray());
    }

    @Override
    public News getNews(News news) {
        if(news.getId() != null && news.getId() != 0){
            return dao.getNews(news.getId());
        }
        return null;
    }
}
