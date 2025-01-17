import 'dart:collection';

import 'package:logger_plus/logger_plus.dart';

/// Buffers [OutputEvent]s.
class MemoryOutput extends LogOutput {
  /// Maximum events in [buffer].
  final int bufferSize;

  /// A secondary [LogOutput] to also received events.
  final LogOutput? secondOutput;

  /// The buffer of events.
  final ListQueue<OutputEvent> buffer;

  MemoryOutput({this.bufferSize = 20, this.secondOutput}) : buffer = ListQueue(bufferSize);

  @override
  void output(OutputEvent event) {
    if (buffer.length == bufferSize) {
      buffer.removeFirst();
    }

    buffer.add(event);

    secondOutput?.output(event);
  }
}
