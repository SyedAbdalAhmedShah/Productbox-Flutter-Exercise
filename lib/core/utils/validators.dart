import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:productbox_flutter_exercise/core/utils/extensions.dart';

class AppValidators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldNotEmpty;
    } else if (!value.isValidEmail) {
      return AppStrings.fieldNotValid;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null) {
      return AppStrings.fieldNotEmpty;
    } else if (value.isEmpty) {
      return AppStrings.fieldNotEmpty;
    } else {
      return null;
    }
  }
}
