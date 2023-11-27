class InputValidation {
  static bool isPasswordValid(String password) {
    if (password.length < 8) {
      return false;
    }
    return true;
  }

  static bool isEmailValid(String email) {
    if (email.isEmpty) {
      return false;
    } else if (!email.contains("@")) {
      return false;
    }
    return true;
  }
}