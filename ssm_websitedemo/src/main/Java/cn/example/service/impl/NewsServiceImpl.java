package cn.example.service.impl;

import cn.example.entity.News;
import cn.example.service.NewsServiceI;
import cn.example.dao.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("NewsService")
public class NewsServiceImpl implements NewsServiceI{
    @Autowired
    private NewsMapper newsMapper;//注入dao

    @Override
    public void addNews(News news) {
        NewsMapper.insert(news);
    }

    @Override
    public News getNewsById(String id) {
        return NewsMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<News> getAllNews() {
        return NewsMapper.getAllNews();
    }

    @Override
    public void deleteByPrimaryKey(String Id) {
        NewsMapper.deleteByPrimaryKey(Id);
    }

    @Override
    public void updateByPrimaryKey(News news) {
        NewsMapper.updateByPrimaryKey(news);
    }

}
