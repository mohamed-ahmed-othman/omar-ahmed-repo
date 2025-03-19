class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*()_+])[A-Za-z\d!@#\$%^&*()_+]{8,}$')
        .hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static bool hasLowercase(String password) {
    return RegExp(r'(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUppercase(String password) {
    return RegExp(r'(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasSpecialCharacters(String password) {
    return RegExp(r'(?=.*[!@#\$%^&*()_+])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'(?=.*\d)').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'(?=.{8,})').hasMatch(password);
  }
}
