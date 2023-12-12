package org.betweenls.fashtag.user.service;

import lombok.extern.java.Log;
import org.betweenls.fashtag.user.domain.UserVO;
import org.betweenls.fashtag.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Log
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void test() {
        log.info("서비스 단 테스트");
    }

    @Override
    @Transactional
    public void join(UserVO userVO) {
        userVO.setPassword(bCryptPasswordEncoder.encode(userVO.getPassword()));

        userMapper.join(userVO);
        userMapper.setAuth(userVO.getUserId());
    }

    @Override
    public UserVO getUserByUserId(long userId) {
        return userMapper.getUserDetail(userId);
    }

    @Override
    public UserVO getUserById(String id) {
        return userMapper.getUserById(id);
    }

    @Override
    public int idcheck(String id) {
        return userMapper.idcheck(id);
    }

    @Override
    public int nicknameCheck(String nickname) {
        return userMapper.nicknameCheck(nickname);
    }


}
