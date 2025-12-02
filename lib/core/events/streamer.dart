// Flutter & Dart
import 'dart:async';
// TimerUp
import 'package:timer_up/core/idisposable.dart';

/// Event manager
final class Streamer<M> implements IDisposable {
  late final StreamController<M> _contoller;
  final Map<int, StreamSubscription<M>> _subscriptions = {};

  Streamer() {
    _contoller = StreamController<M>.broadcast();
  }

  void subscribe(Future<void> Function(M args) method) {
    var hc = method.hashCode;

    if (!_subscriptions.containsKey(hc)) {
      _subscriptions[hc] = _contoller.stream.listen(method);
    }
  }

  Future<void> unsubscribe(Future<void> Function(M args) method) async {
    var hc = method.hashCode;
    var sub = _subscriptions[hc];
    if (sub != null) {
      await sub.cancel();
      _subscriptions.remove(hc);
    }
  }

  void stream(M args) => _contoller.add(args);

  @override
  Future<void> dispose() async {
    for (var sub in _subscriptions.values) {
      await sub.cancel();
    }

    _subscriptions.clear();

    await _contoller.close();
  }
}
