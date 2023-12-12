package org.betweenls.fashtag.user.domain;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuthVO {
    private Long userId;
    private String auth;
}