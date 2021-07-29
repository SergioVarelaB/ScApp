class Response<T> {
  final bool error;
  final String message;
  final T? data;

  Response({
    required this.data,
    required this.message,
    required this.error
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(data: json['data'], message: json['message'], error: json['error']);
  }
}