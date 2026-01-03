package com.project.ecom.service;

import com.project.ecom.entity.UserInfo;

import java.util.List;

public interface IUserInfoService {

    public List<UserInfo> getAllUserDetails();

    public void saveUserDetail(UserInfo userInfo);

    public UserInfo getUserDetail(int id);

    public void deleteUserDetail(int id);
}
