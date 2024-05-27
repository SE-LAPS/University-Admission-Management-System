package com.youpassed.controller;

import com.youpassed.domain.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationFacade {
	public Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}

	public User getPrincipalUser() {
		return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
