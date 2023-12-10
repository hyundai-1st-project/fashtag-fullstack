package org.betweenls.fashtag.user.security;


import lombok.Setter;
import org.betweenls.fashtag.user.domain.CustomUser;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        log.warn("Load User By UserName : " + id);

        // userName means userid
        UserVO vo = userMapper.read(id);
        log.warn("queried by member mapper: " + vo);
        return vo == null ? null : new CustomUser(vo);
    }

}