package com.trifulcas.Acme.com.config;

//import org.springframework.context.annotation.Bean;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;

@Configuration
@EnableWebSecurity
public class SeguridadConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource securityDataSource;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/").hasRole("COLABORADOR")
		.antMatchers("/editor/**").hasRole("EDITOR")
		.antMatchers("/admin/**").hasRole("ADMIN")
		.and().formLogin().loginPage("/formLogin")
		.loginProcessingUrl("/authenticateTheUser")
		.permitAll()
		.and().logout().permitAll()
		.and().exceptionHandling().accessDeniedPage("/prohibido");
	}
	
	//@Override
	//protected void configure(AuthenticationManagerBuilder auth) throws
	//Exception {
	//  auth.inMemoryAuthentication().passwordEncoder(passwordEncoder()).withUser("juan").password(passwordEncoder().encode("1234")).roles("COLABORADOR");	  
	//  auth.inMemoryAuthentication().passwordEncoder(passwordEncoder()).withUser("ana").password(passwordEncoder().encode("1234")).roles("COLABORADOR","EDITOR");	  
	//  auth.inMemoryAuthentication().passwordEncoder(passwordEncoder()).withUser("eva").password(passwordEncoder().encode("1234")).roles("COLABORADOR","ADMIN");  
	//}
	//@Bean
	//public PasswordEncoder passwordEncoder() {
	//	return new BCryptPasswordEncoder();
	//}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	auth.jdbcAuthentication().dataSource(securityDataSource);
	}


}
