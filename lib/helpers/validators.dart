import 'package:validators/sanitizers.dart';

class Validators {
  static String _sanitizeEmail(String value) => normalizeEmail(trim(value));
  static String emailValidator(String value) {
    final sanitizedEmail = _sanitizeEmail(value);
    if (sanitizedEmail.isEmpty) return 'Insira um endereço de email válido';

    return null;
  }

  static String _sanitizePassword(String value) => trim(value);
  static String passwordValidator(String value) {
    final sanitizedPassword = _sanitizePassword(value);
    if (sanitizedPassword.isEmpty) return 'Insira uma senha';
    if (sanitizedPassword.length < 6)
      return 'Senha deve ter pelo menos 6 caracteres';

    return null;
  }
}

class Transformers {
  static String capitalize(String string) {
    if (string == null || string.isEmpty) return string;
    return string[0].toUpperCase() + string.substring(1);
  }
}
