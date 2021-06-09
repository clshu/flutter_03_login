class ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    if (!value.contains("@")) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
       return 'Please enter password';
    }
    if (value.length < 4) {
       return 'Password has to have at least 4 characters';
    }
    return null;
  }

}