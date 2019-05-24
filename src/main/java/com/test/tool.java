package com.test;


import java.util.UUID;

public class tool {
    public static String generateID(){
        return UUID.randomUUID().toString();
    }
}
