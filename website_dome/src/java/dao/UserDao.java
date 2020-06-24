package java.dao;

import java.dean.User;
import java.dean.News;
import java.util.List;

public interface UserDao {
    public List<News> select(String sql, Object[] arr);
    public News getNews(Integer id);
    public boolean addNews(News news);
    public boolean updateNews(News news);
    public boolean deleteNews(Integer id);
}
