package com.ruoyi.hello.test;

import com.ruoyi.hello.test.domain.Dog;
import com.ruoyi.hello.test.domain.Donkey;
import com.ruoyi.hello.test.domain.PersonDomain;

public class DataType {

    //自定义一个方法，返回一个整数
    //public static int add(int a, int b) {
//        return a + b;
//    }

    // 自定义一个方法，无返回
//    public void barking(String voice) {
//        System.out.println(new Throwable().getStackTrace()[0] + ", " + voice);
//    }

    public static void main(String[] args) {
//        System.out.println("for循环");
//        // x++ <==> x = x + 1
//        for (int i = 0; i < 10; i++) {
//            System.out.println("i = " + i);
//        }
//        System.out.println("while循环");
//        int i = 0;
//        while (i < 10) {
//            System.out.println("i = " + i);
//            i++;
//        }
//        System.out.println("do while循环");
//        int j = 100;
//        do {
//            System.out.println("j = " + j);
//            j++;
//        } while (j < 10);
//

// ============================  类和对象 begin ==========================

        Dog dog = new Dog();
        dog.setType("金毛");
        dog.setName("小黄");
        dog.setMaose("金黄");
//        System.out.println("dog = " + dog);
//        dog.barking("汪");
//        dog.ywb();

        //继承
        Donkey donkey = new Donkey();
        donkey.setName("小小小小小黑");
        donkey.setAge(3);
        donkey.setType("长毛");
        //只能打印出来它自有的属性值
        //System.out.println("vo = " + vo);
        //但继承的属性值是可以取得的
        //System.out.println("vo.name = " + vo.getName());

        //调用自有方法
        //donkey.lamo(365);
        //调用继承的方法
        //donkey.xiao("【嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿】");

        //创建一个person对象，他拥有一条狗，一头驴，狗叫，驴叫，驴lamo
        PersonDomain person = new PersonDomain();
        person.setName("张三");
        person.setAge(18);
        person.setSex("男");
        person.setDog(dog);
        person.setDonkey(donkey);
        //System.out.println("person = " + person);
        System.out.println("原来person.donkey.name = " + person.getDonkey().getName());
        person.setName("老登");
        person.getDonkey().setName("小黑");
        System.out.println("person.name = " + person.getName());
        System.out.println("现在person.donkey.name = " + person.getDonkey().getName());
        //person.getDonkey().lamo(365);


// ============================  类和对象 end ==========================

//        //调用另外一个文件的方法
//        int res = 0;
//
//        res = add(1, 100);
//
//        barking("hello, world");
//
//        double d = addDouble(1, 2.2);
//
//        System.out.println("1 + 2.2 = " + d);

/*
        String ren = "张三";
        boolean isGoodMan = true;// 布尔值，是不是好人
        System.out.println(new Throwable().getStackTrace()[0] + ", ren = " + ren + ", isGoodMan = " + isGoodMan);
        // 字符串
        String message = "hello, world";
        System.out.println(new Throwable().getStackTrace()[0] + ", " + message);
        String name = "张总";
        // 整数
        int age = 55;
        System.out.println(new Throwable().getStackTrace()[0] + ", age = " + age);
        // 浮点数（小数，用double足够大了）
        double height = 1.78;
        System.out.println(new Throwable().getStackTrace()[0] + ", height = " + height);

        // 字符串拼接 //是行注释
        System.out.println("名字name = " + name + ", 年龄 age = " + age + ", 身高 height = " + height);
 */
        // 遍历数组
        String persons[] = {"张三", "张三丰", "张三二"};
        for (String per : persons) {
            System.out.println(per);
        }
        // 顺序输出数组,不推荐
        for (int i = 0; i < persons.length; i++) {
            System.out.println(persons[i]);
        }

//        System.out.println("遍历数据 persons[]，个数 = " + persons.length);

//        for (int i = 0; i < persons.length; i++) {
//            System.out.println("persons[" + i + "] = " + persons[i]);
//        }
        //引用数组的某个元素
//        System.out.println("persons[3] = " + persons[2]);
        // 遍历数据方法2
//        for (String p : persons) {
//            System.out.println(new Throwable().getStackTrace()[0] + ", p = " + p);
//        }
//        prn("真是个好日子！");
//        prn("hello, world");
    }

}
