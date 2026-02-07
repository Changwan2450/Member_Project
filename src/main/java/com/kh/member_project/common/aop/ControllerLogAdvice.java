package com.kh.member_project.common.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Component
public class ControllerLogAdvice {

    @Before("execution(* com.kh.member_project.controller..*(..))")
    public void logBeforeController() {
        log.info("Controller method is being called.");
    }
}