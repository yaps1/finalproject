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
		.mvcMatchers("/images/**","/main","/join","/login","/searchId","/searchIdOK","/searchPwd","/searchPwdOK","/updatePwd","/insertSG","/deleteSG","/listOfSG","/insertSGC","/updateSGC","/deleteSGC","/id_check","/sendNumber","/nickname_check","/kakao_login","/getRestInfo","/listRestReview","/managerListMember","/KakaoLoginOK").permitAll()
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
		http.csrf().ignoringAntMatchers("/insertNotice");
		http.csrf().ignoringAntMatchers("/insertGoods");
		http.csrf().ignoringAntMatchers("/deleteListMember");
		http.csrf().ignoringAntMatchers("/insertRestReview");
		http.csrf().ignoringAntMatchers("/nicknameCheck");
		http.csrf().ignoringAntMatchers("/deleteGB");
		http.csrf().ignoringAntMatchers("/getRoom");
		http.csrf().ignoringAntMatchers("/createRoom");
		http.csrf().ignoringAntMatchers("/insertChatMessage");
		http.csrf().ignoringAntMatchers("/insertChatImage");
		http.csrf().ignoringAntMatchers("/deleteGBC");
		http.csrf().ignoringAntMatchers("/listChatMessage");

		http.httpBasic(); 
		
		
	}
	
	
}
