class ArmstrongNumbers {

	boolean isArmstrongNumber(int numberToCheck) {
		return numberToCheck == calculateArmstrongNumber(numberToCheck);
	}

	private int calculateArmstrongNumber(int inputNumber) {
		String digits = String.valueOf(inputNumber);
		int num_digits = digits.length();

		return digits.chars().parallel()
			.map(digit -> (int) Math.pow(Character.getNumericValue(digit), num_digits))
			.sum();
	}

}
