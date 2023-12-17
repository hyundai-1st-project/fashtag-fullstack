package org.betweenls.fashtag.post.service;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.betweenls.fashtag.global.s3.S3UploaderService;
import org.betweenls.fashtag.post.domain.PostVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;


@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class PostServiceImplTest {

    @Autowired
    private PostService postService;
    @Autowired
    private S3UploaderService s3UploaderService;

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
    public void insertPost() {
        List<String> hashtags = List.of("#크리스마스","#얼죽코","#겨울패션","#패딩","#트렌디","#겨울","#하이킹","#OOTD","#신발","#나이키","#오뭐입","#내뭐입","#사랑","#모자","#tt","#라이징슈즈","#연말","#qkqk","#hbag","#fash","#fashtag","#니혼","#화이팅!!","#양","#털가방","#패쉬태그","#모델","#얼죽","#회색곰","#새해","#송년","#구제","#상표","#어그부츠","#부츠","#정장","#오늘뭐입지","#정복","#슈즈","#아겅","#악어","#흰갈","#꾸안꾸","#black","#올검","#내일뭐입","#내일뭐입지","#오늘뭐입","#일본","#해외여행","#해외","#청바지","#날씨","#행복","#마스크","#코로나","#자동차","#아파","#qq","#검정바지","#가을","#추워","#공항패션","#ootd","#출국","#한국","#올블랙","#출근룩","#밤비","#얼뜨아","#노포","#노스페이스","#돌고래","#치마","#제주도","#제주","#e","#눕시","#목도리","#코트","#떡볶이코트","#서울","#으추추","#후드","#얼죽후","#신년","#HHW","#트리","#ㅋㅋ","#ㄴㄴ","#zz","#이쁨","#공항","#11","#22","#z","#zzzz","#ㅇㅇㅌㅇ","#신상","#목","#오오티디","#옛날감성","#카페","#감성카페","#pink","#핑크","#핑꾸핑꾸","#선인장","#안추운척","#선글라스","#남양주","#여름","#압구정","#날라리","#여름패션","#힙","#힙찔이","#래더","#열쇠고리","#말레이","#말레이시아","#신나","#눈","#에어팟맥스","#어그","#젠틀몬스터","#간지","#여행","#가고싶다","#거울샷","#비니","#코드코드","#육아","#상남자","#애기","#나주");
        List<Long> userId = List.of(10000L, 10001L, 10002L, 10120L, 10061L, 10062L, 10073L, 10064L, 10088L, 10141L, 10136L, 10143L, 10020L, 10065L, 10090L, 10060L, 10121L, 10123L, 10124L, 10126L, 10128L, 10129L, 10131L, 10132L, 10154L, 10153L, 10155L, 10085L, 10086L, 10087L, 10104L, 10105L, 10102L, 10106L, 10133L, 10142L, 10144L, 10145L, 10171L);
        String folderPath = "C:/Users/sangwon/Desktop/새 폴더 (3)";
        // 폴더 내 파일들을 읽어와 MultipartFile로 변환
        File folder = new File(folderPath);
        File[] listOfFiles = folder.listFiles();
        PostVO postVO = new PostVO();
        postVO.setPostContent("");
        if (listOfFiles != null) {
            for (File file : listOfFiles) {
                String dirName = "posts/post-upload-temp";
                postVO.setPicture(s3UploaderService.upload(file, dirName,file.getName()));

                List<String> hash = new ArrayList<>();
                for (int i = 0; i < 5; i++) {
                    int a = (int)(Math.random()*130);
                    hash.add(hashtags.get(a));
                }
                Random random = new Random();
                int randomNumber = random.nextInt(39);
                postVO.setHashtags(hash);
                postVO.setUserId(userId.get(randomNumber));
                postService.insertPost(postVO);
                linkPostHashtag(postVO);
            }
        }
//

    }
    public void linkPostHashtag(PostVO postVO) {
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