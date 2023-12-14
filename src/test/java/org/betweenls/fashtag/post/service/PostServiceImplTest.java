package org.betweenls.fashtag.post.service;

import lombok.extern.log4j.Log4j;
import org.betweenls.fashtag.post.domain.PostVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;


@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class PostServiceImplTest {

    @Autowired
    private PostService postService;

    @Test
    public void deletePostMany() {
        List<Long> lists = List.of(10001L,10002L,10003L,10004L,10005L,10060L,10061L,10062L);
        for (Long list : lists) {
            postService.deletePostWithForeignKey(list);
        }

    }

    @Test
    public void deletePostOne() {
            postService.deletePostWithForeignKey(10067L);
    }


    @Test
    void insertPost() {
        PostVO postVO = new PostVO();
        List<String> hashtags = List.of("오뭐입", "내뭐입", "겨울패션", "");
        postVO.setHashtags(hashtags);
//        postService.insertPost(postVO);
//        linkPostHashtag(postVO);

    }
    private void linkPostHashtag(PostVO postVO) {
        List<String> hashtags = postVO.getHashtags();
        if (hashtags != null) {
            for (String hashtag : hashtags) {
                if (postService.getHashtagIdByHashtagName(hashtag) == null) {
                    postService.insertHashtag(hashtag);
                }
                Long hashtagId = postService.getHashtagIdByHashtagName(hashtag);
                postService.insertPost_hashtag(postVO.getPostId(), hashtagId);
            }
        }
    }

}