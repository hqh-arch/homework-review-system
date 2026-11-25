package com.ruoyi.hello.test;

public class Tools {


    //自定义一个方法，返回一个整数，两个整数的参数
    public static int add(int a, int b) {
        return a + b;
    }

    //自定义一个方法，返回一个浮点数，两个浮点数的参数
    public static double addDouble(double a, double b) {
        return a + b;
    }

    // 自定义一个方法，无返回
    public static void barking(String voice) {
        System.out.println(voice);
    }


    public static void prn(String message) {
        System.out.println(message);
    }

    public static void main(String[] args) {
    }
}
