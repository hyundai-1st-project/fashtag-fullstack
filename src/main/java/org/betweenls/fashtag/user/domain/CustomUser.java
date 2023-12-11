package org.betweenls.fashtag.user.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;
import java.util.stream.Collectors;

@Getter
public class CustomUser extends User {

//    private static final long serialVersionUID = 1L;

    private UserVO userVO;

    public CustomUser (String id, String password, Collection<? extends GrantedAuthority> authorities) {
        super(id, password, authorities);
    }

    public CustomUser(String id, String password, Collection<? extends GrantedAuthority> authorities, UserVO userVO) {
        super(id, password, authorities);
        this.userVO = userVO;
    }

    public CustomUser(UserVO vo) {
        super(vo.getId(), vo.getPassword(), vo.getAuthList().stream()
                .map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
        this.userVO = vo;
    }

}
