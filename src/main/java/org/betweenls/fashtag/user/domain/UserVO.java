package org.betweenls.fashtag.user.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class UserVO {
    private long userId;
    private String id;
    private String password;
    private String profile;
    private String nickname;
    private String username;

    private Date createdAt;

    // 추가 : 회원 정보 수정
//    private Date updateDate;
    private List<AuthVO> authList; // 내부적으로 여러 개의 사용자 권한을 가질 수 있는 구조로 설계

}