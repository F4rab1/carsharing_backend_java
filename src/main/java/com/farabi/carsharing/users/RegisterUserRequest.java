package com.farabi.carsharing.users;

import lombok.Data;

@Data
public class RegisterUserRequest {
    private String name;
    private String email;
    private String password;
}
