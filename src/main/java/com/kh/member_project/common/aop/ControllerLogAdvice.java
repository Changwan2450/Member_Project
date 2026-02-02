package com.kh.member_project.common.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Slf4j
@Aspect
@Component
public class ControllerLogAdvice {

    // 패키지 하위의 모든 컨트롤러 메서드 타겟팅
    // controller 패키지 "및 그 하위의 모든 패키지(..)"를 포함하도록 수정
    @Before("execution(* com.kh.member_project.controller..*.*(..))")
    public void logController(JoinPoint jp) {
        log.info("==========================================");
        log.info("📡 [Controller Start]");
        // 어느 클래스의 어느 메서드인지 자동 추출
        log.info("🎯 Location : " + jp.getSignature().getDeclaringTypeName() + "." + jp.getSignature().getName());
        // 들어온 파라미터(Args)들 싹 다 보여줌
        log.info("📦 Arguments: " + Arrays.toString(jp.getArgs()));
        log.info("==========================================");
    }
}