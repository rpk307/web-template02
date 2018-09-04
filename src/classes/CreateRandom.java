package classes;


import java.security.SecureRandom;

import static java.lang.Math.abs;

public class CreateRandom {

    public static String randomString(){
        char[] values = new char[]{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
                'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C' ,'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
                'L', 'M', 'N', '0', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5',
                '6', '7', '8', '9', '-', '~'};
        byte[] randomBytes = randomBytes();
        StringBuilder randomString = new StringBuilder();
        for(byte b: randomBytes){
            randomString.append(values[abs(b % 64)]);
        }
        return randomString.toString();
    }

    private static byte[] randomBytes(){
        byte[] bytes = new byte[20];
        SecureRandom random = new SecureRandom();
        random.nextBytes(bytes);
        return bytes;
    }
}
