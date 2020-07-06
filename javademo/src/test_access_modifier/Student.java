package test_access_modifier;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Student implements Cloneable {
    public static void main(String[] args) throws CloneNotSupportedException {
        String text1 = "Hello java regex 2-12-2018, hello world 12/12/2018";
        String text2 = "2-12-2018";
        Pattern pattern = Pattern.compile("\\d{1,2}[-|/]\\d{1,2}[-|/]\\d{4}");
        Matcher matcher = pattern.matcher(text2);

        boolean x = matcher.matches();
        System.out.println(x);

//        System.out.println("Ngày tháng trong chuỗi text1: " + text1);
//        while (matcher.find()) {
//            System.out.println(text1.substring(matcher.start(), matcher.end()));
//        }
//
//        String text2 = "2/12/2018";
//        String text3 = "12/12/aaaa";
//        pattern = Pattern.compile("^\\d{1,2}[-|/]\\d{1,2}[-|/]\\d{4}$");
//        System.out.println("\nChuỗi " + text2 + " có định dạng ngày tháng: "
//                + pattern.matcher(text2).matches());
//
//        System.out.println("Chuỗi " + text3 + " có định dạng ngày tháng: "
//                + pattern.matcher(text3).matches());
    }
}
