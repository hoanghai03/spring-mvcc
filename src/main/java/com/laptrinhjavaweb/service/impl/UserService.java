package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;

@Service
public class UserService implements IUserService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private UserConverter userConverter;
	
	@Override
	public UserDTO save(UserDTO dto) {
		UserEntity userEntity = new UserEntity();		
		userEntity = userConverter.toEntity(dto);
		userEntity.setStatus(1);
		
		RoleEntity roleEntity = roleRepository.findOne((long) 2);
		
		List<RoleEntity> listRole = new ArrayList<>();
		listRole.add(roleEntity);
		userEntity.setRoles(listRole);
		return userConverter.toDto(userRepository.save(userEntity));
	}
	
}
