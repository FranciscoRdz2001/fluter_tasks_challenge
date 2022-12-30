class ApiResponseModel {
  final int statusCode;
  final bool hasErrors;
  final String message;

  const ApiResponseModel({
    required this.hasErrors,
    required this.message,
    required this.statusCode,
  });

  @override
  String toString() =>
      'Details: $message - Code: $statusCode - Has Errors: $hasErrors';
}
