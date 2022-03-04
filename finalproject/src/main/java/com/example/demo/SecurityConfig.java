package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		
		http.authorizeHttpRequests()
		.mvcMatchers("/view/**","/images/**","/join","/login","/searchId","/searchIdOK","/searchPwd","/searchPwdOK","/updatePwd","/insertSG","/deleteSG","/listOfSG","/insertSGC","/updateSGC","/deleteSGC","/id_check","/sendNumber","/nickname_check","/loginKakaoOK","/getRestInfo","/listRestReview").permitAll()
		.anyRequest().authenticated();
		
		http.formLogin().loginPage("/login")
		.defaultSuccessUrl("/loginOK");
		
		http.logout()
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout")) 
		.invalidateHttpSession(true)
		.logoutSuccessUrl("/login");
		
		http.csrf().ignoringAntMatchers("/insertSGC");
		http.csrf().ignoringAntMatchers("/deleteSG");
		http.csrf().ignoringAntMatchers("/updateSGC");
		http.csrf().ignoringAntMatchers("/deleteSGC");
		http.csrf().ignoringAntMatchers("/listRestReview");
		http.httpBasic(); 
		
		
	}
	
	
}
