package java.dao;

import java.dean.News;
import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2020/5/20 23:13
 * 图书信息接口
 */

public interface NewsDao {

    public List<News> select(String sql,Object[] arr);
    public News getNews(Integer id);
    public boolean addNews(News news);
    public boolean updateNews(News news);
    public boolean deleteNews(Integer id);
}
