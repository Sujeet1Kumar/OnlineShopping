package com.project.config;

import java.util.Properties;
import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.model.Product;
import com.project.model.User;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.project" })
@EnableTransactionManagement
public class AppConfig implements WebMvcConfigurer {

	// add static resources
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		// Register resource handler for CSS and JS
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/views/images/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/views/js/");
		registry.addResourceHandler("/productimages/**").addResourceLocations("/productimages/")
				.setCacheControl(CacheControl.maxAge(365, TimeUnit.DAYS));
		;
	}

	/*
	 * @Bean public InternalResourceViewResolver internalResourceViewResolver() {
	 * return new InternalResourceViewResolver("/WEB-INF/views/", ".jsp"); }
	 */

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/onlineshopping");
		dataSource.setUsername("root");
		dataSource.setPassword("root");
		System.out.println(dataSource);
		return dataSource;
	}

	private Properties hibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		properties.put("hibernate.hbm2ddl.auto", "update");
		System.out.println(properties);
		return properties;
	}

	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan(new String[] { "com.project.model" });
		// sessionFactory.setAnnotatedClasses(User.class,Book.class);
		sessionFactory.setHibernateProperties(hibernateProperties());
		System.out.println(sessionFactory);
		return sessionFactory;
	}

	@Bean
	public HibernateTransactionManager getTransactionManager() {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory().getObject());
		System.out.println(transactionManager);
		return transactionManager;
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver cm = new CommonsMultipartResolver();
		cm.setMaxUploadSize(5008528);
		return cm;
	}
}
