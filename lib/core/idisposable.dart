/// Interface for all the classes which don't have state but need evantual disposing
abstract interface class IDisposable {
  Future<void> dispose();
}
