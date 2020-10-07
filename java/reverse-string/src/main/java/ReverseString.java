
class ReverseString {

    String reverse(String inputString) {
        StringBuilder reversedString = new StringBuilder();

        for (int i = inputString.length(); i > 0; i--) {
            reversedString.append(inputString.charAt(i - 1));
        }

        return reversedString.toString();
    }

}