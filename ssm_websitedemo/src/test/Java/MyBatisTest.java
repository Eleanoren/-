import cn.example.entity.News;
import cn.example.service.NewsServiceI;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.util.Date;
import java.util.UUID;

public class MyBatisTest {
    NewsServiceI newsServiceI;
    @Before
    public void before(){
        //使用"spring.xml"和"spring-mybatis.xml"这两个配置文件创建Spring上下文
        ApplicationContext ac = new ClassPathXmlApplicationContext(new String[]{"classpath*:spring.xml","classpath*:spring-mybatis.xml"});
        //从Spring容器中根据bean的id取出我们要使用的userService对象
        newsServiceI = (NewsServiceI) ac.getBean("NewsService");
    }

    @Test
    public void testAddNews(){
        ApplicationContext ac = new ClassPathXmlApplicationContext(new String[]{"classpath*:spring.xml","classpath*:spring-mybatis.xml"});
        NewsServiceI newsService = (NewsServiceI) ac.getBean("NewsService");
        News news=new News();
        news.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        news.setTitle("testNews");
        news.setAuthor("testauthor")
        news.setContent(10000D);
        newsService.addNews(news);

}
