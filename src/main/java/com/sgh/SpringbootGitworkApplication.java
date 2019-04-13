package com.sgh;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.sgh.dao")
public class SpringbootGitworkApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootGitworkApplication.class, args);
    }

}
