package org.betweenls.fashtag.user.domain;

import lombok.Data;

@Data
public class AuthVO {
    private Long userId;
    private String auth;
}