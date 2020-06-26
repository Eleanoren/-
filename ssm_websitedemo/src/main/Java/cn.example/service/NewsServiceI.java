package cn.example.service;

import cn.example.entity.News;
import java.util.List;

public interface NewsServiceI {
    void addNews(News news);

    News getUserById(String id);

    List<News> getAllNews();

    void deleteByPrimaryKey(String id);

    void updateByPrimaryKey(News news);
}
