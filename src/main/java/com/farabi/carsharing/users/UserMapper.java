package com.farabi.carsharing.users;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface UserMapper {
    UserDto toDto(User user);

    @Mapping(source = "password", target = "passwordHash")
    User toEntity(RegisterUserRequest registerUserRequest);

    void update(UpdateUserRequest updateUserRequest, @MappingTarget User user);
}
