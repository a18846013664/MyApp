package com.log;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

//采用注解实现aop
//@Aspect  声明一个切面
@Component
@Aspect
public class Log {
    @Pointcut("execution(* com.service.*.*(..))")
    public void declareJointPointExpression(){}
    @Before("declareJointPointExpression()")
    public void before(JoinPoint joinPoint){
        String methodname = joinPoint.getSignature().getName();
        //获取参数：List<Object> args = Arrays.asList(joinPoint.getArgs());
        System.out.println("------"+methodname+"执行前------");
    }
    @After("declareJointPointExpression()")
    public void after(JoinPoint joinPoint){
        String methodname = joinPoint.getSignature().getName();
        System.out.println("------"+methodname+"执行后------");
    }
}
