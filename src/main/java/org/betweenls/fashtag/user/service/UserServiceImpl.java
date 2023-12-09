package org.betweenls.fashtag.user.service;

import lombok.extern.java.Log;
import org.springframework.stereotype.Service;

@Service
@Log
public class UserServiceImpl implements UserService {

    @Override
    public void test() {
        log.info("서비스 단 테스트");
    }
}
