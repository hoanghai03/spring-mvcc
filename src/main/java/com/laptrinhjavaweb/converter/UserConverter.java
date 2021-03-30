package com.laptrinhjavaweb.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.UserEntity;

@Component
public class UserConverter {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public UserDTO toDto(UserEntity entity) {
		UserDTO result = new UserDTO();
		result.setEmail(entity.getEmail());
		result.setFullName(entity.getFullName());
		result.setUserName(entity.getUserName());
		result.setPassword(passwordEncoder.encode(entity.getPassword()));
		return result;	
	}

	public UserEntity toEntity(UserDTO dto) {
		UserEntity result = new UserEntity();
		result.setEmail(dto.getEmail());
		result.setFullName(dto.getFullName());
		result.setUserName(dto.getUserName());
		result.setPassword(passwordEncoder.encode(dto.getPassword()));
		return result;
	}
}
