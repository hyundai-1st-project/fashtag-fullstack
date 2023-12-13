package org.betweenls.fashtag.user.mapper;

import junit.framework.TestCase;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
import org.betweenls.fashtag.user.domain.PostPictureVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@Log4j
@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration("file:**/*-context.xml")
public class UserMapperTest {

    @Autowired
    private UserMapper userMapper;
    @Test
    public void getPost() {

        int a = userMapper.idcheck("test1");
        log.info(a);
        long userId = 10001;
        List<PostPictureVO> postPictureVOS = userMapper.getPost(userId);
    }

    @Test
    public void getHashTage(){
        long userId = 10088;
        List<String> hashtags = userMapper.getHashTage(userId);

        log.info(hashtags);
    }
}