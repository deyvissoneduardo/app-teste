// ignore_for_file: public_member_api_docs, sort_constructors_first
class RepositoryException implements Exception {
  final String? message;
  final int? code;

  RepositoryException({
    this.message,
    this.code,
  });

  @override
  String toString() => 'RepositoryException(message: $message, code: $code)';
}
