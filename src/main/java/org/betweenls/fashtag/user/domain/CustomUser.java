package org.betweenls.fashtag.user.domain;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Collection;
import java.util.stream.Collectors;

@Data
public class CustomUser implements UserDetails, Serializable {

    private static final long serialVersionUID = 1L;

    private UserVO userVO;

    public CustomUser(UserVO vo) {
        this.userVO = vo;
    }

    //계정이 가지고 있는 권한을 리턴
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return userVO.getAuthList().stream()
                .map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList());
    }

    @Override
    public String getUsername() {
        return this.userVO.getId();
    }

    @Override
    public String getPassword() {
        return this.userVO.getPassword();
    }

    //계정이 만료되었는지를 리턴  true : 만료되지 않음
    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    //계정이 잠겨있는지를 리턴
    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }

    //패스워드가 만료되었는지를 리턴
    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    //계정이 사용가능한지를 리턴
    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }

//    private static final long serialVersionUID = 1L;

//    private UserVO userVO;

//    public CustomUser() {
//        super("", "", new ArrayList<>());
//    };
//
//    public CustomUser (String id, String password, Collection<? extends GrantedAuthority> authorities) {
//        super(id, password, authorities);
//    }
//
//    public CustomUser(String id, String password, Collection<? extends GrantedAuthority> authorities, UserVO userVO) {
//        super(id, password, authorities);
//        this.userVO = userVO;
//    }
//
//    public CustomUser(UserVO vo) {
//        super(vo.getId(), vo.getPassword(), vo.getAuthList().stream()
//                .map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
//        this.userVO = vo;
//    }

}
