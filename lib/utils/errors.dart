import 'package:logger/logger.dart';

import '../core/models/network_response.dart';
import 'snackbars.dart';

void throwApiError(NetworkResponse res) {
  throw ('${res.error}');
}

void showError(String function, Object e) {
  final Logger logger = Logger();
  final String err = e.toString();

  switch (err) {
    default:
      errorSnackbar(error: err);

      return logger.e('CATCH: $function(), ${e}');
  }
}
