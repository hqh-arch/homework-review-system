package com.ruoyi.hello.test;

public class IfElse {

    public static void main(String[] args) {
        int x = 10;
        if (x < 20) {
            System.out.print("x < 20");
        } else {
            System.out.println("x >= 20");
        }
        if (x > 0) {
            System.out.println("x > 0");
        } else {
            System.out.println("x <= 0");
            if (x > -10) {
                System.out.println("x > -10");
            } else {
                System.out.println("x <= -10");
            }
        }
    }
}
