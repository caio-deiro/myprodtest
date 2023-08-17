class AppDioError implements Exception {
  final String message;
  final StackTrace? stk;
  AppDioError(this.message, [this.stk]);
}
