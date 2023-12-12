package org.betweenls.fashtag.user.security;


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
        UserVO vo = userMapper.getUserById(id);

        if(vo == null){
            throw new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다.:"+id);
        }

        CustomUser customUser = new CustomUser(vo);
//        customUser.setUserVO(vo);

        log.warn("queried by member mapper: " + customUser.getUserVO());
        return customUser;
    }

}