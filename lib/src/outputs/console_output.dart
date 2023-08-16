import 'package:logger_plus/logger_plus.dart';

/// Default implementation of [LogOutput].
///
/// It sends everything to the system console.
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(print);
  }
}
