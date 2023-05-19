import 'package:sqflite/sqflite.dart';

class DatabaseErrorHandler {
  static String getErrorMessage(dynamic e) {
    if (e is DatabaseException) {
      if (e.isUniqueConstraintError()) {
        return "Já existe um item com esse campo.";
      } else if (e.isNotNullConstraintError()) {
        return "Preencha todos os campos obrigatórios.";
      }
    } else if (e is FormatException) {
      return "Ocorreu um erro de formato.";
    }

    return "Ocorreu um erro ao salvar os dados. Por favor, tente novamente.";
  }
}
