abstract class Validation {
  static String? general(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter a value";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter a value";
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter a value";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter a value";
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter a value";
    }
    return null;
  }
}
