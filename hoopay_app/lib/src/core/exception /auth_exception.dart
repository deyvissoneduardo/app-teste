class AuthException implements Exception {
  final String message;

  AuthException({required this.message});
}

class AuthUnauthorized extends AuthException {
  AuthUnauthorized() : super(message: '');
}
