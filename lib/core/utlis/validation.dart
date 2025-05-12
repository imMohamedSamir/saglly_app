abstract class Validation {
  static String? general(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter a value";
    }
    return null;
  }
}
