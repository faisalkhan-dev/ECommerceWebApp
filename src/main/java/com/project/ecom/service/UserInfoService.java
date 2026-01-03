package com.project.ecom.service;

import com.project.ecom.entity.UserInfo;
import com.project.ecom.repository.UserInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class UserInfoService implements IUserInfoService {
    @Autowired
    private UserInfoRepository userInfoRepository;

    @Override
    public List<UserInfo> getAllUserDetails() {
        return userInfoRepository.findAll();
    }

    @Override
    public void saveUserDetail(UserInfo userInfo) {
        userInfoRepository.save(userInfo);
    }

    @Override
    public UserInfo getUserDetail(int id) {
        UserInfo userInfo = null;
        Optional<UserInfo> optional = userInfoRepository.findById(id);
        if (optional.isPresent()) {
            userInfo = optional.get();
        }
        return userInfo;
    }

    @Override
    public void deleteUserDetail(int id) {
        userInfoRepository.deleteById(id);
    }
}
