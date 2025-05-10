abstract class Validation {
  static String? general(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى ادخال البيانات";
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى ادخال الاسم بالكامل";
    } else if (value.length < 3) {
      return "يرجى ادخال اسم صحيح";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى ادخال البريد الالكتروني";
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return "يرجى ادخال بريد الكتروني صحيح";
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى ادخال رقم الهاتف";
    } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
      return "يرجى ادخال رقم هاتف صحيح";
    }
    return null;
  }

  static String? nationalIdOrPassport(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى ادخال الرقم القومي ";
    }

    final isNid = RegExp(r'^\d{14}$');

    if (!isNid.hasMatch(value)) {
      return "يرجى ادخال رقم قومي  صحيح";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى ادخال كلمة المرور";
    } else if (value.length < 8) {
      return "يرجى ادخال كلمة مرور صحيحة";
    }

    return null;
  }
}
