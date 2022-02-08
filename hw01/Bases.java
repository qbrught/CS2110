/**
 * CS 2110 Fall 2021 HW1
 * Part 2 - Coding with bases
 *
 * @author Quincy Bright
 *
 * Global rules for this file:
 * - You may not use more than 2 conditionals per method. Conditionals are
 *   if-statements, if-else statements, or ternary expressions. The else block
 *   associated with an if-statement does not count toward this sum.
 * - You may not use more than 2 looping constructs per method. Looping
 *   constructs include for loops, while loops and do-while loops.
 * - You may not use nested loops.
 * - You may not declare any file-level variables.
 * - You may not use switch statements.
 * - You may not use the unsigned right shift operator (>>>)
 * - You may not write any helper methods, or call any method from this or
 *   another file to implement any method. Recursive solutions are not
 *   permitted.
 * - The only Java API methods you are allowed to invoke are:
 *     String.length()
 *     String.charAt()
 * - You may not invoke the above methods from string literals.
 *     Example: "12345".length()
 * - When concatenating numbers with Strings, you may only do so if the number
 *   is a single digit.
 *
 * Method-specific rules for this file:
 * - You may not use multiplication, division or modulus in any method, EXCEPT
 *   decimalStringToInt (where you may use multiplication only)
 * - You may declare exactly one String variable each in intToHexString and
 *   and binaryStringToOctalString.
 */
public class Bases
{
    /**
     * Convert a string containing ASCII characters (in binary) to an int.
     *
     * You do not need to handle negative numbers. The Strings we will pass in
     * will be valid binary numbers, and able to fit in a 32-bit signed integer.
     *
     * Example: binaryStringToInt("111"); // => 7
     */
    public static int binaryStringToInt(String binary)
    {
        int count = 0;
        int base = 1;
        for (int point = binary.length()-1;point >= 0; point--) {
            if (binary.charAt(point) == '1') {
                count += base;
            }
            base = base << 1;
        }
        return count;
    }

    /**
     * Convert a string containing ASCII characters (in decimal) to an int.
     *
     * You do not need to handle negative numbers. The Strings we will pass in
     * will be valid decimal numbers, and able to fit in a 32-bit signed integer.
     *
     * Example: decimalStringToInt("46"); // => 46
     *
     * You may use multiplication in this method.
     */
    public static int decimalStringToInt(String decimal)
    {
        int total = 0;
        int count = 1;
        int temp;
        for (int point = decimal.length()-1; point >= 0; point--) {
            temp = decimal.charAt(point) - '0';
            total += temp * count;
            count *=10;
        }
        return total;
    }

    /**
     * Convert a string containing ASCII characters (in octal) to an int.
     *
     * You do not need to handle negative numbers. The Strings we will pass in
     * will be valid octal numbers, and able to fit in a 32-bit signed integer.
     *
     * Example: octalStringToInt("27"); // => 23
     */
    public static int octalStringToInt(String octal)
    {
        int oct = 0;
        int count = 0;
        for (int point = octal.length()-1; point >= 0; point--) {
            oct += ((octal.charAt(point) - '0')  << count);
            count += 3;
        }
        return oct;
    }

    /**
     * Convert a int into a String containing ASCII characters (in hex).
     *
     * You do not need to handle negative numbers.
     * The String returned should contain the minimum number of characters
     * necessary to represent the number that was passed in.
     *
     * Example: intToHexString(166); // => "A6"
     *
     * You may declare one String variable in this method.
     */
    public static String intToHexString(int hex)
    {
        String converted = "";
        int count = 0;
        char newcount = '0';
        char ascii = '0';
        while (hex >= 16) {
            count = hex - ((hex >> 4) << 4);
            hex >>= 4;
            if (count > 9) {
                newcount = (char)(count +55);
                converted = newcount + converted;
            }
            else {
                converted = count + converted;
            }

        }
        if (hex > 9) {
            ascii = (char) (hex + 55);
            converted = ascii + converted;
        }
        else {
            converted = hex + converted;
        }
        return converted;
    }

    /**
     * Convert a String containing ASCII characters representing a number in
     * binary into a String containing ASCII characters that represent that same
     * value in octal.
     *
     * The output string should only contain numbers.
     * You do not need to handle negative numbers.
     * The length of all the binary strings passed in will be of size 24.
     * The octal string returned should contain 8 characters.
     *
     * Example: binaryStringToOctalString("000001101010000111100100"); // => "01520744"
     *
     * You may declare one String variable in this method.
     */
    public static String binaryStringToOctalString(String binary)
    {
        String oct  = "";
        int count = 0;
        int temp = 0;
        for (int point = binary.length()-1 ; point >= 0; point--) {
            if (count > 2) {
                count = 0;
                oct = temp + oct;
                temp = 0;

            }
            temp += ((binary.charAt(point) - '0') << count);
            count++;
        }
        return temp + oct;
    }
}
